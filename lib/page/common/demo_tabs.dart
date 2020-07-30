import 'package:flutter/material.dart';

class DemoTabViewModel{
  final String title;
  final Widget weight;

  DemoTabViewModel(this.title, this.weight);
}

class DemoTabs extends StatelessWidget {

  final String title;
  final List<DemoTabViewModel> demos;
  final bool tabScrollable;
  final TabController tabController;

  const DemoTabs({Key key, this.title, this.demos, this.tabScrollable, this.tabController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body:TabBarView(
            controller: this.tabController,
            children: this.demos.map((item) => item.weight).toList()
        ) ,
    );
  }
}

