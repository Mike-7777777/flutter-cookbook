// 底部导航选择主页时的页面

import 'package:flutter/material.dart';
import 'package:my_app/requester/cookbooks.dart';
import 'package:my_app/values/fonts.dart';
import 'package:my_app/widget/cookbook-card.dart';
import 'package:my_app/widget/cookbook-detail.dart';
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
  // 组件数组
  var list = <Widget>[];

  // 图片，指定为保证高度完全显示
  var pic = Image(
    image: AssetImage("assets/ndj.jpg"),
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

  //点击事件
  var inkRpic = Builder(
    builder: (context) => InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return FutureBuilder(
            future: CookbooksRequester.getRandom(),
            builder: (context, snapshot) {
              var cookbook = snapshot.data;
              if (cookbook != null) {
                return CookbookDetail(cookbook.id);
              }
              return Text("...");
            },
          );
        }));
      },
      child: rPic,
    ),
  );

  var futurePaddingGrid = getFuturePaddingGrid(); // 固定列数的 GridView
  // 扭蛋机标题
  list.add(
    const Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 10.0),
      child: Text(
        LOCAL_PAGE_GASHAPON_TITLE,
        style: AppFontsStyle.subtitleStyle,
      ),
    ),
  );

  // 扭蛋机 ui
  list.add(Padding(
    padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
    // 点击事件
    child: inkRpic,
  ));

  // 推荐菜谱标题
  list.add(const Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 10.0),
      child: Text(
        LOCAL_PAGE_RECOMMEND_TITLE,
        style: AppFontsStyle.titleStyle,
      )));

  // 添加推荐菜谱内容
  list.add(futurePaddingGrid);

  return list;
}

Widget getFuturePaddingGrid() {
  return FutureBuilder(
    future: CookbooksRequester.queryAll(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      var datas = snapshot.data;

      return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        child: GridView.count(
          childAspectRatio: 80 / 100,
          // 设置列数
          crossAxisCount: 2,
          // 解决 GridView 嵌套在 ListView 中报错问题
          shrinkWrap: true,
          // 解决 GridView 嵌套在 ListView 中无法滑动问题
          physics: new NeverScrollableScrollPhysics(),
          // 设置内容
          children: _getGridChildren(datas),
        ),
      );
    },
  );
}

List<Widget> _getGridChildren(List<dynamic> cookbooks) {
  var list = <Widget>[];
  for (var ck in cookbooks) {
    list.add(Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
      child: CookbookCard(ck),
    ));
  }

  return list;
}
