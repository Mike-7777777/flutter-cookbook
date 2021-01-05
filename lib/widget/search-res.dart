// 搜索结果样式(与首页相同)

import 'package:flutter/material.dart';
import 'package:my_app/values/colors.dart';
import 'package:my_app/widget/cookbook-card.dart';

// 定义为无状态组件
class SearchResult extends StatelessWidget {
  final List<dynamic> cookbooks;

  SearchResult(this.cookbooks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPageBody(),
      backgroundColor: AppColors.primaryBackground,
    );
  }

  Widget _getPageBody() {
    // 组件数组
    var list = <Widget>[];

    var paddingGridView = Padding(
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
        children: _getGridChildren(),
      ),
    );

    // 添加顶部 10 的 padding
    list.add(SizedBox(height: 10));
    // 添加菜谱内容
    list.add(paddingGridView);

    return ListView(
      children: list,
    );
  }

  List<Widget> _getGridChildren() {
    var list = <Widget>[];

    for (var cookbook in this.cookbooks) {
      list.add(Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
        child: CookbookCard(cookbook),
      ));
    }

    return list;
  }
}
