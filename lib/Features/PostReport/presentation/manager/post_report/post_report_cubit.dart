import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/Features/PostReport/data/post_report_imp.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:meta/meta.dart';

part 'post_report_state.dart';

class PostReportCubit extends Cubit<PostReportState> {
  PostReportCubit() : super(PostReportInitial());
  PostReportImp P = PostReportImp();

  void getImage(String sourse) async {
    emit(GetImageLoading());
    try {
      if (sourse == 'camera') {
        File? file = await PostReportImp().pickImage('camera');
        P.setImage = file;
        emit(GetImageSucces(image: file));
      } else {
        File? file = await PostReportImp().pickImage('gallery');
        P.setImage = file;

        emit(GetImageSucces(image: file));
      }
    } catch (e) {
      emit(GetImageFailure(e.toString()));
    }
  }

  void setType(context, String type) {
    try {
      P.setType = type;
      emit(GetReportType(Type: type));
    } catch (e) {
      ShowToast(context: context, massage: e.toString(), color: Colors.red);
    }
  }

  void uploadPost() async {
    emit(UploadWating());
    try {
      File? image = P.image;
      String type = P.report_type ?? 'Accident';
      String response = await PostReportImp().uploadPost(
        type: type,
        image: image,
      );
      emit(UploadSucces(response: response));
    } catch (e) {
      log(e.toString());
      emit(UploadFailure(error: e.toString()));
    }
  }
}
