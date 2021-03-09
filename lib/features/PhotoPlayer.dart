import 'dart:async';
import 'dart:typed_data';
import 'package:edux_app/api/ipfs_api_v1.dart';
import 'package:flutter/material.dart';



class PhotoPlayer extends StatefulWidget{
  String fileHash;

  PhotoPlayer(this.fileHash);

  @override
  State<StatefulWidget> createState() => PhotoPlayerState();

}

class PhotoPlayerState extends State<PhotoPlayer> {
  IpfsApi ipfs = new IpfsApi();

  StreamController<Uint8List> _streamController = new StreamController<Uint8List>();
  StreamController<Image> _imageController = new StreamController<Image>();

  List<Uint8List> _buffer = new List();

  getData() async{
    final _response = await ipfs.catFiles(widget.fileHash) ;
    _response.listen((data) {
      _buffer.add(data);
    }, onDone: () {
      _streamController.add(Uint8List.fromList(_buffer.expand((i)=>i).toList()));
    }, onError: (error) {
      print("Get ipfs documents failed");
    });
  }

  //TODO: to use photo_viewer to enhancement this feature
  getPhoto() async{
    Image image = Image.network(IpfsApi().serverURL+ '/ipfs/'+ widget.fileHash);
    _imageController.add(image);
  }

  @override
  void initState() {
    super.initState();
    //getData();
    getPhoto();
  }

  @override
  void dispose(){
    super.dispose();
    _imageController.close();
    //_streamController.close();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('photo player', style: TextStyle(color: Colors.white),),
      ),
      body: new StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
              switch (snapshot.connectionState){
                case ConnectionState.none:
                  return Text("none");
                  break;
                case ConnectionState.active:
                case ConnectionState.done:
                  return new Center(
                    child: snapshot.data,
                  );
                  break;
                case ConnectionState.waiting:
                  return Text("waiting");
                  break;
              }
              return null;
          },
        stream: _imageController.stream,
      ),
    );
  }

}
