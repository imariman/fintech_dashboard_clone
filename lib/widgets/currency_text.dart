import 'package:fintech_dashboard_clone/models/enums/transaction_type.dart';
import 'package:flutter/material.dart';

class CurrencyText extends StatelessWidget {
  final String currency;
  final double amount;
  final TransactionType transactionType;
  final double fontSize;
  const CurrencyText({
    Key? key,
    this.fontSize = 20,
    required this.currency,
    required this.amount,
    this.transactionType = TransactionType.unknown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "${TransactionTypeExtensions(transactionType).sign} $currency ",
        style: TextStyle(
          fontSize: fontSize * 0.7,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: amount.toStringAsFixed(2),
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
