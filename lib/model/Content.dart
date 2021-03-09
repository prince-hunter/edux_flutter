// Copyright (C) irocn 2020-
import 'dart:async';
import 'dart:ffi';

import 'package:edux_app/api/ipfs_api_v1.dart';
import 'package:flutter/material.dart';

List<String> ContentTopics = [
  'All',
  'Computer Science',
  'History',
  'Art',
  'Technology',
  'Math',
  'Network'
];

class Content extends Object {
   Content( {
    this.type,
    this.title,
    this.category,
    this.hashcode,
    this.owner,
    this.source,
    this.url,
    this.copyright
  });
  String type;               // ex: news, article, video, music, document
  String category;           // ex: Computer_Science, Math, Art, History, Technology
  String title;
  String source;
  String owner;
  String hashcode;
  String url;
  String copyright;
}

class VideoX extends Content {

  VideoX({
    this.topic_icon,
    this.thumbnail,
    this.duration,
    this.views,
    this.upload_day,
    url,
    title,
    owner,
    copyright,
    hashcode,
  }):super(url: url, title: title, owner: owner,copyright: copyright, hashcode: hashcode);

  final String thumbnail;
  final String duration;
  final int views;
  final int upload_day;
  final String topic_icon;

  Future<StreamController<List>> getFilesItems({String path}) async {
    List<VideoX> videos = [];
    StreamController<List> _filesController = new StreamController<List>();
    await IpfsApi().listFiles(filePath:path).then((e) {
      if ( e['Entries'] == null ) return;
      var f = e['Entries'] as List;
      f.forEach((file) {
        videos.add(
            VideoX(
              title: "2021 最新电影喜剧【唐人街探案3】 继曼谷之后纽约以及东京再出大案！喜剧悬疑侦探剧情片 720P高清完整",
              url: "https://www.irocn.cn/static/media/uploads/app/tangren3.png",
              thumbnail: "https://www.irocn.cn/static/media/uploads/app/tangren3.png",
              topic_icon: "https://www.irocn.cn/static/media/uploads/app/art.jpeg",
              views: 10,
              upload_day: 1,
              duration: "30:20",
                owner: "王宝强",
                copyright: "open"
            ));
      });
    }).whenComplete(() {
      _filesController.add(videos);
    });
    return _filesController;
  }
}

class MusicX extends Content {

}

class ArticleX extends Content {

}

class NewsX extends Content {

}

