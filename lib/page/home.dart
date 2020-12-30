// 底部导航选择主页时的页面
import 'package:flutter/material.dart';
import 'package:my_app/widget/search.dart';

// 本地页面
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

// 本地页面的状态
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.white, // 设置顶部 bar 颜色为白色
          // elevation: 0, // 取消阴影
          title: const Text(
            "Logo",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                showSearch(
                    context: context, delegate: CookbookSearchDelegate());
              },
            ),
          ]),
    );
  }
}
