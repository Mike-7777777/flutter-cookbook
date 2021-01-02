// 菜谱详细

import 'package:flutter/material.dart';

// 定义为无状态组件
class CookbookDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('菜谱详情页，点击返回'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
