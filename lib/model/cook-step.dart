// 烹饪步骤
class CookStep {
  String description; // 描述
  String picture; // 图片地址集合
  int number; // 步骤编号
  // dart 没有反射功能，需要手动从 Map 中取出数据赋值对象
  CookStep.fromJson(Map jsonData) {
    this.description = jsonData["description"];
    this.picture = jsonData["picture"];
    this.number = jsonData["number"];
  }
}
