// The copyright (c) irocn 2021-


import 'package:edux_app/ui/AppBar.dart';
import 'file:///C:/Users/Administrator/AndroidStudioProjects/edux_app/lib/ui/cloud/widget/Category.dart';
import 'package:flutter/material.dart';

class CloudX extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CloudXState();
}

class CloudXState extends State<CloudX> with SingleTickerProviderStateMixin {

  Widget _generateCategory(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(                           // 1 Row x 2 Column TextButton
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.agriculture, color: Colors.lightGreen,),
                    Text("Popular"),
                    Image(image: AssetImage('assets/images/logo-200x200.png'), height: 20, width: 80,)
                  ],
                ),
                onPressed: () {},
              ),

              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.sports_basketball, color: Colors.orangeAccent,),
                    Text("Sport"),
                    Image(image: AssetImage('assets/images/logo-200x200.png'), height: 20, width: 80,)
                  ],
                ),
                onPressed: () {},
              ),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,// 2 Row x 2 Column TextButton
            children: [
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.sports_basketball),
                    Text("Sport"),
                    Image(image: AssetImage('assets/images/logo-200x200.png'), height: 20, width: 80,)
                  ],
                ),
                onPressed: () {},
              ),

              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.sports_basketball),
                    Text("Sport"),
                    Image(image: AssetImage('assets/images/logo-200x200.png'), height: 20, width: 80,)
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,// 3 Row x 2 Column TextButton
            children: [
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.sports_basketball),
                    Text("Sport"),
                    Image(image: AssetImage('assets/images/logo-200x200.png'), height: 20, width: 80,)
                  ],
                ),
                onPressed: () {},
              ),

              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.sports_basketball),
                    Text("Sport"),
                    Image(image: AssetImage('assets/images/logo-200x200.png'), height: 20, width: 80,)
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,// 4 Row x 2 Column TextButton
            children: [
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.sports_basketball),
                    Text("Sport"),
                    Image(image: AssetImage('assets/images/logo-200x200.png'), height: 20, width: 80,)
                  ],
                ),
                onPressed: () {},
              ),
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.sports_basketball),
                    Text("Sport"),
                    Image(image: AssetImage('assets/images/logo-200x200.png'), height: 20, width: 80,)
                  ],
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
    );
  }

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

  List<Widget> _generateRelatedViewList(){
    List<Widget> relatedView = [];
    for (int i = 0; i < videos.length; i++) {
      relatedView..add(Column(
        children: <Widget>[
          Container(
            height: 200,
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black87),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  child: Text(videos[i]['Duration'],
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.network(videos[i]['Thumbnail']).image,
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 22,
                  backgroundImage: Image.network(videos[i]['ChannelArt']).image,//AssetImage(videos[i]['ChannelArt']),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          videos[i]['Title'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      videos[i]['ChannelName'] +
                          '\t\t' +
                          videos[i]['Views'] +
                          '\t\t' +
                          videos[i]['Upload'],
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                Icon(Icons.more_vert)
              ],
            ),
          )
        ],
      ));
    }

    return relatedView;
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? 200.0
          : MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
          image: DecorationImage(
              //image: NetworkImage(widget.detail.thumbNail), fit: BoxFit.cover)),
    ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(),
        body: CustomScrollView(
            slivers: [
              SliverFixedExtentList(
                  itemExtent: 295,
                delegate: SliverChildListDelegate( [Category()]..addAll(_generateRelatedViewList()),//SliverChildList([_generateCategory()]..addAll(_generateRelatedViewList()),
              ))
      ]));
  }

}