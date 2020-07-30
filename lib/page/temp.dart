import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: EdgeInsets.only(left: 20,top: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF17B68), Color(0xFFE95F66)]
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              blurRadius: 6,
              spreadRadius: 4,
              color: Color.fromARGB(20, 0, 0, 0)
          )
        ]
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: -100,
            bottom: -100,
            child: Image.asset(
              'assets/pics/bank_zs.png',
              width: 250,
              height: 250,
              color: Colors.white10,
            ),
          ),
          Positioned(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.asset('assets/pics/bank_zs.png',width: 36,height: 36),
                        radius: 25,
                        backgroundColor: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.only(left: 15)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('招商银行',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text('信用卡',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(200, 255, 255, 255),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
