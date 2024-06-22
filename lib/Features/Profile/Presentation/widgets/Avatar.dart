import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserField/user_field_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/avatar_image.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';

// ignore: must_be_immutable
class Avatar extends StatelessWidget {
  Avatar({
    super.key,
  });
  dynamic model = {};
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserFieldCubit, UserFieldState>(
      listener: (context, state) {
        if (state is GetUserDataSuccess) {
          model = state.data;
        }
        if (state is GetUserDataFail) {
          ShowToast(context: context, massage: state.error, color: Colors.red);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            AvatarImage(
              model: model,
            ),
            model['NickName'] == null
                ? Text(
                    '',
                    style: TextStyle(fontSize: 20.sp),
                  )
                : Text(
                    model['NickName'],
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600),
                  ),
          ],
        );
      },
    );
  }
}
