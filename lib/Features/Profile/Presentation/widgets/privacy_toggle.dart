import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/toggles/toggles_cubit.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';

class PrivacyToggle extends StatelessWidget {
  PrivacyToggle({super.key});

  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TogglesCubit>(context).getPrivacy();
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocConsumer<TogglesCubit, TogglesState>(
            listener: (context, state) {
              if (state is GetPrivacySuccess) {
                _isOn = state.value;
              }
              if (state is SetPrivacySuccess) {
                _isOn = state.value;
              }
              if (state is GetPrivacyFailure) {
                ShowToast(
                    context: context, massage: state.error, color: Colors.red);
              }
              if (state is SetPrivacyFailure) {
                ShowToast(
                    context: context, massage: state.error, color: Colors.red);
              }
            },
            builder: (context, state) {
              return Switch(
                  activeColor: Theme.of(context).colorScheme.secondary,
                  inactiveThumbColor: Theme.of(context).colorScheme.secondary,
                  trackOutlineColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.secondary),
                  value: _isOn,
                  onChanged: (j) {
                    BlocProvider.of<TogglesCubit>(context).setPrivacy(j);
                  });
            },
          ),
        ],
      ),
    );
  }
}
