import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;
import 'package:helping_hands/Features/chat/data/chatImp.dart';
import 'package:helping_hands/Features/chat/presentation/manager/chatStates.dart';

class ChatCubit extends Cubit<chatState> {
  ChatCubit() : super(InitialState());
  ChatImp chatImp = ChatImp();
  List<String> _messages = [];

  bool sound = false;
  void loadChat(
    ScrollController scrollController,
  ) async {
    _messages = await chatImp.loadChat();
    emit(GetMassageSuccessfully(chatList: _messages));
    scrollDownWithAnimat(scrollController: scrollController);
  }

  void sendMasssage(
      {required String value,
      // required String uid,
      required BuildContext context,
      required TextEditingController controller,
      required FocusNode textFieldFocusNode,
      required ScrollController scrollController}) async {
    chatImp.sendMessage(value);
    _messages = await chatImp.loadChat();

    controller.clear();
    emit(GetMassageSuccessfully(chatList: _messages));
    FocusScope.of(context).requestFocus(textFieldFocusNode);
    scrollDownWithAnimat(scrollController: scrollController);
  }

  void scrollDownWithAnimat({required ScrollController scrollController}) {
    scrollController.animateTo(
      0,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  void deleteMessages() async {
    chatImp.deleteChat();
    _messages = await chatImp.loadChat();
    emit(GetMassageSuccessfully(chatList: _messages));
  }

  Future<void> playAudio(String text) async {
    try {
      final language = langdetect.detect(text);
      FlutterTts flutterTts = FlutterTts();
      flutterTts.setLanguage(language);
      if (!sound) {
        flutterTts.setVolume(200);
        flutterTts.speak(text);
        soundSwitch();
      } else {
        flutterTts.stop();
        soundSwitch();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void soundSwitch() {
    sound = !sound;
  }
}










// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;
// import 'package:helping_hands/Features/chat/presentation/manager/chatStates.dart';

// class ChatCubit extends Cubit<chatState> {
//   ChatCubit() : super(InitialState());

//   CollectionReference massage = FirebaseFirestore.instance.collection('PlaM');
//   bool sound = false;
//   void sendMasssage(
//       {required String value,
//       required String uid,
//       required BuildContext context,
//       required TextEditingController controller,
//       required FocusNode textFieldFocusNode,
//       required ScrollController scrollController}) {
//     String prompt = value + ' ,give me first aid in brief';
//     massage.add({
//       'prompt': prompt,
//       'time': DateTime.now(),
//       'uid': uid,
//     });
//     controller.clear();
//     FocusScope.of(context).requestFocus(textFieldFocusNode);
//     scrollDownWithAnimat(scrollController: scrollController);
//   }

//   void scrollDownWithAnimat({required ScrollController scrollController}) {
//     scrollController.animateTo(
//       0,
//       duration: Duration(seconds: 2),
//       curve: Curves.fastOutSlowIn,
//     );
//   }

//   void getMassages(String uid) {
//     massage.orderBy('time', descending: true).snapshots().listen((event) {
//       List<String> promptList = [];
//       List<String> responseList = [];
//       for (int i = 0; i < event.docs.length; i++) {
//         if (event.docs[i]['uid'] == uid) {
//           String word = event.docs[i]['prompt'];
//           List<String> words = word.split(' ');

//           words.removeRange(words.length - 6, words.length);

//           // Join the remaining words back into a string
//           String resultString = words.join(' ');
//           promptList.add(resultString);
//           // Check if the 'response' field exists in the document
//           // Check if the document data is a Map and contains the 'response' key
//           // Explicitly cast to Map before using containsKey
//           if (event.docs[i].data() is Map &&
//               (event.docs[i].data() as Map).containsKey('response')) {
//             responseList.add(event.docs[i]['response']);
//           } else {
//             // Handle the case when 'response' field is not present
//             responseList.add(''); // or any default value you prefer
//           }
//         }
//       }

//       emit(GetMassageSuccessfully(
//           promptList: promptList, responseList: responseList));
//     });
//   }

//   void deleteMessages(String uid) async {
//     QuerySnapshot messagesSnapshot = await massage.get();

//     // Create a batch for batched write operations
//     WriteBatch batch = FirebaseFirestore.instance.batch();

//     for (QueryDocumentSnapshot messageDoc in messagesSnapshot.docs) {
//       // Check if the 'uid' field exists and matches the specified user
//       if (messageDoc['uid'] == uid) {
//         // Delete the document
//         batch.delete(massage.doc(messageDoc.id));
//       }
//     }

//     // Commit the batched delete operations
//     await batch.commit();
//   }

//   Future<void> playAudio(String text) async {
//     try {
//       final language = langdetect.detect(text);
//       FlutterTts flutterTts = FlutterTts();
//       flutterTts.setLanguage(language);
//       if (!sound) {
//         flutterTts.setVolume(200);
//         flutterTts.speak(text);
//         soundSwitch();
//       } else {
//         flutterTts.stop();
//         soundSwitch();
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void soundSwitch() {
//     sound = !sound;
//   }
// }
