import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'dart:convert';
import 'store.dart';
import 'page/practice/list_view/normal_list.dart';
import 'page/temp.dart';
import 'page/basic_widgets/pet_card_view.dart';
import 'page/practice/grid_view/index.dart';
import 'page/practice/index.dart';

import 'page/basic_widgets/mock_data.dart';

void main() => runApp(MyApp());


Widget _widgetForRoute(String route){
  print("route = $route");
  //String routeName = route.indexOf('?') == -1 ? route : route.substring(0, route.indexOf('?'));
  //String androidMsg = route.indexOf('?') == -1 ? '{}' : route.substring(route.indexOf('?') + 1);
  switch(route){
    case 'store':
      return Store(msg: "zdy");
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Bank Card"),
          ),
          //body: NormalList(),
//          body:ListView(
//            children: <Widget>[
//              PetCard(data: petCardViewModel),GridViewDemo()
//              PetCard(data: petCardViewModel)
//            ],
//          ),
            body:PracticeIndex()
        ),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _batteryLevel = 'Battery level: unknown.';
  String _chargingStatus = 'Battery status: unknown.';
  static const MethodChannel methodChannel = MethodChannel('samples.flutter.io/battery');


  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final String result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  void _onEvent(Object event) {
    setState(() {
      _chargingStatus =
      "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
    });
  }

  void _onError(Object error) {
    setState(() {
      _chargingStatus = 'Battery status: unknown.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_batteryLevel, key: const Key('Battery level label')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  child: const Text('Refresh'),
                  onPressed: _getBatteryLevel,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  child: const Text('返回Android'),
                  onPressed: (){
                    Map<String, dynamic> result = {'message': '我是你Flutter Der!'};
                    methodChannel.invokeMethod('customFlutterBack',result);
                  },
                ),
              ),
            ],
          ),
          Text(_chargingStatus),
        ],
      ),
    );
  }
}
