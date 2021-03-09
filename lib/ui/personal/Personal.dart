import 'package:edux_app/api/ipfs_api_v1.dart';
import 'package:edux_app/api/ss.dart';
import 'package:edux_app/model/User.dart';
import 'package:edux_app/model/ss/ss_valid.dart';
import 'package:edux_app/ui/BottomNavigation.dart';
import 'package:edux_app/ui/personal/widget/payHistoryList/payHistoryList.dart';
import 'package:edux_app/ui/personal/widget/product/product.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Personal extends StatefulWidget {
  Personal({Key key, this.data, this.avatar}) : super(key: key);
  final data;
  final avatar;

  @override
  _MyPageState createState() => _MyPageState();
}

var avatar;
var used;
bool _switchValue = false;

class _MyPageState extends State<Personal> with AutomaticKeepAliveClientMixin {
  var all;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            ///头像容器加点击事件
            GestureDetector(
                onTap: () {
                  onTap();
                },
                child: widget.avatar != null
                    ? Container(
                        margin: EdgeInsets.only(
                            top: 20.0, left: 18.0, bottom: 24.0, right: 18.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.memory(
                              avatar ?? widget.avatar,
                              fit: BoxFit.contain,
                              width: 70.0,
                              height: 70.0,
                            )))
                    : Container(
                        margin: EdgeInsets.only(
                            top: 20.0, left: 18.0, bottom: 24.0, right: 18.0),
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(User.userImgUrl)),
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                      )),
            Container(
              height: 70.0,
              width: _width * 0.60,
              margin: EdgeInsets.only(
                  top: 20.0, left: 8.0, bottom: 24.0, right: 20.0),
              child: FutureBuilder(
                  future: IpfsApi().get("storage"),
                  builder: (context, response) {
                    if (response.data != null) {
                      used = 0;
                      all = 0;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${widget.data}",
                            style: TextStyle(fontSize: 32.0),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 4.0,
                            width: 120.0,
                            child: LinearProgressIndicator(
                              value:
                                  response.data["used"] / response.data["all"],
                              backgroundColor: Colors.green,
                            ),
                          ),
                          Text(
                            "$used/$all",
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      );
                    } else {
                      return new Container();
                    }
                  }),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Row(children: <Widget>[
            Text("用 户 信 息", style: TextStyle(fontSize: 15.0)),
          ]),
          height: 40.0,
          color: Colors.grey[200],
        ),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "昵 称",
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(User.username,
                  style: TextStyle(), textAlign: TextAlign.right),
            ],
          ),
          onPressed: () {},
        ),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "到 期 时 间",
                style: TextStyle(color: Colors.grey[600]),
              ),
              TextLine(),
            ],
          ),
          onPressed: () {},
        ),
        // Divider(height: 2.0,endIndent:20.0,indent: 20.0,color: Colors.grey),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Storaged Used (G)",
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(User().storaged_space.toString(),
                  style: TextStyle(), textAlign: TextAlign.right),
            ],
          ),
          onPressed: () {
            setState(() {});
          },
        ),
        //  Divider(height: 2.0,endIndent:20.0,indent: 20.0,color: Colors.grey),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Remained Space (G)",
                  style: TextStyle(color: Colors.grey[600])),
              Text(User().remained_space.toString(),
                  style: TextStyle(), textAlign: TextAlign.right),
            ],
          ),
          onPressed: () {
            //待开发
          },
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Row(children: <Widget>[
            Text("网 络", style: TextStyle(fontSize: 15.0)),
          ]),
          height: 40.0,
          color: Colors.grey[200],
        ),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("连 接", style: TextStyle(color: Colors.grey[600])),
              Switch.adaptive(
                  value: _switchValue,
                  onChanged: (bool value) async {
                    // ss().connectTunnel(value);
                    // setState(() {
                    //   _switchValue = value;
                    // });
                    if (value) {
                      SSValidResp res =
                          await ssValidCheck(User.userUnionid, User.userToken);
                      logger.d(res);
                      if (res.valid) {
                        logger.d(_switchValue);
                        setState(() {
                          _switchValue = value;
                        });
                        ss().connectTunnel(true);
                      } else {
                        logger.d(_switchValue);
                        Fluttertoast.showToast(
                            msg: "请先购买产品后再进行连接！",
                            gravity: ToastGravity.CENTER,
                            textColor: Colors.red[200]);
                      }
                    }else{
                      logger.d(_switchValue);
                      setState(() {
                        _switchValue = value;
                      });
                      ss().connectTunnel(false);
                    }
                  }),
            ],
          ),
          onPressed: () {},
        ),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("续 费",
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Product()));
          },
        ),

        ///下载管理按钮
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("订 单",
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (_) => PayHistory()));
          },
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Row(children: <Widget>[
            Text("Contact Us", style: TextStyle(fontSize: 15.0)),
          ]),
          height: 40.0,
          color: Colors.grey[200],
        ),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Feedback", style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
          onPressed: () {},
        ),

        ///添加设备按钮
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("About", style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
          onPressed: () {},
        ),

        ///退出登陆按钮
        Container(
            child: RaisedButton(
                color: Colors.teal[800],
                splashColor: Colors.white,
                textColor: Colors.white,
                child: Text(
                  "退  出  登  录",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          content: Text("是否继续要退出？"),
                          actions: [
                            CupertinoDialogAction(
                              child: Text("是"),
                              onPressed: () async {
                                User.username = null;
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.clear();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavigation()),
                                    (route) => route == null);
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text("否"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                })),
      ],
    ));
  }

//
  ///点击头像触发事件
  onTap() {
    File result;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text(
                  "Display Avatar",
                  textAlign: TextAlign.center,
                ),
                onTap: () async {
                  File result;
                  result =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  "Select from Photo album",
                  textAlign: TextAlign.center,
                ),
                onTap: () async {
                  result =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  "Cancel",
                  textAlign: TextAlign.center,
                ),
                onTap: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }).whenComplete(() async {
      if (result != null) {}
    });
  }

  @override
  bool get wantKeepAlive => true;
}
