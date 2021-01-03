// 菜谱详细

import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/values/colors.dart';
import 'package:my_app/widget/cookbook-card.dart';

// 定义为无状态组件
class CookbookDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPageBody(),
    );
  }
}

Widget _getPageBody() {
  var listview = ListView(
    children: getListChildren(),
  );
  return listview;
}

List<Widget> getListChildren() {
  // 字体样式
  const titleStyle = TextStyle(
    // color: Colors.blue,
    fontSize: 18.0,
    // height: 1.2,
    fontWeight: FontWeight.bold,
    // fontFamily: "Courier",
    // background: Colors.yellow,
    // decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.dashed,
  );

  //下面这部分需要用数据库代替
  // 菜品大图
  var pic = Image(
    image: NetworkImage(
        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201510%2F20%2F20151020195211_hTCFE.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611990647&t=602b503888a90b3dfcc633cc330955ea"),
    fit: BoxFit.fitHeight,
  );
  // 字体样式未来[低优先级]也可以整合在values文件加中的fonts.dart文件中
  var title = Text(
    "菜谱标题，有可能很长长长长长长长长长长长长长长长长长长长长长长长长长长。",
    maxLines: 2, overflow: TextOverflow.ellipsis, style: titleStyle,
    //TextStyle(height: 1.5, fontWeight: FontWeight.w600, fontSize: 25.0),
  );
  //

  // 下面这部分和cookbook-card.dart中的样式(除比例外)完全重复，有空可以把这两种样式单独摘出来放到values文件夹里的picStyle.dart里面，用的时候直接调用。
  // 固定图片宽度为一比一
  var arPic = AspectRatio(
    aspectRatio: 3 / 2,
    child: pic,
  );

  // 图片圆角
  var rPic = ClipRRect(
    borderRadius: BorderRadius.circular(6.0),
    child: arPic,
  );

  // 组件数组
  var list = <Widget>[];

  // 1. 菜品大图
  list.add(Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0), child: rPic));
  // 2. 菜谱名字
  list.add(Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0), child: title));
  // 3. 菜品原料
  list.add(Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
      height: 200.0,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.red,
              ),
              child: Text(
                "原料1",
              )),
          Container(
            width: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.blue,
            ),
            child: Text(
              "原料2",
            ),
          ),
          Container(
            width: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.green,
            ),
            child: Text(
              "原料3",
            ),
          ),
          Container(
            width: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.yellow,
            ),
            child: Text(
              "原料4",
            ),
          ),
          Container(
            width: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.orange,
            ),
            child: Text(
              "原料5",
            ),
          ),
        ],
      )));

  // 添加推荐菜谱内容
  list.add(
    // 固定列数的 GridView
    Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
      child: GridView.count(
        childAspectRatio: 81 / 100,
        // 设置列数
        crossAxisCount: 2,
        // 解决 GridView 嵌套在 ListView 中报错问题
        shrinkWrap: true,
        // 解决 GridView 嵌套在 ListView 中无法滑动问题
        physics: new NeverScrollableScrollPhysics(),
        // 设置内容
        children: getGridChildren(),
      ),
    ),
  );

  return list;
}

List<Widget> getGridChildren() {
  var list = <Widget>[];
  for (int i = 0; i < 10; i++) {
    list.add(Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
      child: CookbookCard(),
    ));
  }
  return list;
}
