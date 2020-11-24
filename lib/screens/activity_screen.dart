import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixelx/models/activity_model.dart';
import 'package:pixelx/models/post_model.dart';
import 'package:pixelx/models/user_data.dart';
import 'package:pixelx/models/user_model.dart';
import 'package:pixelx/screens/comments_screen.dart';
import 'package:pixelx/services/database_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ActivityScreen extends StatefulWidget {
  final String currentUserId;

  ActivityScreen({this.currentUserId});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<Activity> _activities = [];

  @override
  void initState() {
    super.initState();
    _setupActivities();
  }

  _setupActivities() async {
    List<Activity> activities =
        await DatabaseService.getActivities(widget.currentUserId);
    if (mounted) {
      setState(() {
        _activities = activities;
      });
    }
  }

  _buildActivity(Activity activity) {
    return FutureBuilder(
      future: DatabaseService.getUserWithId(activity.fromUserId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return SizedBox.shrink();
        }
        User user = snapshot.data;
        return Padding(
          padding: const EdgeInsets.only(top: 0,bottom: 1),
          child: ListTile(
            tileColor: Colors.grey.withOpacity(0.3),
            leading: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey,
              backgroundImage: user.profileImageUrl.isEmpty
                  ? AssetImage('assets/images/user_placeholder.jpg')
                  : CachedNetworkImageProvider(user.profileImageUrl),
            ),
            title: (activity.comment != null)
                    ? Text('${user.name} commented: "${activity.comment}"')
                    :(
                      (activity.followed==null)
                      ? Text('${user.name} liked your post')
                      : Text('${user.name} started following you')
                    ),
            subtitle: Text(
              DateFormat.yMd().add_jm().format(activity.timestamp.toDate()),
            ),
            trailing: CachedNetworkImage(
              imageUrl: activity.postImageUrl,
              height: 40.0,
              width: 40.0,
              fit: BoxFit.cover,
            ),
            onTap: () async {
              String currentUserId = Provider.of<UserData>(context).currentUserId;
              Post post = await DatabaseService.getUserPost(
                currentUserId,
                activity.postId,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CommentsScreen(
                    post: post,
                    likeCount: post.likeCount,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Acitivity',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Signatra',
            fontSize: 40.0,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _setupActivities(),
        child: ListView.builder(
          itemCount: _activities.length,
          itemBuilder: (BuildContext context, int index) {
            Activity activity = _activities[index];
            return _buildActivity(activity);
          },
        ),
      ),
    );
  }
}
