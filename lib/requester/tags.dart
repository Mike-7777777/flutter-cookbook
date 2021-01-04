// 网络请求
import 'package:dio/dio.dart';
import 'package:my_app/constants.dart';

class TagsRequester {
  static var dio = Dio();

  // 获取所有分类
  static Future<dynamic> queryAll() async {
    try {
      Response response = await TagsRequester.dio.get("$BACKEND_ADDRESS/tags");
      print(response);
      return response.data;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
