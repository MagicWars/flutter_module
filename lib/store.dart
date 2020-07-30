import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Store extends StatefulWidget {

  final String msg;

  const Store({Key key, this.msg}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  static const platform = const MethodChannel('com.yn.platform/battery');

  @override
  void initState() {
    // TODO: implement initState
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("添加门店X"),
        ),
        body: Column(
          children: <Widget>[
            Text("安卓传过来的值${widget.msg}"),
            RaisedButton(onPressed: _getBatteryLevel,
            child: Text("返回原生页面"),)
          ],
        ),
      ),
    );
  }

  Future<void> _getBatteryLevel() async{
    final int result = await platform.invokeMethod('getBatteryLevel');
    print("flutter result $result");
  }

}

