import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:edux_app/api/ipfs_api_v1.dart';
import 'package:edux_app/conf/config.dart';
import 'package:edux_app/features/PhotoPlayer.dart';
import 'package:edux_app/features/VideoPlayerX.dart';
import 'package:edux_app/model/Resource.dart';
import 'package:edux_app/ui/PayingDetail.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../SettingsScreen.dart';

class Cloud extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CloudState();
}

class CloudState extends State<Cloud> with SingleTickerProviderStateMixin {
  StreamController<List> _filesController = new StreamController<List>();
  ScrollController _scrollController = ScrollController();
  List files = [];
  int currentIndex;
  double _pressX, _pressY;

  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  bool isOpened = false;
  bool isOpeneds = false;

  /// Create file  /// TODO: by stream way to create thumbnail to improve performance
  Widget getIcon(String filename, String fileHash, BuildContext context) {
    if(filename.contains(new RegExp(r'\.(?:jpg|gif|png|jpeg)'))){
      Image img = new Image(
        height: 64,
        width: 64,
        image: NetworkImage(IpfsApi().serverURL + '/ipfs/'+ fileHash),
      );

      return img;
      //return Icon(Icons.photo, size: 60, color: Theme.of(context).primaryColor, );

    }else if (filename.contains(new RegExp(r'\.(?:mp4|mp3|mov|mkv)'))){
      return Icon(Icons.movie, size: 60,color: Theme.of(context).primaryColor);
    }else{
      return Icon(Icons.assignment, size: 60,color: Theme.of(context).primaryColor);
    }
  }

  Future  getFilesItems({String path}) async {

    await IpfsApi().listFiles(filePath:path).then((e) {
      if ( e['Entries'] == null ) return;
      var f = e['Entries'] as List;
      f.forEach((file) {
        files.add({
          "fileName": file["Name"],
          "fileType": file["Type"],
          "fileSize": file['Size'],
          "fileHash": file['Hash']
        });
      });
    })
        .whenComplete(() {
      _filesController.add(files);
    }
    );
  }

  Future<Null> _handleFreshIndicator(){
    files.clear();
    return getFilesItems(path: Resource.file_current_dir).then((e) {
      setState((){
        _filesController.add(files);
      });
    });
  }

  upDateFiles(){
    files.removeAt(currentIndex);
    setState(() {
      _filesController.add(files);
    });
  }

  _onTapDown(TapDownDetails details) {
    _pressX = details.globalPosition.dx;
    _pressY = details.globalPosition.dy;
  }

  _onLongPress(){
    //TODO: Share and collection
    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(_pressX-100, _pressY-180, 100.0, 100.0),
        items: <PopupMenuItem<String>>[
          new PopupMenuItem<String>(
              value: '分享',
              child: Row(children: <Widget>[
                Icon(Icons.share, color: Theme.of(context).primaryColor),
                new Text('    分享')])),
          new PopupMenuItem<String>(
              value: '收藏',
              child: Row(children: <Widget>[
                Icon(Icons.collections_bookmark, color: Theme.of(context).primaryColor),
                new Text('    收藏')])),
        ] ).then((e){
      switch(e){
        case "收藏":
          IpfsApi().cpFiles(files[currentIndex]["fileHash"], files[currentIndex]["fileName"], filePath: "/Marks/");
          break;
        default:
          break;
      };
    });
  }

  @override
  void initState() {
    getFilesItems(path:Resource.file_current_dir);

    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.orangeAccent,
      end: Colors.deepOrangeAccent,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ), ));


    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.orangeAccent,
      end: Colors.deepOrangeAccent,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ), ));
    _translateButton = Tween<double>(
      begin: 56.0,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
      ), ));

    super.initState();
  }

  @override
  void dispose() {
    _filesController.close();
    super.dispose();
  }

  Future getImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    IpfsApi ipfs = new IpfsApi();
    if( result != null) {
      Response resp = await ipfs.addFiles(result.files.single.path, result.files.single.path.split("/").last);
      Response out = await ipfs.cpFiles(resp.data['Hash'], resp.data['Name'], filePath: "/Documents/");
      print(out);
    }
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
      isOpened = !isOpened;}else if(isOpeneds){
      _animationController.forward();
    } else{
      _animationController.reverse();
      isOpened = false;
    }

  }

  Widget add() {
    return Container(
      child: FloatingActionButton(
        elevation:0.0,
        heroTag: "Upload",
        onPressed: (){
          getImage();
        },
        tooltip: 'Upload',
        child: Icon(Icons.add, color:Theme.of(context).cardColor),
      ), );
  }
  Widget image() {
    return Container(
      child: FloatingActionButton(
        elevation:0.0,
        heroTag: "Image",
        onPressed: (){
          // Navigator.push(context, new MaterialPageRoute(builder: (_) => new VideoPlayerX()));
        },
        tooltip: 'Image',
        child: Icon(Icons.image, color:Theme.of(context).cardColor),
      ), );
  }
  Widget inbox() {
    return Container(
      child: FloatingActionButton(
        elevation:0.0,
        heroTag: "Inbox",
        onPressed: (){
          Resource.file_current_dir = Resource.file_current_dir+"/..";
        },
        tooltip: 'Inbox',
        child: Icon(Icons.inbox, color:Theme.of(context).cardColor),
      ),
    );
  }
  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        elevation:0.0,
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        heroTag: "Toggle",
        tooltip: 'Toggle',
        child: AnimatedIcon(
          color: Theme.of(context).toggleableActiveColor,
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ), );
  }

  Widget _FloatingActionButton(){
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(
                0.0,
                _translateButton.value * 3.0,
                0.0,
              ),
              child: add(),
            ),
            Transform(
              transform: Matrix4.translationValues(
                0.0,
                _translateButton.value * 2.0,
                0.0,
              ),
              child: image(),
            ),
            Transform(
              transform: Matrix4.translationValues(
                0.0,
                _translateButton.value,
                0.0,
              ),
              child: inbox(),
            ),
            toggle(), ],
        ) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: _handleFreshIndicator,
          child: StreamBuilder(
              stream: _filesController.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if ( snapshot.data == null ){
                  return Text("no data");
                }
                return GestureDetector(
                    onTapDown: (TapDownDetails details)=> _onTapDown(details),
                    child:ListView.separated(
                        separatorBuilder: (context, index) => Divider(height: .0),
                        padding: const EdgeInsets.all(10.0),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          final Axis slidableDirection = Axis.horizontal;
                          return _getSlidableWithLists(
                              context, index, slidableDirection, snapshot.data[index]);
                        }
                    ));
              }
          ),
        ),
        drawer: new CommonMenu(),
        floatingActionButton: _FloatingActionButton()
    );
  }

