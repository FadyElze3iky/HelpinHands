part of 'post_report_cubit.dart';

@immutable
sealed class PostReportState {}

final class PostReportInitial extends PostReportState {}

final class GetImageLoading extends PostReportState {}

final class GetImageSucces extends PostReportState {
  GetImageSucces({required this.image});
  File? image;
}

final class GetImageFailure extends PostReportState {
  GetImageFailure(this.error);
  String error;
}

final class GetReportType extends PostReportState {
  GetReportType({required this.Type});
  String Type;
}

final class UploadWating extends PostReportState {}

final class UploadSucces extends PostReportState {
  String response;
  UploadSucces({required this.response});
}

final class UploadFailure extends PostReportState {
  UploadFailure({required this.error});
  String error;
}
