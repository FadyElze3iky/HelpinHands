import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/report_model.dart';

class HomeList extends StatelessWidget {
  HomeList({super.key, required this.reports});
  List reports;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: reports.length,
      itemBuilder: (context, index) => ReportModel(reportData: reports[index]),
    );
  }
}
