import 'package:flutter/material.dart';
import 'package:macromasterai/Constants/Constants.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {

  List<Transaction> transactions = [
    Transaction(description: "Avocado Salad", date: DateTime.now().subtract(const Duration(days: 1)), amount: 50.00, isCredit: false),
    Transaction(description: "Salary", date: DateTime.now().subtract(const Duration(days: 2)), amount: 1000.00, isCredit: true),
    Transaction(description: "Coffee", date: DateTime.now().subtract(const Duration(days: 3)), amount: 5.00, isCredit: false),
    // Add more transactions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const PoppinsTextStyle(
          text: "Transaction History",
          textSize: 18,
          textColor: Colors.black,
          isBold: true),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          Transaction transaction = transactions[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.arrow_downward,
                  color:Colors.red),
              title: Text(transaction.description),
              subtitle: Text("${transaction.date.day}/${transaction.date.month}/${transaction.date.year}"),
              trailing: Text("\$${transaction.amount.toStringAsFixed(2)}"),
            ),
          );
        },
      ),
    );
  }
}


class Transaction {
  final String description;
  final DateTime date;
  final double amount;
  final bool isCredit;

  Transaction({required this.description, required this.date, required this.amount, required this.isCredit});
}
