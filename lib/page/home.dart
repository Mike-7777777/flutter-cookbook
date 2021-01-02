// 底部导航选择主页时的页面
import 'package:flutter/material.dart';
import 'package:my_app/widget/cookbook-card.dart';
import 'package:my_app/widget/logo.dart';
import 'package:my_app/widget/search.dart';
import 'package:my_app/values/values.dart';

// 本地页面
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

// 本地页面的状态
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 获取搜索图标组件
    var searchIconWidget = getSearchIconWidget(context);

    // 页面框架
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground, // 设置顶部 bar 颜色为白色
        title: LogoWidget.getInstance(),
        actions: <Widget>[searchIconWidget],
      ),
      body: _getPageBody(),
    );
  }
}

Widget _getPageBody() {
  return ListView(
    children: getListChildren(),
  );
}

List<Widget> getListChildren() {
  var list = <Widget>[];

  list.add(const Text("摇蛋机"));

  list.add(
    // 固定列数的 GridView
    GridView.count(
        // 设置列数
        crossAxisCount: 2,
        // 解决 GridView 嵌套在 ListView 中报错问题
        shrinkWrap: true,
        // 解决 GridView 嵌套在 ListView 中无法滑动问题
        physics: new NeverScrollableScrollPhysics(),

        // 设置内容
        children: [CookbookCard(), Text("摇")]),
  );
  // Table(
  //   children: [],
  // );

  list.add(const Text("推荐菜谱"));

  list.add(
    // 固定列数的 GridView
    GridView.count(
      // 设置列数
      crossAxisCount: 2,
      // 解决 GridView 嵌套在 ListView 中报错问题
      shrinkWrap: true,
      // 解决 GridView 嵌套在 ListView 中无法滑动问题
      physics: new NeverScrollableScrollPhysics(),

      // 设置内容
      children: getGridChildren(),
    ),
  );

  return list;
}

List<Widget> getGridChildren() {
  var list = <Widget>[];
  for (int i = 0; i < 10; i++) {
    list.add(CookbookCard());
  }
  return list;
}
