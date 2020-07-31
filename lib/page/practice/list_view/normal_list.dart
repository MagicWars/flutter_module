import 'package:flutter/material.dart';
import '../../basic_widgets/credit_card.dart';

import '../../basic_widgets/mock_data.dart';


class NormalList extends StatefulWidget {
  @override
  _NormalListState createState() => _NormalListState();
}

class _NormalListState extends State<NormalList> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        CreditCard(data:creditCardData),
        CreditCard(data:creditCardData),
        CreditCard(data:creditCardData),
        CreditCard(data:creditCardData),
        CreditCard(data:creditCardData),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}




