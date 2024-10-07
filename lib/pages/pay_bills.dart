import 'package:flutter/material.dart';

// Defining the PayBillsPage class, which is a StatelessWidget
class PayBillsPage extends StatelessWidget {
  // controller to handle input for the bill number
  final TextEditingController billNumberController = TextEditingController();
  // controller to handle input for the account number
  final TextEditingController accountNumberController = TextEditingController();
  // controller to handle input for the amount
  final TextEditingController amountController = TextEditingController();

  // list available bill types for the dropdown menu
  final List<String> billTypes = ['DSTV', 'Water', 'Netflix', 'Showmax'];

  // variable to store the currently selected bill type
  String selectedBillType = 'DSTV'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay Bills'), // title displayed in the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown button for selecting the type of Bill
            DropdownButton<String>(
              value: selectedBillType,
              onChanged: (String? newValue) {
                // update selected bill type when a new value is chosen
                selectedBillType = newValue!;
              },
              items: billTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      // placeholder icon for each bill type
                      Icon(Icons.receipt, size: 24),
                      SizedBox(width: 8),
                      Text(value),
                    ],
                  ),
                );
              }).toList(), // convert the List of bill types to dropdown Items
            ),
            SizedBox(height: 16.0), // space between the dropdown and input fields

            // Input field for entering bill number
            TextField(
              controller: billNumberController,
              decoration: InputDecoration(
                labelText: 'Bill Number', // Label shown in the input field
                border: OutlineInputBorder(), // outline border for input field
              ),
            ),
            SizedBox(height: 16.0), // space between input fields

            // Input field for entering account number
            TextField(
              controller: accountNumberController, // connects controller to input field
              decoration: InputDecoration(
                labelText: 'Account Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0), // space between input fields

            // Input field for amount to pay
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // space between input fields and button

            // Button to trigger payment action
            ElevatedButton(
              onPressed: () {
                // Logic to handle payment
                final billNumber = billNumberController.text;
                final accountNumber = accountNumberController.text;
                final amount = amountController.text;

                // Show a message with payment details
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Payment Confirmation'),
                      content: Text(
                          'Paying $amount for $selectedBillType\nBill Number: $billNumber\nAccount Number: $accountNumber'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // close dialog
                          },
                          child: Text('OK'), // Button text
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Pay Bill'), // Button text
            ),
          ],
        ),
      ),
    );
  }
}
