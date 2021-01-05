// 网络请求
import 'package:dio/dio.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/model/tag.dart';

class TagsRequester {
  static var dio = Dio();

  // 获取所有分类
  static Future<dynamic> queryAll() async {
    try {
      Response response = await TagsRequester.dio.get("$BACKEND_ADDRESS/tags");
      print(response);

      var datas = response.data;

      var tags = [];
      for (var tag in datas) {
        tags.add(Tag.fromJson(tag));
      }
      return tags;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
