class DataBaseApi {
  static String serverName = 'http://10.0.2.2/';
  static String flaskHost = 'http://172.20.10.4:5000';
  String loginUrl = '${serverName}RestApi/auth/login.php';
  String signupUrl = '${serverName}RestApi/auth/signup.php';
  String UserDataUrl = '${serverName}RestApi/edit_profile/get_user_data.php';
  String updateUserNameUrl =
      '${serverName}RestApi/edit_profile/update_user_name.php';
  String updateNickNameUrl =
      '${serverName}RestApi/edit_profile/update_nick_name.php';
  String updatenationalIDUrl =
      '${serverName}RestApi/edit_profile/update_nationalID.php';
  String updatePhotoUrl =
      '${serverName}RestApi/edit_profile/update_photo_url.php';
  String updateDiaseasesUrl =
      '${serverName}RestApi/edit_profile/update_Chronic_Diseases.php';
  String updateBloodTypeUrl =
      '${serverName}RestApi/edit_profile/update_blood_type.php';
  String updateAddressUrl =
      '${serverName}RestApi/edit_profile/update_address.php';
  String addContactUrl = '${serverName}RestApi/edit_profile/add_contact.php';
  String deleteContactUrl =
      '${serverName}RestApi/edit_profile/delete_contact.php';
  String ContactsUidUrl = '${serverName}RestApi/edit_profile/get_contacts.php';
  String SearchUrl = '${serverName}RestApi/edit_profile/search_user.php';
  String updatePrivacyUrl =
      '${serverName}RestApi/edit_profile/update_privacy.php';
  String updateImgUrl = '${serverName}RestApi/edit_profile/change_photo.php';

  // -------------------------Posts--------------------------

  String uploadPostUrl = '${serverName}RestApi/Posts/upload_post.php';
  String getPostUrl = '${serverName}RestApi/Posts/get_posts.php';
  String getAllAccidentsUrl = '${serverName}RestApi/Posts/get_all_accident.php';
  String reportPorstUrl = '${serverName}RestApi/Posts/report_post.php';

  // ------------------------------location--------------------
  String updateLocationUrl =
      '${serverName}RestApi/location/update_location.php';
  String getContactsLocationUrl =
      '${serverName}RestApi/location/get_location.php';
  String deleteLocationUrl =
      '${serverName}RestApi/location/delete_my_location.php';
}
