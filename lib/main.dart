import 'package:flutter/material.dart';

import 'package:my_app/app.dart';
import 'package:my_app/constants.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App 主题及信息设置
      title: APP_TITLE,
      theme: ThemeData(
        //primarySwatch: APP_PRIMARY_Swatch,
        //正在测试用保存在values目录下的colors.dart更灵活的控制颜色
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // 选择需要启动的总页面
      home: MyAppPage(),
    );
  }
}

void main() {
  // Go Go Go！！
  runApp(MyApp());
}
