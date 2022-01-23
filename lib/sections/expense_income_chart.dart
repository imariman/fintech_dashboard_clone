import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:fintech_dashboard_clone/widgets/bar_chart_with_title.dart';
import 'package:flutter/cupertino.dart';

class ExpenseIncomeCharts extends StatelessWidget {
  const ExpenseIncomeCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BarChartWithTitle(
            title: "Expence",
            amount: 5340,
            barColor: Styles.defaultBlueColor,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: BarChartWithTitle(
            title: "Income",
            amount: 1980,
            barColor: Styles.defaultRedColor,
          ),
        ),
      ],
    );
  }
}
