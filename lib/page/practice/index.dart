import 'package:flutter/material.dart';
import 'package:flutter_module/page/practice/grid_view/meituan_service.dart';
import 'package:flutter_module/page/practice/list_view/normal_list.dart';

class PracticeIndex extends StatefulWidget {
  @override
  _PracticeIndexState createState() => _PracticeIndexState();
}

class _PracticeIndexState extends State<PracticeIndex> {


  final List<TabInfo> _tabValues = [
    TabInfo('GridView', MeiTuanService()),
    TabInfo('ListView', NormalList())
  ];

  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: _tabValues.length, vsync: ScrollableState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('TabBar'),
        centerTitle: true,
        bottom: TabBar(
            controller: _controller,
            tabs: _tabValues.map((TabInfo e){
              return Tab(
                text: e.title,
              );
            }).toList()
        ),
      ),
      body: TabBarView(
          controller: _controller,
          children: _tabValues.map((e){return e.widget;}).toList()
      ),
    );
  }

}

class TabInfo{

  final String title;

  final Widget widget;

  TabInfo(this.title, this.widget);

}

