import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/generated/l10n.dart';

class ContactProfileInfo extends StatelessWidget {
  const ContactProfileInfo({
    super.key,
    required this.model,
  });

  final Map<String, dynamic> model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          model['NickName'] ?? '',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20.h,
        ),
        model['Privacy'] == '0'
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    model['BloodType'] != ''
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  blurRadius: 7.r,
                                  offset: Offset(5, 5),
                                  color: Color.fromARGB(43, 0, 0, 0))
                            ]),
                            child: Card(
                              color: Theme.of(context).colorScheme.scrim,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S.of(context).bloodtype,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      model['BloodType'] ?? 'null',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 10.h,
                    ),
                    model['Address'] != ''
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10.r,
                                    offset: Offset(10, 6),
                                    color: Color.fromARGB(43, 0, 0, 0))
                              ],
                            ),
                            child: Card(
                              color: Theme.of(context).colorScheme.scrim,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S.of(context).Address,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        model['Address'] ?? 'null',
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 10.h,
                    ),
                    model['ChronicDiseases'] != ''
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10.r,
                                    offset: Offset(10, 6),
                                    color: Color.fromARGB(43, 0, 0, 0))
                              ],
                            ),
                            child: Card(
                              color: Theme.of(context).colorScheme.scrim,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S.of(context).infotoknow,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        model['ChronicDiseases'] ?? 'null',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              )
            : Center(
                child: Text(S.of(context).privacydata),
              ),
      ],
    );
  }
}
