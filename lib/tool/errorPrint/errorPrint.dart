import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

errorPrint(msg) {
  return Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      textColor: Colors.red[200]
  );
}
