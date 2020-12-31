// 搜索框实现
import 'package:flutter/material.dart';

// 基于官方 SearchDelegate 实现搜索框
class CookbookSearchDelegate extends SearchDelegate {
  int count = 0;

  // 修改搜索输入提示文字
  // 解决方案来自 https://stackoverflow.com/questions/54518741/flutter-change-search-hint-text-of-searchdelegate
  @override
  String get searchFieldLabel => "输入关键词搜索";

  @override
  List<Widget> buildActions(BuildContext context) {
    // 搜索栏右侧按钮，可以是多个

    // 清除输入按钮
    var clearBtn = IconButton(
      icon: Icon(Icons.clear),
      // 当前输入置空
      // query 有隐式 set 方法，修改值会触发 buildSuggestions 方法
      onPressed: () => this.query = "",
    );

    // 执行搜索按钮
    var doSearchBtn = IconButton(
      icon: Icon(Icons.search),
      // 调用 showResults 来执行搜索
      // 这会调用到自己重写的 buildResults 方法
      onPressed: () => this.showResults(context),
    );

    return [clearBtn, doSearchBtn];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // 搜索栏最左侧按钮，只能有一个

    // 返回按钮
    var backBtn = IconButton(
      // 关闭该组件，返回上一级
      onPressed: () => this.close(context, null),
      icon: Icon(Icons.arrow_back),
    );

    return backBtn;
  }

  @override
  Widget buildResults(BuildContext context) {
    // 构建搜索结果并返回
    return Text("124");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // 输入文字时给出的提示
    print(this.count++); // For debug
    return Container();
  }
}

// 方便获取搜索入口图标的函数
Widget getSearchIconWidget(BuildContext context) {
  var searchWidget = IconButton(
    icon: const Icon(
      Icons.search,
    ),
    onPressed: () {
      showSearch(context: context, delegate: CookbookSearchDelegate());
    },
  );

  return searchWidget;
}
