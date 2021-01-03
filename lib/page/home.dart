// 底部导航选择主页时的页面
import 'package:flutter/material.dart';
import 'package:my_app/widget/cookbook-card.dart';
import 'package:my_app/widget/logo.dart';
import 'package:my_app/widget/search.dart';
import 'package:my_app/values/values.dart';

import 'package:my_app/constants.dart';

// 本地页面
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

// 本地页面的状态
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 获取搜索图标组件
    var searchIconWidget = getSearchIconWidget(context);

    // 页面框架
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground, // 设置顶部 bar 颜色为白色
        title: LogoWidget.getInstance(),
        actions: <Widget>[searchIconWidget],
      ),
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

  // 组件数组
  var list = <Widget>[];

  // 扭蛋机标题
  list.add(
    const Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 10.0),
      child: Text(
        LOCAL_PAGE_GASHAPON_TITLE,
        style: titleStyle,
      ),
    ),
  );
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

  // 摇蛋机ui
  // 还没写点击事件
  list.add(Container());
  list.add(Padding(
    padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
    //onPressed: _log,
    child: rPic,
    //child: ElevatedButton(
    //child: Text("浮动按钮"),
    //style: ButtonStyle(
    //  backgroundColor: MaterialStateProperty.all(AppColors.primaryElement),
    //  foregroundColor:
    //      MaterialStateProperty.all(AppColors.primaryElementText),
    //),
    //color: AppColors.primaryElement,
    //textColor: AppColors.primaryElementText),
    //));
  ));

  // 推荐菜谱标题
  list.add(const Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 10.0),
      child: Text(
        LOCAL_PAGE_RECOMMEND_TITLE,
        style: titleStyle,
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

_log() {
  print("点击了按钮");
}
