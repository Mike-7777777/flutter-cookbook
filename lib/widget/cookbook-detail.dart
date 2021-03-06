// 菜谱详细

import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/requester/cookbooks.dart';
import 'package:my_app/values/colors.dart';
import 'package:my_app/values/values.dart';

// 定义为无状态组件
class CookbookDetail extends StatelessWidget {
  final int id;
  final String defaultYuanLiaoImage =
      'https://dummyimage.com/600x100/ffffff/fff';

  final String defaultBuZhouImage = 'https://dummyimage.com/600x100/ffffff/fff';

  CookbookDetail(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPageBody(),
      backgroundColor: AppColors.primaryBackground,
    );
  }

  Widget _getPageBody() {
    var futureListview = FutureBuilder(
      future: CookbooksRequester.queryById(this.id),
      // initialData: {},
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        var data = snapshot.data;
        if (data != null) {
          return ListView(
            children: getListChildren(data),
          );
        }
        return Text("123");
      },
    );

    return futureListview;
  }

  List<Widget> getListChildren(dynamic cookbook) {
    //下面这部分需要用数据库代替
    // 菜品大图
    var pic = Image(
      image: NetworkImage("$BACKEND_ADDRESS/${cookbook.preview}"),
      fit: BoxFit.fitHeight,
    );
    // 菜谱标题
    // 字体样式未来[低优先级]也可以整合在values文件加中的fonts.dart文件中
    var title = Text(
      cookbook.title,
      style: AppFontsStyle.titleStyle,
      maxLines: 9, overflow: TextOverflow.ellipsis,
      //TextStyle(height: 1.5, fontWeight: FontWeight.w600, fontSize: 25.0),
    );
    //菜谱简介
    var intro = Text(
      cookbook.brief,
      style: AppFontsStyle.normalStyle,
      maxLines: 9,
      overflow: TextOverflow.ellipsis,
    );
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
    // 3. 菜谱介绍
    list.add(Padding(
        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0), child: intro));
    // 3. 菜品原料
    list.add(Container(
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
        height: 200.0,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: getYuanlilaoChildren(cookbook.ingredients),
        )));
    // 4. 步骤
    list.add(
      // 固定列数的 GridView
      Padding(
        padding: EdgeInsets.fromLTRB(16, 16.0, 16.0, 100.0),
        child: GridView.count(
          childAspectRatio: 81 / 100,
          // 设置列数
          crossAxisCount: 1,
          // 解决 GridView 嵌套在 ListView 中报错问题
          shrinkWrap: true,
          // 解决 GridView 嵌套在 ListView 中无法滑动问题
          physics: new NeverScrollableScrollPhysics(),
          // 设置内容
          children: getBuzhouChildren(cookbook.cookSteps),
        ),
      ),
    );
    // 5. 下载按钮
    list.add(Padding(
      padding: EdgeInsets.fromLTRB(16, 16.0, 16.0, 100.0),
      child: Builder(
        builder: (ctx) => ElevatedButton(
          onPressed: () {
            print("点击了按钮");
            final snackBar = SnackBar(
              content: Text('已添加到下载列表中'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );
            // Find the Scaffold in the widget tree and use
            // it to show a SnackBar.
            Scaffold.of(ctx).showSnackBar(snackBar);
          },
          child: Text("Download this recipe"),
        ),
      ),
    ));
    //返回按钮
    list.add(
      Padding(
        padding: EdgeInsets.fromLTRB(16, 16.0, 16.0, 100.0),
        child: BackButton(),
      ),
    );
    return list;
  }

  //原料卡片
  List<Widget> getYuanlilaoChildren(List<dynamic> ingredients) {
    var list = <Widget>[];
    for (var ing in ingredients) {
      list.add(
        Container(
            //此处padding对BoxDecoration(红色框)无效
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            width: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              //背景色
              color: AppColors.primaryElement,
              //加粗box的border，让每个box不粘在一起
              border: Border.all(
                color: AppColors.primaryBackground,
                width: 6,
              ),
              image: DecorationImage(
                scale: 10,
                image: NetworkImage(ing.picture == null
                    ? defaultYuanLiaoImage
                    : "$BACKEND_ADDRESS/${ing.picture}"),
                fit: BoxFit.fitWidth,
                //图片出现在中下
                alignment: Alignment(0, 1),
              ),
            ),
            child: Text(
              //color: AppColors.primaryElementText,
              ing.name,
              style: AppFontsStyle.normalStyle,
              textAlign: TextAlign.center,
            )),
      );
    }
    return list;
  }

  // 步骤循环
  List<Widget> getBuzhouChildren(List<dynamic> steps) {
    var list = <Widget>[];
    //https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimage.biaobaiju.com%2Fuploads%2F20191101%2F17%2F1572601975-NVzXavQCRt.jpg&refer=http%3A%2F%2Fimage.biaobaiju.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg
    for (var step in steps) {
      list.add(Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.primaryBackground,
          border: Border.all(
            color: AppColors.primaryBackground,
            width: 6,
          ),
          image: DecorationImage(
            scale: 10,
            image: NetworkImage(step.picture == null
                ? defaultBuZhouImage
                : "$BACKEND_ADDRESS/${step.picture}"),
            fit: BoxFit.fitWidth,
            //图片出现在中下
            alignment: Alignment(0, 1),
          ),
        ),
        child: Column(children: [
          Text(
            "Step ${step.number} :",
            style: AppFontsStyle.subtitleStyle,
          ),
          Text(
            "${step.description}",
            style: AppFontsStyle.normalStyle,
          )
        ]),
      ));
    }
    return list;
  }
}
