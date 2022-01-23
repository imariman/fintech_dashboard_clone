import 'package:fintech_dashboard_clone/models/enums/transaction_type.dart';
import 'package:fintech_dashboard_clone/models/expense.dart';
import 'package:fintech_dashboard_clone/models/transaction.dart';
import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MockData {
  static BarChartGroupData makeGroupData(
      int x, double y1, Color barColor, double width) {
    return BarChartGroupData(
      barsSpace: 1,
      x: x,
      barRods: [
        BarChartRodData(
          y: y1,
          colors: [barColor],
          width: width,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ],
    );
  }

  static List<BarChartGroupData> getBarChartitems(Color color,
      {double width = 20}) {
    return [
      makeGroupData(0, 5, color, width),
      makeGroupData(1, 6, color, width),
      makeGroupData(2, 8, color, width),
      makeGroupData(3, 5, color, width),
      makeGroupData(4, 7, color, width),
      makeGroupData(5, 9, color, width),
      makeGroupData(6, 3, color, width),
    ];
  }

  static List<Transaction> get transactions {
    return [
      Transaction(
        "45673",
        "Spotify",
        DateTime.now(),
        569.50,
        TransactionType.outgoing,
        "https://i.cbc.ca/1.6128145.1628713609!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_940/regina-john-doe.jpg",
      ),
      Transaction(
        "76154",
        "Transfer",
        DateTime.now(),
        350.50,
        TransactionType.incoming,
        "https://i.cbc.ca/1.6128145.1628713609!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_940/regina-john-doe.jpg",
      ),
      Transaction(
        "322587",
        "Investments",
        DateTime.now(),
        3448.99,
        TransactionType.outgoing,
        "https://i.cbc.ca/1.6128145.1628713609!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_940/regina-john-doe.jpg",
      ),
    ];
  }

  static List<Expense> get otherExpanses {
    return [
      Expense(
        color: Styles.defaultBlueColor,
        expenseName: "Other expenses",
        expensePercentage: 50,
      ),
      Expense(
        color: Styles.defaultRedColor,
        expenseName: "Entertainment",
        expensePercentage: 35,
      ),
      Expense(
        color: Styles.defaultYellowColor,
        expenseName: "Investments",
        expensePercentage: 15,
      )
    ];
  }
}
