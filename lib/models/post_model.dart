import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String imageUrl;
  final String location;
  final String caption;
  final int likeCount;
  final String authorId;
  final Timestamp timestamp;

  Post({
    this.id,
    this.imageUrl,
    this.location,
    this.caption,
    this.likeCount,
    this.authorId,
    this.timestamp,
  });

  factory Post.fromDoc(DocumentSnapshot doc) {
    return Post(
      id: doc.documentID,
      imageUrl: doc['imageUrl'],
      caption: doc['caption'],
      location: doc['location'],
      likeCount: doc['likeCount'],
      authorId: doc['authorId'],
      timestamp: doc['timestamp'],
    );
  }
}
