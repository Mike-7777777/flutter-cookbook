// 搜索结果样式(与首页相同)

import 'package:flutter/material.dart';
import 'package:my_app/values/colors.dart';
import 'package:my_app/widget/cookbook-card.dart';

// 定义为无状态组件
class CookbookDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPageBody(),
      backgroundColor: AppColors.primaryBackground,
    );
  }
}

Widget _getPageBody() {
  var listview = ListView(
    children: getListChildren(),
  );
  return listview;
}

List<Widget> getListChildren() {
  // 组件数组
  var list = <Widget>[];

  // 添加推荐菜谱内容
  list.add(
    // 固定列数的 GridView
    Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
      child: GridView.count(
        childAspectRatio: 81 / 100,
        // 设置列数
        crossAxisCount: 2,
        // 解决 GridView 嵌套在 ListView 中报错问题
        shrinkWrap: true,
        // 解决 GridView 嵌套在 ListView 中无法滑动问题
        physics: new NeverScrollableScrollPhysics(),
        // 设置内容
        children: getGridChildren(),
      ),
    ),
  );
  return list;
}

List<Widget> getGridChildren() {
  var list = <Widget>[];
  for (int i = 0; i < 10; i++) {
    list.add(Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
      child: CookbookCard(),
    ));
  }
  return list;
}
