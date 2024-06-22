// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/chat/presentation/manager/chatCuibt.dart';

import '../../../../core/constants.dart';

class ChatBubbleSend extends StatelessWidget {
  ChatBubbleSend({required this.data});
  String data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        data.split(" ")[0] == 'You:'
            ? Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                  decoration: BoxDecoration(
                      color: kPrimaryColor1,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(20, 20),
                          topRight: Radius.elliptical(20, 20),
                          bottomRight: Radius.elliptical(20, 20))),
                  child: Text(
                    data,
                    style: TextStyle(color: kPrimaryColor2, fontSize: 18.sp),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  if (data != '') {
                    BlocProvider.of<ChatCubit>(context).playAudio(data);
                  }
                },
                child: data != ''
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                          decoration: BoxDecoration(
                              color: Color(0xff006D84),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.elliptical(20, 20),
                                  topRight: Radius.elliptical(20, 20),
                                  bottomLeft: Radius.elliptical(20, 20))),
                          child: Text(
                            data,
                            style: TextStyle(
                                color: kPrimaryColor2, fontSize: 18.sp),
                          ),
                        ),
                      )
                    : Container(),
              ),
      ],
    );
  }
}
