// 菜谱卡片组件
import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/model/cookbook.dart';
import 'package:my_app/values/fonts.dart';

import 'package:my_app/widget/cookbook-detail.dart';

// 定义为无状态组件
class CookbookCard extends StatelessWidget {
  final Cookbook cookbook;

  CookbookCard(this.cookbook);

  @override
  Widget build(BuildContext context) {
    // 图片，指定为保证高度完全显示
    var pic = Image(
      image: NetworkImage("$BACKEND_ADDRESS/${this.cookbook.preview}"),
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

    // 菜谱标题，设置最长显示长度为 2
    // 超过两行的内容自动使用...
    var title = Text(
      this.cookbook.title,
      style: AppFontsStyle.subtitleStyle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );

    // 图片与文字的排版
    var column = Column(
      children: [rPic, title],
    );

    // 添加点击事件
    var inkColumn = InkWell(
      onTap: () {
        //如果Card作为菜谱也作为类别，点击后需要判断是菜谱还是类别。
        //如果是菜谱则跳转CookbookDetail，否则跳转CookbookCate。
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CookbookDetail(this.cookbook.id).build(context);
        }));
      },
      child: column,
    );
    return inkColumn;
  }
}
