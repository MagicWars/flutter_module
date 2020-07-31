import 'package:flutter/material.dart';
import 'meituan_service.dart';
import 'package:dio/dio.dart';

//卡片布局
class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return MeiTuanService();
  }
}