// To build the resource list to support list and icon display
  Widget _buildVerticalListItem(BuildContext context, int index, var item) {
    return new Container(
      color: Colors.white,
      child: new ListTile(
        leading: getIcon(item['fileName'], item['fileHash'], context),
        title: new Text(item['fileName'].toString().length > 8 ? item['fileName'].toString().substring(0, 8 )+"...": item['fileName']),
        subtitle: new Text(item['fileHash'].toString().length > 15 ? item['fileHash'].toString().substring(0, 15 )+"...": item['fileHash']),
        trailing: Text( readableBytes(item['fileSize']) ),
        onTap: () {
          currentIndex = index;
          if ( item['fileName'].contains( new RegExp(r'\.(?:jpg|JPG|gif|png|jpeg)'))  ){
            Navigator.push(context, new MaterialPageRoute(builder: (_) => new PhotoPlayer(item['fileHash'])));
          }else if (item['fileName'].contains(new RegExp(r'\.(?:mp4|mp3|mov|mkv)'))){
            Navigator.push(context, new MaterialPageRoute(builder: (_) => PayingDetail(item['fileHash'], item['fileName'])));//new VideoPlayerX(item['fileHash'], item['fileName'])));
          }else{ // Handle direcotry case
            logger.d("enter the dir ${item['fileName']}");
            setState(() {
              Resource.file_current_dir = item['fileName'];
              _handleFreshIndicator;
            });
          }
        },
        onLongPress: _onLongPress,
      ),
    );
  }

  Widget _getSlidableWithLists(BuildContext context, int index, Axis direction, var item) {
    return Slidable(
      key: Key('$index'),
      direction: direction,
      actionExtentRatio: 0.25,
      child: _buildVerticalListItem(context, index, item),
      actionPane: SlidableBehindActionPane(),
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
          setState(() {
            files.removeAt(index);
          });
        },
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: '收藏',
          color: Colors.brown,
          icon: Icons.bookmark,
          onTap: () async {
            Response response = await IpfsApi().cpFiles(item["fileHash"], item["fileName"], filePath: "/Marks/");
            if ( response.statusCode == 200){
              Fluttertoast.showToast(msg:"收藏成功");
            }
          },
        ),
        IconSlideAction(
          caption: '分享',
          color: Colors.grey.shade200,
          icon: Icons.share,
          onTap: ()async {
            //TODO: to impletement share
            Share.share("${IpfsApi().serverURL}/ipfs/"+item["fileHash"], subject: '[Share] $item["fileName"]');
          },
        ),
        IconSlideAction(
            caption: '删除',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () async {
              Response response = await IpfsApi().delFile(item['fileName']);
              if( response.statusCode == 200 ){
                currentIndex = index;
                upDateFiles();
              }
            }
        ),
      ],
    );
  }

}


readableBytes(int bytes){
  List sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
  int out = bytes;

  for( final e in sizes){
    if( out < 1024){
      return out.toString() + " " + e;
    }
    //bytes = (bytes/1024).toInt();
    out = out ~/ 1024.0;
  }

  return out.toString() + " " + sizes[0].toString();

}

