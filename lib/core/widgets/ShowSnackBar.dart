import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void ShowToast({
  required BuildContext context,
  required String massage,
  required Color color,
}) {
  try {
    Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: color,
        gravity: ToastGravity.BOTTOM);
  } catch (e) {}
}
