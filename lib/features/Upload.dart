import 'dart:io';

import 'package:edux_app/api/ipfs_api_v1.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Uploads extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => UploadsState();

}

class UploadsState extends State<Uploads> {
  IpfsApi ipfs = new IpfsApi();


  Future getImage() async {
    var _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    IpfsApi ipfs = new IpfsApi();
    var result = ipfs.addFiles(_image.path, _image.path);
   // ipfs.cpFiles(result.hashCode.toString(), "/" + "/demo.jpg");
  }

   getImageX(){
    getImage();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Upload', style: TextStyle(color: Colors.white),),
      ),
      body: StreamBuilder(
         // stream: _refreshController.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            return Text(snapshot.data.toString());
          }

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}