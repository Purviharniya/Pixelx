import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelx/models/post_model.dart';
import 'package:pixelx/models/user_model.dart';
import 'package:pixelx/services/database_service.dart';
import 'package:pixelx/utilities/constants.dart';
import 'package:pixelx/widgets/post_view.dart';

class FeedScreen extends StatefulWidget {
  static final String id = 'feed_screen';
  final String currentUserId;

  FeedScreen({this.currentUserId});

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<String> followingUIDs = List<String>();
  List<Post> _posts = [];
  List<Post> _finalposts = [];
  User postauthor;
  List<PostView> postViews = [];

  @override
  void initState() {
    super.initState();
    fetchFeed();
  }

  void fetchFeed() async {
    followingUIDs =
        await DatabaseService.fetchFollowingUids(widget.currentUserId);
    print("uids: $followingUIDs");  //got the following uids
 
    for (var i = 0; i < followingUIDs.length; i++) {  //looped through each one of them
      print("DSDASDASD : ${followingUIDs[i]}");   

      List<Post> posts = await DatabaseService.getUserPosts(followingUIDs[i]);  //got their posts 
      setState(() {
        _posts = posts;  //added those to a list
        _finalposts.addAll(_posts); 
      });
    }

    _finalposts.forEach((post) async {
      postauthor = await DatabaseService.getUserWithId(post.authorId); //got the user object of the following 
      // print(post.authorId);
      // print(post.caption);
      // print(post.likeCount);
      // print(postauthor.email);

      postViews.add(  //created a list of postviews
          PostView(
            currentUserId: widget.currentUserId,
            post: post,
            author: postauthor,
          ),
      );
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'PixelX',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Signatra',
            fontSize: 40.0,
          ),
        ),
      ),
      body:_finalposts.isEmpty? SvgPicture.asset(
                'assets/images/no_content.svg',
                semanticsLabel: 'Acme Logo'
              ): FutureBuilder(
        future: followingRef.getDocuments(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: <Widget>[
              Column(
                children: postViews,
              )
            ],
          );
        },
      ),
    );
  }
}
