import 'package:flutter/material.dart';

//define the send money class
class SendMoneyPage extends StatelessWidget {
  //controller for sending money input fields
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  widget build(BuildContext){
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Money')
      )
    )
  }
}