import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/chat/presentation/manager/chatCuibt.dart';

class DeleteChat extends StatelessWidget {
  const DeleteChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => BlocProvider.of<ChatCubit>(context).deleteMessages(),
      icon: Image.asset(
        'assets/icons/trash (1).png',
        height: 25,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
