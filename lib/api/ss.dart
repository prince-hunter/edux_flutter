//TODO: this is for ss interface
// task owner: haogle

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:edux_app/conf/url.dart';
import 'package:edux_app/model/User.dart';
import 'package:edux_app/model/ss/ss_valid.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "../model/ss/ss_config.dart";
import 'package:edux_app/conf/config.dart';
import 'dart:async';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'basic.dart';

class TunnelWidget extends StatefulWidget {
  const TunnelWidget({Key key})
      : super(key: key);

  @override
  ss createState() => ss();
}

class ss extends State<TunnelWidget> {
  static const MethodChannel methodChannel =
      MethodChannel('edu.irocn.com/tunnel');
  static const EventChannel eventChannel = EventChannel('edu.irocn.com/event');

  static bool _connectStatus = false;
  String _connectEvent = "no envent";

  Future<bool> connectTunnel(bool is_connected) async {
    int result;
    try {
      Config conf = new Config();
      if (_connectStatus) {
        if(Platform.isWindows) {
          String _work_path =  Directory.current.path;
          logger.d("The current path is:",  Directory.current);

          // final dylib = ffi.DynamicLibrary.open('libsslocal.dylib');
          // final GreetingFunction rustGreeting = dylib
          //     .lookup<NativeFunction<GreetingFunctionFFI>>("say_hello")
          //     .asFunction();
          // final nameStr = '{"server":"8.210.49.90","server_port":54321,"local_address":"127.0.0.1","local_port":1086,"password":"Irocn.com9981","method":"aes-256-gcm","timeout":60,"mode":"tcp_only"}';
          // final Pointer<Utf8> namePtr = Utf8.toUtf8(nameStr);
          // print("- Calling rust_greeting with argument:  $namePtr");
          // final Pointer<Utf8> resultPtr = rustGreeting(namePtr);
          // print("- Result pointer:  $resultPtr");

          String server = "172.105.200.33";
          String method = "aes-256-gcm";
          String password = "Irocn.com9981";
          String local_address = "127.0.0.1";
          String timeout = "60";
          String server_port = "54321";
          String mode = "tcp_and_udp";
          String local_port = "1088";

          Process.start(_work_path + "/windows/libs/local.dll", ["-s", server + ":" + server_port, "-m", method, "--password", password, "-b", local_address + ":" + local_port, "-U", "--timeout", timeout], mode:ProcessStartMode.detached).then((process) {
            stdout.addStream(process.stdout);
            stderr.addStream(process.stderr);
          });

          // Process.start(_work_path + "/windows/libs/sslocal.dll", ["-s", "172.105.200.33" + ":" + "54321", "-m", "aes-256-gcm", "--password", "Irocn.com9981", "-b", "127.0.0.1" + ":" + "1088", "-U", "--timeout", "60"], mode:ProcessStartMode.detached).then((process) {
          //   stdout.addStream(process.stdout);
          //   stderr.addStream(process.stderr);
          // });

          // Process.start(_work_path + "/windows/libs/sslocal.dll", ['-c', _work_path + "/windows/libs/config.json"], mode:ProcessStartMode.detached).then((process) {
          //   stdout.addStream(process.stdout);
          //   stderr.addStream(process.stderr);
          // });

          // sleep(Duration(seconds:1));
          Process.start(_work_path + "/windows/libs/ss_privoxy.dll", [_work_path + "/windows/libs/privoxy.conf"], runInShell: false).then((process) {
            stdout.addStream(process.stdout);
            stderr.addStream(process.stderr);
          });

          Process.start(_work_path + "/windows/libs/sysproxy", ['set', '2', '127.0.0.1:60744', 'localhost;127.*;10.*']).then((process) {
            stdout.addStream(process.stdout);
            stderr.addStream(process.stderr);
          });

        } else {
          result = await methodChannel.invokeMethod('tunnel', {
            "ss_isconnected": 1,
            "ss_server": conf.ss_server,
            "ss_port": conf.ss_port,
            "ss_method": conf.method,
            "ss_pwd": conf.ss_pwd
          });
        }
      } else {
        if(Platform.isWindows) {
          String _work_path =  Directory.current.path;
          logger.d("The current path is:",  Directory.current);

          // Invoke : taskkill /IM Process Name /F , to kill sslocal process
          Process.start("taskkill", ['/IM',"ss_privoxy.dll", "/F"], runInShell: false, mode:ProcessStartMode.detached).then((process) {
            logger.d("taskkill run log:" , process.stdout.toString());
            stdout.addStream(process.stdout);
            logger.d("taskkill run error log:" , process.stderr);
            stderr.addStream(process.stderr);
          });

          Process.start("taskkill", ['/IM',"local.dll", "/F"], runInShell: false, mode:ProcessStartMode.detached).then((process) {
            logger.d("taskkill run log:" , process.stdout.toString());
            stdout.addStream(process.stdout);
            logger.d("taskkill run error log:" , process.stderr);
            stderr.addStream(process.stderr);
          });

          Process.start(_work_path + "/windows/libs/sysproxy", ['set', '1', '127.0.0.1:60744', 'localhost;127.*;10.*'], runInShell: false, mode:ProcessStartMode.detached).then((process) {
            stdout.addStream(process.stdout);
            stderr.addStream(process.stderr);
          });

        } else {
          result = await methodChannel.invokeMethod('tunnel', {
            "ss_isconnected": 0,
            "ss_server": conf.ss_server,
            "ss_port": conf.ss_port,
            "ss_method": conf.method,
            "ss_pwd": conf.ss_pwd
          });
        }
      }
    } on PlatformException {
      return false;
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   //eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  //   checkValid();
  // }

  // checkValid() async {
  //   SSValidResp resp = await ssValidCheck(widget.userId, widget.token);
  //   setState(() {
  //     checkResult = resp;
  //   });
  // }

  void _onEvent(Object event) {
    setState(() {
      _connectEvent = event != null ? event.toString() : "event is empty";
    });
  }

  void _onError(Object error) {
    setState(() {
      _connectEvent = "error";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoSwitch(
                activeColor: Colors.blue,
                value: _connectStatus,
                onChanged: (value) async {
                  if (value) {
                    SSValidResp res =
                        await ssValidCheck(User.username, User.userToken);
                    logger.d(res);
                    if (res.valid) {
                      logger.d(_connectStatus);
                      setState(() {

                        _connectStatus = value;
                      });
                      connectTunnel(true);
                    } else {
                      logger.d(_connectStatus);
                      Fluttertoast.showToast(
                          msg: "请先购买产品后再进行连接！",
                          gravity: ToastGravity.CENTER,
                          textColor: Colors.red[200]);
                    }
                  }else{
                    logger.d(_connectStatus);
                    setState(() {
                      _connectStatus = value;
                    });
                    connectTunnel(false);
                  }

                  // ssValidCheck(widget.userId, widget.token).then((data){
                  //   if (data.valid) {
                  //     setState(() {
                  //       _connectStatus = value;
                  //     });
                  //     connectTunnel();
                  //   } else {
                  //     Fluttertoast.showToast(
                  //         msg: "请先购买产品后再进行连接！",
                  //         gravity: ToastGravity.CENTER,
                  //         textColor: Colors.red[200]);
                  //   }
                  // });
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              // Text(_connectStatus?"连接":"断开", style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 20.0
              // ),),
              // Text(_connectEvent, style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 20.0
              // ),)
            ],
          ),
        ),
      ),
    );
  }
}

getSSConfig(String userId, String code) async {
  SSConfigReq req = SSConfigReq();
  req.user_id = userId;
  req.code = code;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.SS_CONFIG,
      data: req.toJson(),
    );

    return SSConfigResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.ARTICLE);
    logger.e(e.toString());
  }
}

ssValidCheck(String userId, String token) async {
  SSValidReq req = SSValidReq();
  req.user_id = userId;
  req.token = token;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.SS_VALID_CHECK,
      data: req.toJson(),
    );

    SSValidResp ret = SSValidResp.fromJson((respData).data);
    logger.d(ret.toString());
    return ret;
  } catch (e) {
    logger.e(URL.SS_VALID_CHECK);
    logger.e(e.toString());
  }

  return SSValidResp();
}
