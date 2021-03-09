// Copyright (C) irocn 2020-

import 'package:flutter/material.dart';

List<Widget> ScreenList;

List<String> ContentTopics = [
  'All',
  'Computer Science',
  'History',
  'Art',
  'Technology',
  'Math',
  'Network'
];

List<Map<String, String>> videos = [
  {
    'Thumbnail': "https://www.irocn.cn/static/media/uploads/app/tangren3.png",
    'ChannelArt': 'https://www.irocn.cn/static/media/uploads/app/math.jpg',
    'Title':
    'Rohit Sharma Hits 140! | India v Pakistan - Match Highlights | ICC Cricket World Cup 2019',
    'ChannelName': 'ICC',
    'Views': '40M views',
    'Upload': '1 year ago',
    'Duration': '4:20'
  },
  {
    'Thumbnail': "https://www.irocn.cn/static/media/uploads/app/%E6%88%91%E5%92%8C%E6%88%91%E5%AE%B6%E4%B9%A1.png",
    'ChannelArt': 'https://www.irocn.cn/static/media/uploads/app/code.jpg',
    'Title':
    '2021贺岁片 最新电影 票房 葛优、黄渤 高分 群星 大咖 演绎 《我和我的家乡》',
    'ChannelName': 'T-Series',
    'Views': '119M views',
    'Upload': '8 months ago',
    'Duration': '3:42'
  },
  {
    'Thumbnail': 'https://www.irocn.cn/static/media/uploads/app/%E4%BD%A0%E5%A5%BD%E6%9D%8E%E7%84%95%E8%8B%B1.jpeg',
    'ChannelArt': 'https://www.irocn.cn/static/media/uploads/app/music.jpg',
    'Title': 'FULL FILM: McLaren Speedtail vs F35 Fighter Jet | Top Gear',
    'ChannelName': 'TopGear',
    'Views': '11M views',
    'Upload': '1 month ago',
    'Duration': '5:23'
  },
  {
    'Thumbnail': 'https://www.irocn.cn/static/media/uploads/app/tangren3.png',
    'ChannelArt': 'https://www.irocn.cn/static/media/uploads/app/history.jpeg',
    'Title': 'Mr. Bean Live Performance at the London 2012 Olympic Games',
    'ChannelName': 'Olympic',
    'Views': '24M views',
    'Upload': '4 years ago',
    'Duration': '10:25'
  },
  {
    'Thumbnail': 'https://www.irocn.cn/static/media/uploads/app/tangren3.png',
    'ChannelArt': 'https://www.irocn.cn/static/media/uploads/app/art.jpeg',
    'Title':
    'Ammy Virk: Main Suneya Video Song Feat. Simran Hundal, Rohaan |SunnyV, Raj |Navjit B | Bhushan Kumar',
    'ChannelName': 'T-Series',
    'Views': '40M views',
    'Upload': '4 weeks ago',
    'Duration': '4:37'
  },
  {
    'Thumbnail': 'https://www.irocn.cn/static/media/uploads/app/tangren3.png',
    'ChannelArt': 'https://www.irocn.cn/static/media/uploads/app/network.jpeg',
    'Title': 'Tonight Showbotics: Jimmy Meets Sophia the Human-Like Robot',
    'ChannelName': 'Jimmy Falcon',
    'Views': '27M views',
    'Upload': '3 years ago',
    'Duration': '39:44'
  },
];