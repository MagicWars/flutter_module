import 'package:dio/dio.dart';
import 'dart:convert';

class DioManager{

  ///单例模式
  static DioManager _instance;
  Dio dio;

  static DioManager getInstance(){
    if(_instance == null){
      _instance = DioManager();
    }
    return _instance;
  }

  DioManager(){
    dio = new Dio();
    dio.options.baseUrl = 'https://mock.yonyoucloud.com/mock/13459/wez/f1/';
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    //dio.interceptors.add(LogInterceptor(responseBody: true)); //是否开启请求日志
  }

  get(url,{data,options}) async {
    Response response;
    try{
      response = await dio.get(url,queryParameters: data,options: options);
      if(response.statusCode==200){
        String dataStr = json.encode(response.data);
        Map<String,dynamic> dataMap = json.decode(dataStr);
        return dataMap;
      }else{
        print("接口报错");
      }
    } on DioError catch (e){
      print("get Fail = $e");
    }
  }

//  get(String url,Function successCallBack,FormData params){
//    _requestHttp(url, successCallBack,'get',params);
//  }
//
//  _requestHttp(String url,Function successCallBack,[String method,FormData params, Function errorCallBack]) async {
//    Response response;
//    try{
//      if(method == 'get'){
//        if(params != null){
//          response = await dio.get(url,queryParameters: Map.fromEntries(params.fields));
//        }else{
//          response = await dio.get(url);
//        }
//      }else if(method == 'post'){
//        if (params != null && params.fields.isNotEmpty) {
//          response = await dio.post(url, data: params);
//        } else {
//          response = await dio.post(url);
//        }
//      }
//    } on DioError catch(error){
//      print('error msg ${error.response}');
//    }
//    String dataStr = json.encode(response.data);
//    Map<String, dynamic> dataMap = json.decode(dataStr);
//    if(dataMap == null || dataMap['status'] != 200){
//      print('请求状态:${dataMap['msg'].toString()}');
//      return dataStr;
//    }else if(successCallBack != null){
//      //successCallBack(dataMap);
//      print('successCallBack success');
//      return response;
//    }
//  }

}