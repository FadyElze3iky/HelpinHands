import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/PostReport/presentation/manager/post_report/post_report_cubit.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';

class CaputreImage extends StatelessWidget {
  CaputreImage({super.key});
  File? image;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostReportCubit, PostReportState>(
      listener: (context, state) {
        if (state is GetImageFailure) {
          ShowToast(context: context, massage: state.error, color: Colors.red);
        }
        if (state is GetImageSucces) {
          image = state.image;
        }
      },
      builder: (context, state) {
        if (state is GetImageLoading) {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        } else {
          return Expanded(
              child: image == null
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(100.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 40.w,
                                ),
                                onPressed: () {
                                  BlocProvider.of<PostReportCubit>(context)
                                      .getImage('camera');
                                }, //   onPressed: getImage,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.photo_outlined,
                                  size: 40.w,
                                ),
                                onPressed: () {
                                  BlocProvider.of<PostReportCubit>(context)
                                      .getImage('gallery');
                                }, //   onPressed: getImage,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.all(10.h),
                      child: Image.file(
                        image!,
                        height: 200.0,
                      ),
                    ));
        }
      },
    );
  }
}
