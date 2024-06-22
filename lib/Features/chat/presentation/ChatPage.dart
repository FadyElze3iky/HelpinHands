// ignore_for_file: prefer_final_fields, non_constant_identifier_names, avoid_init_to_null, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/chat/presentation/manager/chatCuibt.dart';
import 'package:helping_hands/Features/chat/presentation/widgets/chat_list_view.dart';
import 'package:helping_hands/Features/chat/presentation/widgets/delete_chat.dart';
import 'package:helping_hands/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  // get collection

  TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  FocusNode _textFieldFocusNode = FocusNode();
  var TextFieldValue = null;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatCubit>(context).loadChat(_scrollController);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/comment (1).png',
                height: 25.h,
                color: Theme.of(context).colorScheme.primary,
              ),
              Column(
                children: [
                  Text(
                    '  First Aid',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '  ChatBot',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
          actions: [DeleteChat()],
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatListView(scrollController: _scrollController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: _textFieldFocusNode,
                controller: controller,
                onChanged: (value) {
                  if (value != '') {
                    TextFieldValue = value;
                  }
                },
                onSubmitted: (value) {
                  if (value == '') {
                  } else {
                    BlocProvider.of<ChatCubit>(context).sendMasssage(
                        value: value,
                        context: context,
                        controller: controller,
                        textFieldFocusNode: _textFieldFocusNode,
                        scrollController: _scrollController);
                    TextFieldValue = '';
                  }
                  BlocProvider.of<ChatCubit>(context)
                      .loadChat(_scrollController);
                },
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (TextFieldValue == '' || TextFieldValue == null) {
                      } else {
                        BlocProvider.of<ChatCubit>(context).sendMasssage(
                            value: TextFieldValue,
                            context: context,
                            controller: controller,
                            textFieldFocusNode: _textFieldFocusNode,
                            scrollController: _scrollController);
                        TextFieldValue = '';
                      }
                      TextFieldValue = '';
                      BlocProvider.of<ChatCubit>(context)
                          .loadChat(_scrollController);
                    },
                    child: const Icon(
                      Icons.send_sharp,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 16, 141, 190)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: kPrimaryColor1),
                  ),
                  hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'Type a message...',
                ),
              ),
            )
          ],
        ));
  }
}
