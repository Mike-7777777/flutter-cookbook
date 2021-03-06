import 'dart:ui';

class AppColors {
  //fromARGB(透明度,R,G,B)
  /// 主背景 白色
  static const Color primaryBackground = Color.fromARGB(255, 247, 239, 230);

  /// 主文本 灰色
  static const Color primaryText = Color.fromARGB(255, 1, 1, 1);

  /// 主控件-背景 绿色
  static const Color primaryElement = Color.fromARGB(255, 105, 148, 122);

  /// 主控件-文本 白色
  static const Color primaryElementText = Color.fromARGB(255, 253, 253, 253);
  //Color.fromARGB(255, 255, 255, 255);

  // *****************************************

  /// 第二种控件-背景色 淡灰色
  static const Color secondaryElement = Color.fromARGB(255, 246, 246, 246);

  /// 第二种控件-文本 浅蓝色
  static const Color secondaryElementText = Color.fromARGB(255, 41, 103, 255);

  // *****************************************

  /// 第三种控件-背景色 石墨色
  static const Color thirdElement = Color.fromARGB(255, 45, 45, 47);

  /// 第三种控件-文本 浅灰色2
  static const Color thirdElementText = Color.fromARGB(255, 141, 141, 142);

  // *****************************************

  /// tabBar 默认颜色 灰色
  static const Color tabBarElement = Color.fromARGB(255, 208, 208, 208);

  /// tabCellSeparator 单元格底部分隔条 颜色
  static const Color tabCellSeparator = Color.fromARGB(255, 230, 230, 231);

  //测试用不透明粉红色
  static const Color pink = Color.fromARGB(255, 255, 20, 147);
}
