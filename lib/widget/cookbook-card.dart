// 菜谱卡片组件
import 'package:flutter/material.dart';

// 定义为无状态组件
class CookbookCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 图片，指定为保证高度完全显示
    var pic = Image(
      image: NetworkImage(
          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201510%2F20%2F20151020195211_hTCFE.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611990647&t=602b503888a90b3dfcc633cc330955ea"),
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
      "菜谱标题，有可能很长长长长长长长长长长长长长长长长长长长长长长长长长长。",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );

    // 图片与文字的排版
    var column = Column(
      children: [rPic, title],
    );

    return column;
  }
}
