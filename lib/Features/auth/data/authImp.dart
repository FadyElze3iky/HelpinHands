import 'package:helping_hands/core/utils/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthImp {
  String signupUrl = DataBaseApi().signupUrl;
  String loginUrl = DataBaseApi().loginUrl;
  Future<dynamic> signup(String username, String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse(signupUrl),
        body: {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      // Handle the response status code here
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);

        // Handle other status codes or errors
      }
    } catch (error) {
      // Handle any exceptions that might occur during the request
      print('Error during signup: $error');
    }
  }

  Future<dynamic> login(String identifier, String password) async {
    try {
      var response = await http.post(
        Uri.parse(loginUrl),
        body: {
          'identifier': identifier,
          'password': password,
        },
      );

      // Handle the response status code here
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);

        // Handle other status codes or errors
      }
    } catch (error) {
      // Handle any exceptions that might occur during the request
      print('Error during signup: $error');
    }
  }
}
