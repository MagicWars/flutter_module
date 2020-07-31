import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';//ios风格
import 'dart:convert';
import 'mock_data.dart';
import 'service_item.dart';

import 'package:flutter_module/page/http/service_method.dart';

class MeiTuanService extends StatefulWidget {
  @override
  _MeiTuanServiceState createState() => _MeiTuanServiceState();
}

class _MeiTuanServiceState extends State<MeiTuanService> with AutomaticKeepAliveClientMixin{

  List<ServiceItemViewModel> lists = [];
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getService();
  }

  getService() async {
    Map data = await DioManager().get('testget');
    //String result = json.encode(data);
    //print(data['data'][0]['title']);
    List list = data['data'];
    List<ServiceItemViewModel> ls = [];
    for(var i=0;i<list.length;i++){
      ServiceItemViewModel s = new ServiceItemViewModel(icon: Icons.favorite,title: list[i]['title']);
      ls.add(s);
    }
    this.setState(() {
      lists = ls;
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _loading ? this._loadingView() :
        GridView.count(
          crossAxisCount:5,//每行显示五个
          padding: EdgeInsets.symmetric(vertical: 0),
          children:lists.map((item) => ServiceItem(data:item)).toList(),
        )
      ],
    );
  }

  Widget _loadingView(){
    return Center(
      child: CupertinoActivityIndicator(),
      );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}


