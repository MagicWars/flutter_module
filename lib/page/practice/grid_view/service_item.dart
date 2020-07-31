import 'package:flutter/material.dart';


class ServiceItem extends StatelessWidget {

  final ServiceItemViewModel data;

  const ServiceItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('点击了${this.data.title}');
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 5),
        child: Column(
          children: <Widget>[
            Expanded(
                child:Icon(
                  this.data.icon,
                  size: 25,
                  color: Colors.lightBlue,
                )
            ),
            Text(
              this.data.title,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF333333),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ServiceItemViewModel {
  /// 图标
  final IconData icon;

  /// 标题
  final String title;

  const ServiceItemViewModel({
    this.icon,
    this.title,
  });
}
