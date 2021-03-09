import 'package:flutter/cupertino.dart';

class Config{
  String title = "edux";
  String copyright = "CopyRight (C) Irocn.com 2021-";

  String ss_server = "a16.tsinghua.cool"; // ipv6 address is also ok
  int ss_port = 9981;
  String ss_pwd = "Abc-123";
  String method = "rc4-md5";
  bool is_tunnel_connected = false;

  static bool is_gx_version = false; // for gx realse
  String version = '0.0.4';


  String wxAppid = "wxe43f120852491d33";
  String wxAppSecret = '';
}

