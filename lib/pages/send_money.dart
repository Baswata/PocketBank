import 'package:flutter/material.dart';

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String selectedPaymentMethod = 'Credit Card';
  bool isFavorite = false;
  bool showSuccessMessage = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Money'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: recipientController,
                decoration: InputDecoration(
                  labelText: 'Recipient\'s Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Recipient\'s number cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                value: selectedPaymentMethod,
                items: ['Credit Card', 'Mobile Money', 'Bank Transfer']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedPaymentMethod = newValue!;
                  });
                },
                isExpanded: true,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mark as Favorite'),
                  Switch(
                    value: isFavorite,
                    onChanged: (value) {
                      setState(() {
                        isFavorite = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              CustomSendButton(
                text: 'Send Money',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      showSuccessMessage = true;
                    });
                    print('Sending ${amountController.text} to ${recipientController.text} via $selectedPaymentMethod');
                  }
                },
              ),
              SizedBox(height: 20.0),
              AnimatedOpacity(
                opacity: showSuccessMessage ? 1.0 : 0.0,
                duration: Duration(seconds: 2),
                child: Text(
                  'Transaction Successful!',
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom reusable button widget
class CustomSendButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomSendButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
