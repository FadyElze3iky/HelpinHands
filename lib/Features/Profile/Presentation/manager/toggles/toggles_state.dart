part of 'toggles_cubit.dart';

@immutable
sealed class TogglesState {}

final class TogglesInitial extends TogglesState {}

final class SetPrivacyLoading extends TogglesState {}

final class SetPrivacySuccess extends TogglesState {
  bool value;
  SetPrivacySuccess({required this.value});
}

final class SetPrivacyFailure extends TogglesState {
  String error;
  SetPrivacyFailure({required this.error});
}

final class GetPrivacyLoading extends TogglesState {}

final class GetPrivacySuccess extends TogglesState {
  bool value;
  GetPrivacySuccess({required this.value});
}

final class GetPrivacyFailure extends TogglesState {
  String error;
  GetPrivacyFailure({required this.error});
}
