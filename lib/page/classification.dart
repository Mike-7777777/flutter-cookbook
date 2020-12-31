// 底部导航选择分类时的页面
import 'package:flutter/material.dart';

import 'package:my_app/constants.dart';

// 分类页面
class ClassificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClassificationPageState();
}

// 分类页面的状态
class _ClassificationPageState extends State<ClassificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white, // 设置顶部 bar 颜色为白色
        // elevation: 0, // 取消阴影
        title: const Text(
          CLASSIFICATION_PAGE_TITLE,
          style: TextStyle(color: Colors.black),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.search,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       showSearch(
        //           context: context, delegate: CookbookSearchDelegate());
        //     },
        //   ),
        // ]
      ),
    );
  }
}
