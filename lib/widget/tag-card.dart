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
      image: new AssetImage("$TAG_IMAGE_FOLDER/${this.tag.name}.png"),
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

    // 分类标题，设置最长显示长度为 1
    // 超过一行的内容自动使用...
    var title = Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: Text(
        this.tag.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );

    // 图片与文字的排版
    var column = Column(
      children: [rPic, title],
    );

    // 添加点击事件
    var inkColumn = InkWell(
      onTap: () {
        showSearch(
            context: context, delegate: CookbookSearchDelegate(this.tag));
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return CookbookDetail().build(context);
        // }));
      },
      child: column,
    );
    return inkColumn;
  }
}
