import 'package:fintech_dashboard_clone/data/mock_data.dart';
import 'package:fintech_dashboard_clone/models/expense.dart';
import 'package:fintech_dashboard_clone/models/pie_data.dart';
import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:fintech_dashboard_clone/widgets/category_box.dart';
import 'package:fintech_dashboard_clone/widgets/expense_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StaticsByCategory extends StatefulWidget {
  const StaticsByCategory({Key? key}) : super(key: key);

  @override
  State<StaticsByCategory> createState() => _StaticsByCategoryState();
}

class _StaticsByCategoryState extends State<StaticsByCategory> {
  int touchedIndex = -1;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Styles.defaultPadding),
      child: CategoryBox(
        suffix: Container(),
        title: "Statistics by category",
        children: [
          Expanded(
            child: _pieChart(
              MockData.otherExpanses
                  .map(
                    (e) => PieData(value: e.expensePercentage, color: e.color),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: _otherExpanses(MockData.otherExpanses),
          ),
        ],
      ),
    );
  }

  Widget _otherExpanses(List<Expense> otherExpenses) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: Styles.defaultLightWhiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(2),
        children: otherExpenses
            .map((Expense e) => ExpenseWidget(expense: e))
            .toList(),
      ),
    );
  }

  Widget _pieChart(List<PieData> data) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              touchedIndex == -1
                  ? "100%"
                  : "${data[touchedIndex].value.toStringAsFixed(0)}%",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PieChart(
            PieChartData(
              sections: data
                  .map(
                    (e) => PieChartSectionData(
                      color: e.color,
                      value: e.value,
                      radius: touchedIndex == data.indexOf(e) ? 35.0 : 25.0,
                      title: '',
                    ),
                  )
                  .toList(),
              pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              }),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 50,
            ),
            swapAnimationDuration: const Duration(milliseconds: 150),
            swapAnimationCurve: Curves.linear,
          ),
        ],
      ),
    );
  }
}
