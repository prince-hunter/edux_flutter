import 'package:dio/dio.dart';
import '../conf/url.dart';

class DioHelper{
  // static String host = "http://192.168.2.3:8899";
  static String host = URL.BASE_URL;
  Dio dio;
  DioHelper(){
    dio = Dio(
      BaseOptions(baseUrl: host,connectTimeout: 500000,receiveTimeout: 300000)
    );
  }
}