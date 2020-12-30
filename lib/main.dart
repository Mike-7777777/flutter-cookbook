import 'package:flutter/material.dart';
import 'package:my_app/page/classification.dart';
import 'package:my_app/page/home.dart';
import 'package:my_app/page/local.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

/// This is the private State class that goes with MyStatefulWidget.
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // 当前选择页

  static List<Widget> _widgetOptions = <Widget>[
    // 页面数组，通过数组下下标和页面对应
    HomePage(),
    ClassificationPage(),
    LocalPage(),
  ];

  void _onItemTapped(int index) {
    // 点击 bar 时的触发函数
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 底部导航按钮集合
    const items = const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: '主页',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.folder_open),
        label: '分类',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.download_outlined),
        label: '本地',
      ),
    ];

    // 底部导航
    var bottomNavigationBar = BottomNavigationBar(
      items: items,
      // 底部导航起始位置
      currentIndex: _selectedIndex,
      // 底部导航点击事件
      onTap: _onItemTapped,
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
