import 'package:bayker/models/feed.dart';
import 'package:firebase_database/firebase_database.dart';

class FeedRepository{
  DatabaseReference _dataBase;
  FeedRepository(this._dataBase);

  createFeed(Feed feed){
    _dataBase.child("feeds").push().set(feed.toJson());
  }

  deleteFeed(Feed feed){
    _dataBase.child("feeds").child(feed.key).push().remove();
  }

  updateFeed(Feed feed){
    _dataBase.child("feeds").update(feed.toJson());
  }

  readFeed(){
    return _dataBase.child("feeds");
  }

}