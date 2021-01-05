import 'package:my_app/model/cook-step.dart';
import 'package:my_app/model/ingredient.dart';

// 菜谱
class Cookbook {
  int id; // 菜谱id
  String title; // 菜谱名称
  String brief; //有关该菜的简介
  String preview; //菜谱图片地址（菜谱的预览图）
  List<Ingredient> ingredients; // 原材料及用量
  List<CookStep> cookSteps; // 烹饪步骤

  // dart 没有反射功能，需要手动从 Map 中取出数据赋值对象
  Cookbook.fromJson(Map jsonData) {
    this.id = jsonData["id"];
    this.title = jsonData["title"];
    this.brief = jsonData["brief"];
    this.preview = jsonData["preview"];

    if (jsonData["ingredients"] != null) {
      List<Ingredient> ingredients = [];
      for (var ing in jsonData["ingredients"]) {
        ingredients.add(Ingredient.fromJson(ing));
      }
      this.ingredients = ingredients;
    }

    if (jsonData["cookSteps"] != null) {
      List<CookStep> cookSteps = [];
      for (var cS in jsonData["cookSteps"]) {
        cookSteps.add(CookStep.fromJson(cS));
      }
      this.cookSteps = cookSteps;
    }
    print("finish fromJSON");
  }
}
