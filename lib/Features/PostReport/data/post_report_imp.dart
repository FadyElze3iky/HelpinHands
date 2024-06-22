import 'dart:developer';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:helping_hands/core/utils/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PostReportImp {
  get picker => null;
  File? image;
  String downloadURL = '';
  String? report_type;

  set setType(String? type) {
    report_type = type;
  }

  set setImage(File? Image) {
    image = Image;
  }

  Future uploadPost({File? image, required type}) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("User denied the permission.");
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String uid = await profileImpl().getUid();
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(DataBaseApi().uploadPostUrl));
      request.fields['uid'] = uid;
      request.fields['type'] = type;
      request.fields['lat'] = position.latitude.toString();
      request.fields['long'] = position.longitude.toString();
      if (image != null) {
        request.files
            .add(await http.MultipartFile.fromPath('profilePic', image.path));
      }

      try {
        var response = await request.send();

        if (response.statusCode == 200) {
          String responseBody = await response.stream.bytesToString();
          return responseBody;
        } else {
          // Handle error
          print('Failed to upload image. Status code: ${response.statusCode}');
        }
      } catch (error) {
        // Handle exception
        print('Error uploading image: $error');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<File?> pickImage(String sourse) async {
    XFile? pickedFile;
    if (sourse == 'camera') {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    if (pickedFile != null) {
      image = File(pickedFile.path);

      return image;
    } else {
      print('No image selected.');
    }
  }
}
