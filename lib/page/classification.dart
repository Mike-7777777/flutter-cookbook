// 底部导航选择分类时的页面
import 'package:flutter/material.dart';

import 'package:my_app/constants.dart';
import 'package:my_app/values/values.dart';
import 'package:my_app/widget/cookbook-card.dart';

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
        backgroundColor: AppColors.primaryBackground, // 设置顶部 bar 颜色为白色
        //elevation: 0, // 取消阴影
        title: const Text(
          CLASSIFICATION_PAGE_TITLE,
          style: TextStyle(color: AppColors.primaryText),
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
      body: _getPageBody(),
    );
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
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      decorationStyle: TextDecorationStyle.dashed,
    );

    // 组件数组
    var list = <Widget>[];

    // 图片，指定为保证高度完全显示
    var pic = Image(
      image: new AssetImage("assets/ndj.jpg"),
      fit: BoxFit.fitHeight,
    );

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

    // 添加类别内容
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
}
