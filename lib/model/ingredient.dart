// 原材料
class Ingredient {
  String name; // 食材名称
  String picture; // 食材图片

  // dart 没有反射功能，需要手动从 Map 中取出数据赋值对象
  Ingredient.fromJson(Map jsonData) {
    this.name = jsonData["name"];
    this.picture = jsonData["picture"];
  }
}
