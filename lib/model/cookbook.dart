import 'package:my_app/model/cook-step.dart';
import 'package:my_app/model/ingredient.dart';

// 菜谱
class Cookbook {
  int id; // 菜谱id
  String title; // 菜谱名称
  String previewPicture; //菜谱图片地址（菜谱的预览图）
  String brief; //有关该菜的简介
  List<Ingredient> ingredients; // 原材料及用量
  List<CookStep> cookSteps; // 烹饪步骤
}
