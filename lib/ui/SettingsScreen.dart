import 'dart:async';
import 'package:edux_app/api/ipfs_api_v1.dart';
import 'package:edux_app/model/User.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:barcode_scan/barcode_scan.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';


class SettingsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
    );
  }
}

Widget buildAppBar(String title, BuildContext context){
  final TextEditingController _SearchBox = new TextEditingController();
  return AppBar(
    leading: Builder(
        builder: (context){
          return IconButton(
              icon: new Icon(Icons.menu, color: Colors.white),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              }
          );
        }
    ),
    actions: <Widget>[
      new IconButton(
        icon: new Icon(Icons.more_vert, color: Colors.white),
        tooltip: '更多',
        onPressed: (){},
      )],
    title: Text(title, style: TextStyle(color: Colors.white),), //TODO: iOS 不能居中
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(48.0),
      child: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.white),
        child: Container(
          height: 48.0,
          alignment: Alignment.center,
          child: new TextField(
            controller: _SearchBox,
            decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...',
              border: UnderlineInputBorder(),
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Future scan( BuildContext context ) async {
  String _barcode;
  try {
 // todo  _barcode = await BarcodeScanner.scan();
 //   _showDialog(context, _barcode);
  }  catch (e) {
    print(e.toString());
  }
}

void _showDialog(BuildContext context, String msg) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("扫描结果"),
        content: new Text(msg),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class CommonMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CommonMenuState();
}

class CommonMenuState extends State<CommonMenu>{

  static const platform = const MethodChannel('app.channel.shared.data');
  Map<dynamic, dynamic> sharedData = Map();
  Future<Map> _getSharedData() async => await platform.invokeMethod('getSharedData');
  bool shared = false;

  getSharedDataFromAndroid() async {
    var data =await _getSharedData();
    await Future.delayed(Duration(milliseconds: 100));
    setState(() => sharedData.addAll(data));
    if (sharedData != null && sharedData.length != 0){
      for (String name in sharedData.keys) {
        String path_a =sharedData[name].replaceFirst('file://', '');
        logger.i(path_a);
        //var result = await IpfsApi().addFiles(path_a, path_a.split('/').last);
        //var out = await IpfsApi().cpFiles(result.data['Hash'], result.data['Name'], filePath: "/Documents/");
        Fluttertoast.showToast(msg:"上传成功");
        //Toasts.toasts(context,msg: " 上传成功 ",position: ToastPostion.bottom);
      }
    }
  }

  getShareDataFromIos()  {
    StreamSubscription _intentDataStreamSubscription;
    _intentDataStreamSubscription = ReceiveSharingIntent.getMediaStream()
        .listen((List<SharedMediaFile> value) {
      setState(() async {
        logger.d(value);
        //var result = await IpfsApi().addFiles(_sharedFiles[0].path, _sharedFiles[0].path.split('/').last);
        //var out = await IpfsApi().cpFiles(result.data['Hash'], result.data['Name'], filePath: "/Documents/");
        Fluttertoast.showToast(msg:"上传成功");
      });
    }, onError: (err) {
      print("getIntentDataStream error: $err");
    });


    ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
      setState(()  {
        logger.d(value);
      });
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
          logger.d("ReceiveSharingIntent");
          setState(() {
            logger.d("$value");
          });
        }, onError: (err) {
          print("getLinkStream error: $err");
        });

    ReceiveSharingIntent.getInitialText().then((String value) {
      setState(() {
        logger.d(value);
      });
    },onError: (err) {
      print("getLinkStream error: $err");
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController destFileNameController = TextEditingController();
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountEmail: Text(User.username, style: TextStyle(color: Theme.of(context).cardColor)),
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundImage: new ExactAssetImage("images/pig.png"),
                radius: 1.0,
              ),
            ),
          ),
          new ListTile(
            title: new Text("IPFS地址", style: TextStyle(color: Theme.of(context).primaryColor),),
            trailing: new Icon(Icons.add_location, color: Theme.of(context).primaryColor),
            onTap: (){
              Navigator.of(context).pop();
              showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("输入IPFS node地址"),
                    content: CupertinoTextField(
                      placeholder:"输入IP 或 域名",
                      controller: destFileNameController,
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("确定"),
                        onPressed: () {
                          if(destFileNameController.value.text.length == 0){
                            Fluttertoast.showToast(msg:"输入有误");
                          }else {
                            IpfsApi().apiURL =
                                "http://" + destFileNameController.value.text +
                                    ":5001";
                            IpfsApi().serverURL =
                                "http://" + destFileNameController.value.text +
                                    ":8888";
                          }
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ));
              //                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SettingsPage('Settings Center')));
            },
          ),
          new ListTile(
            title: new Text("扫一扫", style: TextStyle(color: Theme.of(context).primaryColor)),
            trailing: new Icon(Icons.calendar_view_day, color: Theme.of(context).primaryColor),
            onTap: (){
              scan(context);
            },
          ),
          new ListTile(
            title: new Text("设置", style: TextStyle(color: Theme.of(context).primaryColor)),
            trailing: new Icon(Icons.settings, color: Theme.of(context).primaryColor),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          new ListTile(
            title: new Text("退出", style: TextStyle(color: Theme.of(context).primaryColor)),
            trailing: new Icon(Icons.exit_to_app, color: Theme.of(context).primaryColor),
            onTap: (){
            //  Navigator.push(context, new MaterialPageRoute(builder: (_) => new LoginScreen()));
            },
          ),
          new ListTile(
            title: new Text("关于", style: TextStyle(color: Theme.of(context).primaryColor)),
            trailing: new Icon(Icons.description, color: Theme.of(context).primaryColor),
            onTap: (){
             // Navigator.push(context, new MaterialPageRoute(builder: (_) => new AboutUs()));
            },
          ),
        ],
      ),
    );
  }
}