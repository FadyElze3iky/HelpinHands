// ignore_for_file: prefer_function_declarations_over_variables
import 'dart:convert';
import 'dart:io';
import 'package:helping_hands/core/utils/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class profileImpl {
// DB

  Future<String> getUid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? uid = preferences.getString('uid');
    return uid ?? '';
  }

  Future<dynamic> GetUserDataDB(String uid) async {
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().UserDataUrl),
        body: {
          'uid': uid,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['state'] == 1) {
          return data['data'][0];
        } else {
          throw Exception('bad connection');
        }
      } else {
        throw Exception('bad connection');

        // Handle other status codes or errors
      }
    } catch (error) {
      // Handle any exceptions that might occur during the request
      print('Error during get user data: $error');
    }
  }

  Future<dynamic> updateUserNameDB(String username) async {
    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().updateUserNameUrl),
        body: {
          'uid': uid,
          'username': username,
        },
      );
      dynamic data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<dynamic> updateNickNameDB(String nickname) async {
    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().updateNickNameUrl),
        body: {
          'uid': uid,
          'nickname': nickname,
        },
      );
      dynamic data = jsonDecode(response.body);
      if (data['state'] == 1) {
        return data;
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<dynamic> updateAddressDB(String Address) async {
    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().updateAddressUrl),
        body: {
          'uid': uid,
          'Address': Address,
        },
      );
      dynamic data = jsonDecode(response.body);
      if (data['state'] == 1) {
        return data;
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<dynamic> updateBloodTypeDB(String BloodType) async {
    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().updateBloodTypeUrl),
        body: {
          'uid': uid,
          'BloodType': BloodType,
        },
      );
      dynamic data = jsonDecode(response.body);
      if (data['state'] == 1) {
        return data;
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<dynamic> updateChronicDiseasesDB(String ChronicDiseases) async {
    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().updateDiaseasesUrl),
        body: {
          'uid': uid,
          'ChronicDiseases': ChronicDiseases,
        },
      );
      dynamic data = jsonDecode(response.body);
      if (data['state'] == 1) {
        return data;
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<dynamic> updateNationalIdDB(String nationalid) async {
    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().updatenationalIDUrl),
        body: {
          'uid': uid,
          'nationalid': nationalid,
        },
      );
      dynamic data = jsonDecode(response.body);
      if (data['state'] == 1) {
        return data;
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<dynamic> updatePhotoURLDB(String PhotoURL) async {
    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().updatePhotoUrl),
        body: {
          'uid': uid,
          'PhotoURL': PhotoURL,
        },
      );
      dynamic data = jsonDecode(response.body);
      if (data['state'] == 1) {
        return data;
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<dynamic> addContactDB(String contactUid) async {
    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().addContactUrl),
        body: {
          'uid': uid,
          'contact_uid': contactUid,
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<dynamic> deleteContactDB(String contactUid) async {
    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().deleteContactUrl),
        body: {
          'uid': uid,
          'contact_uid': contactUid,
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<dynamic> getContactsDB() async {
    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().addContactUrl),
        body: {
          'uid': uid,
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<List<dynamic>> getContactsUidDB() async {
    List<dynamic> contacts = [];

    String uid = await getUid();
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().ContactsUidUrl),
        body: {
          'uid': uid,
        },
      );
      dynamic data = jsonDecode(response.body);
      if (data['state'] == 1) {
        contacts = data['date'];
        return contacts;
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }

    return contacts;
  }

  Future<List<Map<String, dynamic>>> getContactDetailsDB(
      List<dynamic> contactUids) async {
    List<Map<String, dynamic>> contactDetails = [];
    // Iterate through each contact UID and fetch its details
    for (String uid in contactUids) {
      try {
        var response = await http.post(
          Uri.parse(DataBaseApi().UserDataUrl),
          body: {
            'uid': uid,
          },
        );
        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);
          if (data['state'] == 1) {
            Map<String, dynamic> contact =
                data['data'][0] as Map<String, dynamic>;
            contactDetails.add(contact);
          } else {
            throw Exception('bad connection');
          }
        }
      } catch (e) {
        // Handle any errors that may occur during the fetching process
        print('Error fetching contact details for UID $uid: $e');
      }
    }

    return contactDetails;
  }

  // Function to retrieve all contacts for a user
  Future<List<Map<String, dynamic>>> getUserContactsDB() async {
    try {
      final contactsUid = await getContactsUidDB();

      final contactsDetails = await getContactDetailsDB(contactsUid);

      return contactsDetails;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<void> uploadImage() async {
    String uid = await getUid();
    File? _image;
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _image = File(pickedImage.path);
    } else {
      return;
    }

    // Create a multipart request
    var request =
        http.MultipartRequest('POST', Uri.parse(DataBaseApi().updateImgUrl));
    request.fields['uid'] = uid;

    // Attach the image file
    request.files.add(await http.MultipartFile.fromPath('image', _image.path));

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        // Image uploaded successfully
        print('Image uploaded successfully');
      } else {
        // Handle error
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exception
      print('Error uploading image: $error');
    }
  }

  // return users when search
  Future<List<dynamic>> searchUsersDB(String query) async {
    List<dynamic> users = [];
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().SearchUrl),
        body: {
          'query': query,
        },
      );
      if (response.statusCode == 200) {
        final response0 = jsonDecode(response.body);
        if (response0['state'] == 1) {
          users = response0['data'];
        }
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }

    return users;
  }

  Future<void> setPrivacy(bool privacy) async {
    String uid = await getUid();
    try {
      String value = '0';
      if (privacy == true) {
        value = '1';
      }
      var response = await http.post(
        Uri.parse(DataBaseApi().updatePrivacyUrl),
        body: {
          'uid': uid,
          'privacy': value,
        },
      );
      dynamic data = jsonDecode(response.body);
      if (data['state'] == 1) {
        return data;
      } else {
        throw Exception('bad connection');
      }
    } catch (e) {
      print('Error during get user data: $e');
    }
  }

  Future<bool> getPrivacy() async {
    try {
      String uid = await getUid();
      final response = await GetUserDataDB(uid);
      final privacy = response['Privacy'];
      if (privacy == '1') {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }
}
