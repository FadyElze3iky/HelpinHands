import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/PostReport/presentation/manager/post_report/post_report_cubit.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:helping_hands/generated/l10n.dart';

class PostButton extends StatelessWidget {
  const PostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostReportCubit, PostReportState>(
      listener: (context, state) {
        if (state is UploadFailure) {
          ShowToast(context: context, massage: state.error, color: Colors.red);
        }
        if (state is UploadSucces) {
          ShowToast(
              context: context, massage: state.response, color: Colors.green);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is UploadWating) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<PostReportCubit>(context).uploadPost();
            },
            child: Text(
              S.of(context).Post,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primary)),
          ),
        );
      },
    );
  }
}
