// 单例模式的 Logo 组件
import 'package:flutter/material.dart';
import 'package:my_app/values/colors.dart';
import 'package:my_app/values/fonts.dart';

// 单例模式，使用 LogoWidget.getInstance() 获得单例对象
class LogoWidget extends StatelessWidget {
  // 单例模式模板 start
  LogoWidget._() : super();

  static final _instance = LogoWidget._();

  factory LogoWidget.getInstance() => _instance;
  // 单例模式模板 end

  @override
  Widget build(BuildContext context) {
    // 图片，指定为保证高度完全显示
    var pic = Image(
      image: AssetImage("assets/logo.jpg"),
      fit: BoxFit.fitHeight,
    );

    // 固定图片宽度为一比一
    var arPic = AspectRatio(
      aspectRatio: 1 / 1,
      child: pic,
    );

    // 图片圆角
    var rPic = ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: arPic,
    );

    var cPic = Container(
      height: 50,
      child: rPic,
    );

    var logoTitle = Text(
      "Food Recipe",
      style: AppFontsStyle.titleStyle,
    );
    var cCl = Row(
      children: [cPic, logoTitle],
    );
    return cCl;
  }
}
