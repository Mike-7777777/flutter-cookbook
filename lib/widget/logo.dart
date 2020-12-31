// 单例模式的 Logo 组件
import 'package:flutter/material.dart';

// 单例模式，使用 LogoWidget.getInstance() 获得单例对象
class LogoWidget extends StatelessWidget {
  // 单例模式模板 start
  LogoWidget._() : super();

  static final _instance = LogoWidget._();

  factory LogoWidget.getInstance() => _instance;
  // 单例模式模板 end

  @override
  Widget build(BuildContext context) {
    return Text("Logo");
  }
}
