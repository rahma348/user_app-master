import 'package:dio/dio.dart';

class DioHelper{

  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://ckd-backend-server.onrender.com/',
        receiveDataWhenStatusError: true,
        responseType: ResponseType.json,
        validateStatus: (status) {
          if(status == null){
            return false;
          }
          if(status == 401){ // your http status code
            return true;
          }else{
            return status >= 200 ;
          }
        },
      ),
    );



  }


  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
    String? token,
  }) async{
    dio!.options.headers = {
      'Authorization': 'Bearer ${token??''}',
    };
    return await dio!.get(
      path,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? query,
    String lang = 'en',
    required Map<String, dynamic> data,
    String? token,
  }) async{
    dio!.options.headers = {
      'Authorization': 'Bearer ${token??''}',
    };

    return await dio!.post(
      path,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String path,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async{
    dio!.options.headers = {
      'Authorization': 'Bearer ${token??''}',
    };
    return await dio!.put(
      path,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> patchData({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async{
    dio!.options.headers = {
      'Authorization': 'Bearer ${token??''}',
    };
    return await dio!.patch(
      path,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async{
    dio!.options.headers = {
      'Authorization': 'Bearer ${token??''}',
    };
    return await dio!.delete(
      path,
      queryParameters: query,
      data: data,
    );
  }
}