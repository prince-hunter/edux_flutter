import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:edux_app/model/User.dart';
import 'package:edux_app/utiles/logger.dart';

class IpfsApi{
  var dio = Dio();
  String serverURL = "http://db.irocn.com:8888/";
  String apiURL = "http://db.irocn.com:5001/";
  String esURL = "http://elastic:irocn.com@db.irocn.com:9001";
  static IpfsApi instance;
  static String token;
  static double progress = 0.0;
  BaseOptions _options;


  static final IpfsApi _singleton = new IpfsApi._internal();

  factory IpfsApi() {
    return _singleton;
  }

  IpfsApi._internal() {
    dio.options = new BaseOptions(
      baseUrl: apiURL,
      responseType: ResponseType.json,
      // connectTimeout: 5000,
      // receiveTimeout: 3000,
    );
  }

  Future<dynamic> getNews() async{
    Response response;
    dio.options = new BaseOptions(
      baseUrl: apiURL,
    );
    try{
      response = await dio.post(
        '/api/v0/files/ls?l=true&arg=/news/&stream-channels=true',
        data: {

        },
        options: RequestOptions(responseType: ResponseType.json),
      );
    }catch (e){
      print(e);
    }
    return response.data;
  }


  Future<dynamic> listFiles({String filePath}) async {
    Response response;
    // var apiURL = filePath == null ? "/api/v0/files/ls?l=true&arg=/users/"+ User.username + "/&stream-channels=true":
    // "/api/v0/files/ls?l=true&arg=/users/"+ User.username + "/$filePath" + "/&stream-channels=true";
    var apiURL ="/api/v0/files/ls?l=true&arg=/users/public//&stream-channels=true";
    logger.d(apiURL);
    try {
      response = await dio.post(
      apiURL,
        data: {         //TODO: this data is not work"
          "l": "true",
          "stream-channels": "true",
          "arg":"\//"
        },
        options: RequestOptions(responseType: ResponseType.json,),
      );

    } catch(e){
      print("error");
      print(e.toString());
    }
    return response.data;
  }

  Future<dynamic> writeFiles(String filePath, String fileName) async{
    Response response;

    try{
      FormData formData = new FormData.fromMap({
        "file": await MultipartFile.fromFile(filePath, filename: fileName),
      });
      response = await dio.post(
          '/api/v0/files/write?' + "arg=/users/haogle&stream-channels=true",
        data: formData,
        options: RequestOptions(responseType: ResponseType.json, contentType: "multipart/form-data"),
      );
    } catch (e) {
      print(e.toString());
    }

    return response;
  }

  //
  // file_path: the filename with its path
  //
  Future<dynamic> addFiles(String file_path, String file_name) async{
    Response response;
    try{
      FormData formData = new FormData.fromMap({
        //"name":file_name,
        "file": await MultipartFile.fromFile(file_path, filename: file_name),
        //  "files": [],
      });
       response = await dio.post(
        '/api/v0/add' ,
        data: formData,
      //  queryParameters: {"wrap-with-directory":"false"},
        options: RequestOptions(responseType: ResponseType.json,),//contentType: "multipart/form-data"),
      );
    }on DioError catch(e){
      if(e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else{
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
    return response;
  }


  upload(url, data) async {
    logger.d("upload image url is:"+url);
    var re = (await dio.post(url, data: data, onSendProgress: (sent, total) {
      print((sent / total * 100).toStringAsFixed(0) + "%");
    }, onReceiveProgress: (get, total) {
      print((get / total * 100).toStringAsFixed(0) + "%");
    }));
    return re.data;
  }

  /// src [string]: Source object to copy. Required: yes. , eg. /ipfs/QmdQuhk3V9D81uyoPPZJzuuVA6T99hjXCPWrKF4jv5REHP
  /// dst [string]: Destination to copy object to. Required: yes. eg. /Quic.png
 Future<dynamic> cpFiles(String src, String dst, {String filePath}) async {
    Response response;
    try{
      FormData formData = new FormData.fromMap(
        {
          "arg": "/ipfs/" + src,            //TODO: Two same form parameter is NOT right
          "arg": "/users/${User.username}/photo" + dst,
        }
      );
      logger.d("copy file from $src to $dst");
      response = await dio.post(
        '/api/v0/files/cp?' + "arg=/ipfs/$src&arg=/users/${User.username}$filePath/$dst" ,
        data: formData,
        options: RequestOptions(responseType: ResponseType.json,contentType: "multipart/form-data"),
      );
    }catch (e){
      logger.d("$e");
    }
    return response;
  }
 Future <Stream<Uint8List>> catFiles(String hashcode) async{
    Response<ResponseBody> response;
    try{
      FormData formData = new FormData.fromMap({
        "arg": hashcode,
      });
      response = await dio.post(
        '/api/v0/cat',
        data: formData,
        queryParameters: {},
        options: RequestOptions(responseType: ResponseType.stream),
        onReceiveProgress: (int a, int b){
          print(a);
        },
      );


    } catch(e){
      logger.d("$e");
    }

    return response.data.stream;
  }


 Future<dynamic> getPeersInfo() async {
   Response response;

   try {
     response = await dio.post(
       '/api/v0/swarm/peers',

     );
   } catch (e) {
     print(e.toString());
   }

   return response.data;
 }


 Future<dynamic> delFile(String filesName, {String filePath}) async {
    Response response;
    var apiURL = filePath == null ? '/api/v0/files/rm?arg=/users/' + User.username + "/ebooks/$filesName" + '&recursive=true&force=true':
    '/api/v0/files/rm?arg=/users/' + User.username + "$filePath" + "$filesName" + '&recursive=true&force=true';
    try{
      response = await dio.post(
        apiURL,
      );
    }catch (e){
      logger.d("$e");
    }
    return response;
 }

  Future<dynamic>getMinerInfo() async{
    Response response;
    try{
        dio.options = new BaseOptions(
        baseUrl: esURL,
        responseType: ResponseType.json,
      );
      response = await dio.get(
          "/miner-data-info/_search/?pretty&sort=@timestamp:desc&size=10&filter_path=hits.hits._source",
        options: RequestOptions(responseType: ResponseType.json),
      );
    }catch (e) {
      logger.d("get miner info failed, cause: " + e.toString());
    }
    return response;
  }


  get(url) async {
    var re = (await dio.get(url));
    return re.data;
  }
}
