import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/ChatBubbleSend.dart';
import 'package:helping_hands/Features/chat/presentation/manager/chatCuibt.dart';
import 'package:helping_hands/Features/chat/presentation/manager/chatStates.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, chatState>(
      builder: (context, state) {
        if (state is GetMassageSuccessfully) {
          List<String> chatList = state.chatList;
          chatList = chatList.reversed.toList();
          return ListView.builder(
            reverse: true,
            controller: _scrollController,
            itemCount: chatList.length,
            itemBuilder: (context, index) {
              return ChatBubbleSend(data: chatList[index]);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
