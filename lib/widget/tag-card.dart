// 分类卡片组件
import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/model/tag.dart';

import 'package:my_app/widget/search.dart';

// 定义为无状态组件
class TagCard extends StatelessWidget {
  final Tag tag;

  TagCard(this.tag);

  @override
  Widget build(BuildContext context) {
    // 图片，指定为保证高度完全显示
    var pic = Image(
      image: new AssetImage("$TAG_IMAGE_FOLDER/${this.tag.name}.JPG"),
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

    // 图片与文字的排版
    var column = Column(
      children: [rPic,Divider(
          thickness:0.2,
          height:40,
          indent:1,
          color:Colors.black,)],
    );
    // 添加点击事件
    var inkColumn = InkWell(
      onTap: () {
        showSearch(
            context: context, delegate: CookbookSearchDelegate(this.tag));
      },
      child: column,
    );
    return inkColumn;
  }
}
