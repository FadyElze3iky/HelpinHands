import 'package:helping_hands/core/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatImp {
  List<String> _messages = [];

  Future<List<String>> loadChat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedMessages = prefs.getStringList('chat') ?? [];
    _messages = savedMessages;
    return _messages;
  }

  void sendMessage(String massage) async {
    // Update the UI with the new message

    _messages.add('You: $massage');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedMessages = prefs.getStringList('chat') ?? [];
    savedMessages.add('You: $massage');
    await prefs.setStringList('chat', savedMessages);
    getResponse(massage);
  }

  getResponse(String massage) async {
    // Make a request to your Flask backend
    Uri url = Uri.parse('${DataBaseApi.flaskHost}/chat?Query=$massage');
    String response = 'no internet connection';
    try {
      http.Response response1 = await http.get(url);
      response = jsonDecode(response1.body);
      // Process the response if needed
      // Update the UI with the chatbot's response

      _messages.add('Chatbot: ${response}');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> savedMessages = prefs.getStringList('chat') ?? [];
      savedMessages.add('Chatbot: ${response}');
      await prefs.setStringList('chat', savedMessages);
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  void deleteChat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('chat');

    _messages.clear();
  }
}
