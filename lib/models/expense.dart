import 'package:flutter/material.dart';

class Expense {
  final String expenseName;
  final Color color;
  final double expensePercentage;

  Expense({
    required this.expenseName,
    required this.color,
    required this.expensePercentage,
  });
}
