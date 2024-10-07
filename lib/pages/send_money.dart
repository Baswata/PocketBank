import 'package:flutter/material.dart';

// Define the SendMoneyPage class
class SendMoneyPage extends StatelessWidget {
  // Controllers for sending money input fields
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Money'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: recipientController,
              decoration: InputDecoration(
                labelText: 'Recipient\'s Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String recipient = recipientController.text;
                String amount = amountController.text;

                print('Sending $amount to $recipient');
              },
              child: Text('Send Money'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
