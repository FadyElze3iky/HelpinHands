import 'package:flutter/material.dart';
import 'package:helping_hands/Features/PostReport/presentation/widgets/capture_image.dart';
import 'package:helping_hands/Features/PostReport/presentation/widgets/radio_form.dart';
import 'package:image_picker/image_picker.dart';

class PostReportBody extends StatelessWidget {
  PostReportBody({super.key});

  final picker = ImagePicker();

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RadoiForm(),
        CaputreImage(),
      ],
    );
  }
}
