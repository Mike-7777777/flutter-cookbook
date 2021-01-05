// 分类页面

import 'package:flutter/material.dart';
import 'package:my_app/model/tag.dart';
import 'package:my_app/requester/cookbooks.dart';
import 'package:my_app/values/colors.dart';
import 'package:my_app/widget/search-res.dart';
import 'package:my_app/widget/search.dart';

// 定义为无状态组件
class TagPage extends StatelessWidget {
  final Tag tag;
  TagPage(this.tag);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground, // 设置顶部 bar 颜色为白色
        leading: IconButton(
          // 关闭该组件，返回上一级
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: AppColors.primaryText),
        ),
        title: Text(
          this.tag.name,
          style: TextStyle(color: AppColors.primaryText),
        ),
        actions: <Widget>[getSearchIconWidgetWithTag(context, tag)],
      ),
      body: _getPageBody(),
      backgroundColor: AppColors.primaryBackground,
    );
  }

  Widget _getPageBody() {
    var futureListview = FutureBuilder(
      future: CookbooksRequester.queryByTagAndKeyword(this.tag.id, ""),
      // initialData: {},
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        var data = snapshot.data;
        if (data != null) {
          return SearchResult(data);
        }
        return Text("123");
      },
    );

    return futureListview;
  }
}
