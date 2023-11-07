import 'dart:math';
import 'package:cardoc/controllers/db_provider.dart';
import 'package:cardoc/model/data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DbProvider>(context, listen: false);
    List<CustomerModel> customer = db.customerList;
    double totalRevenue = db.calculateRevenue(customer);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("PIE CHART"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: customer.isNotEmpty,
              replacement: const Center(
                child: Text("There is no list added",
                    style: TextStyle(color: Colors.white)),
              ),
              child: SizedBox(
                height: 300,
                child: PieChart(
                  PieChartData(
                    sections: List.generate(customer.length, (index) {
                      double amount = double.parse(customer[index].amount!);
                      double percentage = (amount / totalRevenue) * 100;
                      return PieChartSectionData(
                        value: percentage,
                        color: getRandomColor(),
                        title: '''${amount.toStringAsFixed(2)}
                            (${percentage.toStringAsFixed(2)}%)''',
                        radius: 80,
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }),
                    sectionsSpace: 5,
                    centerSpaceRadius: 90,
                    startDegreeOffset: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color getRandomColor() {
  return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);
}
