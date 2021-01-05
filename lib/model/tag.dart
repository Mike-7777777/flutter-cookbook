// 分类信息
class Tag {
  int id; // 分类id
  String name; // 分类名称

  // dart 没有反射功能，需要手动从 Map 中取出数据赋值对象
  Tag.fromJson(Map jsonData) {
    this.id = jsonData["id"];
    this.name = jsonData["name"];
  }
}
