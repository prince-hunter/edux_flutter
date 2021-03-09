import 'dart:async';

import 'package:edux_app/api/ipfs_api_v1.dart';
import 'package:edux_app/features/VideoPlayerX.dart';
import 'package:edux_app/model/Content.dart';
import 'package:edux_app/model/Resource.dart';
import 'package:edux_app/tool/loadingDots/loadingDots.dart';
import 'package:edux_app/ui/AppBar.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:flutter/material.dart';

import 'PayingDetail.dart';

void main() {
  runApp(MaterialApp(
    title: 'EduX 2.0',
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  StreamController<List> _filesController = new StreamController<List>();
  List files = [];

  int present = 0;
  int perPage = 10;
  final originalItems = List<String>.generate(21, (i) => "Item $i");
  var items = [];

  TabController _tabController;
  int _bottomIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _bottomIndex = index;
    });
  }

  Future  getFilesItems({String path}) async {

    await IpfsApi().listFiles(filePath:path).then((e) {
      if ( e['Entries'] == null ) return;
      var f = e['Entries'] as List;
      f.forEach((file) {
        files.add(
            VideoX(
                title: file['Name'],
                url: "https://www.irocn.cn/static/media/uploads/app/tangren3.png",
                thumbnail: "https://www.irocn.cn/static/media/uploads/app/tangren3.png",
                topic_icon: "https://www.irocn.cn/static/media/uploads/app/art.jpeg",
                views: 10,
                upload_day: 1,
                duration: "30:20",
                owner: "王宝强",
                copyright: "open",
                hashcode: file['Hash']

            ));
      });
    })
        .whenComplete(() {
      _filesController.add(files);
    }
    );
  }

  @override
  void initState() {
    _tabController =
    new TabController(length: ContentTopics.length, vsync: this, initialIndex: 0);

    items.addAll(originalItems.getRange(present, present + perPage));
    present = present + perPage;

    getFilesItems(path:Resource.file_current_dir);
    super.initState();
  }


  List<Widget> _generateVideos(List<dynamic> _list)  {
    //List<dynamic> _list = await VideoX().getFilesItems(path: Resource.file_current_dir);

    List<Widget> videosWidgets = [];
    for (int i = 0; i < _list.length; i++) {
      videosWidgets.add(Column(
        children: <Widget>[
          InkWell(
            child: Container(
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
                    child: Text(_list[i].duration.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.network(_list[i].thumbnail).image,
                      fit: BoxFit.cover)),
            ),
            onTap: (){
              if (_list[i].title.contains(new RegExp(r'\.(?:mp4|mp3|mov|mkv)'))){
                Navigator.push(context, new MaterialPageRoute(builder: (_) => VideoPlayerX(_list[i].hashcode, _list[i].title)));
            }}
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: Image.network(_list[i].topic_icon).image,
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            _list[i].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        _list[i].views.toString() +
                            '\t\t' +
                            _list[i].upload_day.toString(),
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
            ),
            onTap: (){
              logger.d("$i");
            },
          ),

        ],
      ));
    }
    return videosWidgets;
  }

  void loadMore() {
    setState(() {
      if((present + perPage )> originalItems.length) {
        items.addAll(
            originalItems.getRange(present, originalItems.length));
      } else {
        items.addAll(
            originalItems.getRange(present, present + perPage));
      }
      present = present + perPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: generateAppBar(),
          body: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  loadMore();
                }
                return true;
              },
              child:StreamBuilder(
                stream: _filesController.stream,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  return ListView.builder(
                    itemCount: (present <= originalItems.length) ? items.length + 1 : items.length,
                    itemBuilder: (context, index) {
                      if ( snapshot.data == null ){
                        return LoadingDots();
                      }
                      return (index == items.length ) ?
                      Container(
                        child: TextButton(
                          child: Center(
                            child: Text("== $present/${items.length} =="),
                          ),
                        ),
                      ): Column(
                        children: _generateVideos(snapshot.data),
                      );
                    },
                  );
                },
              ),
          )
          )
    );
  }
}
