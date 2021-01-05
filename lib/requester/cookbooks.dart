// 网络请求
import 'package:dio/dio.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/model/cookbook.dart';

class CookbooksRequester {
  static var dio = Dio();

  // 获取随机菜谱
  static Future<dynamic> getRandom() async {
    try {
      Response response =
          await CookbooksRequester.dio.get("$BACKEND_ADDRESS/cookbooks/random");
      var data = response.data;
      var cookbook = Cookbook.fromJson(data);
      return cookbook;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 获取所有菜谱
  static Future<dynamic> queryAll() async {
    try {
      Response response =
          await CookbooksRequester.dio.get("$BACKEND_ADDRESS/cookbooks");
      print(response);

      var datas = response.data;

      var cookbooks = [];
      for (var cookbook in datas) {
        cookbooks.add(Cookbook.fromJson(cookbook));
      }

      return cookbooks;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 在分类下搜索关键词
  static Future<dynamic> queryByTagAndKeyword(int tagId, String keyword) async {
    try {
      Response response = await CookbooksRequester.dio.get(
        "$BACKEND_ADDRESS/cookbooks",
        queryParameters: {
          "tagId": tagId,
          "keyword": keyword,
        },
      );

      var datas = response.data;

      var cookbooks = [];
      for (var cookbook in datas) {
        cookbooks.add(Cookbook.fromJson(cookbook));
      }

      return cookbooks;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 搜索所有
  static Future<dynamic> queryByKeyword(String keyword) async {
    try {
      Response response = await CookbooksRequester.dio.get(
        "$BACKEND_ADDRESS/cookbooks",
        queryParameters: {
          "keyword": keyword,
        },
      );

      var datas = response.data;

      var cookbooks = [];
      for (var cookbook in datas) {
        cookbooks.add(Cookbook.fromJson(cookbook));
      }

      return cookbooks;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 获取某个菜谱
  static Future<dynamic> queryById(int id) async {
    try {
      Response response = await CookbooksRequester.dio.get(
        "$BACKEND_ADDRESS/cookbooks/detail",
        queryParameters: {
          "id": id,
        },
      );

      var data = response.data;

      var cookbook = Cookbook.fromJson(data);
      return cookbook;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
