// 应用的总页面
import 'package:flutter/material.dart';

import 'package:my_app/page/classification.dart';
import 'package:my_app/page/home.dart';
import 'package:my_app/page/local.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/values/values.dart';

// 页面
class MyAppPage extends StatefulWidget {
  MyAppPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

// 页面状态
class _MyAppPageState extends State<MyAppPage> {
  // 当前选择页
  int _selectedIndex = 0;

  // 页面数组，通过数组下下标和页面对应
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ClassificationPage(),
    LocalPage(),
  ];

  // 点击 bar 时的触发函数
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 底部导航按钮集合
  static const items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: HOME_PAGE_LABEL,
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category_rounded),
      label: CLASSIFICATION_PAGE_LABEL,
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.download_rounded),
      label: LOCAL_PAGE_LABEL,
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // 底部导航
    var bottomNavigationBar = BottomNavigationBar(
      items: items,
      // 底部导航起始位置
      currentIndex: _selectedIndex,
      // 底部导航点击事件
      onTap: _onItemTapped,
      //fixed模式导航栏背景色
      //backgroundColor: AppColors.pink,
      //选中后的颜色
      fixedColor: AppColors.primaryElement,
      unselectedItemColor: AppColors.primaryText,
      //排布模式
      type: BottomNavigationBarType.shifting,
    );

    // 页面框架
    var scaffold = Scaffold(
      // key: scaffoldKey,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );

    return scaffold;
  }
}
