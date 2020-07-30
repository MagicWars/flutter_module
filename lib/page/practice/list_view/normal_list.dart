import 'package:flutter/material.dart';
import '../../basic_widgets/credit_card.dart';

import '../../basic_widgets/mock_data.dart';


class NormalList extends StatelessWidget {
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
}


