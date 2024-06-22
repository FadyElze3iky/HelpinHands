import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/PostReport/presentation/manager/post_report/post_report_cubit.dart';
import 'package:helping_hands/generated/l10n.dart';

class RadoiForm extends StatelessWidget {
  RadoiForm({
    super.key,
  });
  String selectedOption = 'Accident';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostReportCubit, PostReportState>(
      listener: (context, state) {
        if (state is GetReportType) {
          selectedOption = state.Type;
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: 230.w,
          child: Column(
            children: [
              RadioListTile(
                title: Text(S.of(context).Accident),
                value: 'Accident',
                groupValue: selectedOption,
                onChanged: (value) {
                  BlocProvider.of<PostReportCubit>(context)
                      .setType(context, value!);
                },
              ),
              RadioListTile(
                title: Text(S.of(context).RoadMalfunction),
                value: 'Road Malfunction',
                groupValue: selectedOption,
                onChanged: (value) {
                  BlocProvider.of<PostReportCubit>(context)
                      .setType(context, value!);
                },
              ),
              RadioListTile(
                title: Text(S.of(context).UnsafeArea),
                value: 'Unsafe Area',
                groupValue: selectedOption,
                onChanged: (value) {
                  BlocProvider.of<PostReportCubit>(context)
                      .setType(context, value!);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
