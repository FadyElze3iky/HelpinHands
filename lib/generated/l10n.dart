// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile Information`
  String get EditProfileInformation {
    return Intl.message(
      'Edit Profile Information',
      name: 'EditProfileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `LogOut`
  String get LogOut {
    return Intl.message(
      'LogOut',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// ` Email or UserName`
  String get EmailOrUsername {
    return Intl.message(
      ' Email or UserName',
      name: 'EmailOrUsername',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get username {
    return Intl.message(
      'User Name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// ` Password`
  String get Password {
    return Intl.message(
      ' Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Password Again`
  String get PasswordAgain {
    return Intl.message(
      'Password Again',
      name: 'PasswordAgain',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get ForgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get SignIn {
    return Intl.message(
      'Sign In',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `enter valid UserName`
  String get PleaseEnterValidUserName {
    return Intl.message(
      'enter valid UserName',
      name: 'PleaseEnterValidUserName',
      desc: '',
      args: [],
    );
  }

  /// ` Or Continue With `
  String get OrContinueWith {
    return Intl.message(
      ' Or Continue With ',
      name: 'OrContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Don't Have An Account? `
  String get DontHaveAnAccount {
    return Intl.message(
      'Don\'t Have An Account? ',
      name: 'DontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get RegisterNow {
    return Intl.message(
      'Register Now',
      name: 'RegisterNow',
      desc: '',
      args: [],
    );
  }

  /// `Write Your Email Here`
  String get WriteYourEmailHere {
    return Intl.message(
      'Write Your Email Here',
      name: 'WriteYourEmailHere',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `enteran email address`
  String get Pleaseenteranemailaddress {
    return Intl.message(
      'enteran email address',
      name: 'Pleaseenteranemailaddress',
      desc: '',
      args: [],
    );
  }

  /// `enter a valid email address`
  String get Pleaseenteravalidemailaddress {
    return Intl.message(
      'enter a valid email address',
      name: 'Pleaseenteravalidemailaddress',
      desc: '',
      args: [],
    );
  }

  /// `enter a password`
  String get Pleaseenterapassword {
    return Intl.message(
      'enter a password',
      name: 'Pleaseenterapassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwordsnotmatch`
  String get Passwordsnotmatch {
    return Intl.message(
      'Passwordsnotmatch',
      name: 'Passwordsnotmatch',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get Privacy {
    return Intl.message(
      'Privacy',
      name: 'Privacy',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get Theme {
    return Intl.message(
      'Theme',
      name: 'Theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get Dark {
    return Intl.message(
      'Dark',
      name: 'Dark',
      desc: '',
      args: [],
    );
  }

  /// `light`
  String get light {
    return Intl.message(
      'light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get Editprofile {
    return Intl.message(
      'Edit profile',
      name: 'Editprofile',
      desc: '',
      args: [],
    );
  }

  /// `No Reports In Your Erea`
  String get NoReportsInYourErea {
    return Intl.message(
      'No Reports In Your Erea',
      name: 'NoReportsInYourErea',
      desc: '',
      args: [],
    );
  }

  /// `Post Report`
  String get PostReport {
    return Intl.message(
      'Post Report',
      name: 'PostReport',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get Post {
    return Intl.message(
      'Post',
      name: 'Post',
      desc: '',
      args: [],
    );
  }

  /// `Accident`
  String get Accident {
    return Intl.message(
      'Accident',
      name: 'Accident',
      desc: '',
      args: [],
    );
  }

  /// `Unsafe Area`
  String get UnsafeArea {
    return Intl.message(
      'Unsafe Area',
      name: 'UnsafeArea',
      desc: '',
      args: [],
    );
  }

  /// `Road Malfunction`
  String get RoadMalfunction {
    return Intl.message(
      'Road Malfunction',
      name: 'RoadMalfunction',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Data`
  String get privacydata {
    return Intl.message(
      'Privacy Data',
      name: 'privacydata',
      desc: '',
      args: [],
    );
  }

  /// `Blood Type`
  String get bloodtype {
    return Intl.message(
      'Blood Type',
      name: 'bloodtype',
      desc: '',
      args: [],
    );
  }

  /// `Info To Know`
  String get infotoknow {
    return Intl.message(
      'Info To Know',
      name: 'infotoknow',
      desc: '',
      args: [],
    );
  }

  /// `Contacts Location`
  String get ContactsLocation {
    return Intl.message(
      'Contacts Location',
      name: 'ContactsLocation',
      desc: '',
      args: [],
    );
  }

  /// `Last Update`
  String get LastUpdate {
    return Intl.message(
      'Last Update',
      name: 'LastUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Search Here`
  String get SearchHere {
    return Intl.message(
      'Search Here',
      name: 'SearchHere',
      desc: '',
      args: [],
    );
  }

  /// `Type a message`
  String get TypeAMessage {
    return Intl.message(
      'Type a message',
      name: 'TypeAMessage',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Contacts`
  String get EmergancyContacts {
    return Intl.message(
      'Emergency Contacts',
      name: 'EmergancyContacts',
      desc: '',
      args: [],
    );
  }

  /// `Profile Info`
  String get ProfileInformation {
    return Intl.message(
      'Profile Info',
      name: 'ProfileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Aid info`
  String get AidInfo {
    return Intl.message(
      'Aid info',
      name: 'AidInfo',
      desc: '',
      args: [],
    );
  }

  /// `NickName`
  String get NickName {
    return Intl.message(
      'NickName',
      name: 'NickName',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get Address {
    return Intl.message(
      'Address',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `Let People Help You`
  String get LetPeopleHelpYou {
    return Intl.message(
      'Let People Help You',
      name: 'LetPeopleHelpYou',
      desc: '',
      args: [],
    );
  }

  /// `NationalID`
  String get NationalID {
    return Intl.message(
      'NationalID',
      name: 'NationalID',
      desc: '',
      args: [],
    );
  }

  /// `Null`
  String get Null {
    return Intl.message(
      'Null',
      name: 'Null',
      desc: '',
      args: [],
    );
  }

  /// `Select blood type`
  String get Selectbloodtype {
    return Intl.message(
      'Select blood type',
      name: 'Selectbloodtype',
      desc: '',
      args: [],
    );
  }

  /// `We need 14 Number`
  String get NationalIDMustBe14Number {
    return Intl.message(
      'We need 14 Number',
      name: 'NationalIDMustBe14Number',
      desc: '',
      args: [],
    );
  }

  /// `Enter More Than 8 Chars`
  String get EnterMoreThan8Chars {
    return Intl.message(
      'Enter More Than 8 Chars',
      name: 'EnterMoreThan8Chars',
      desc: '',
      args: [],
    );
  }

  /// `Enter More Than 6 Chars`
  String get EnterMoreThan6Chars {
    return Intl.message(
      'Enter More Than 6 Chars',
      name: 'EnterMoreThan6Chars',
      desc: '',
      args: [],
    );
  }

  /// `Enter NickName`
  String get EnterNickName {
    return Intl.message(
      'Enter NickName',
      name: 'EnterNickName',
      desc: '',
      args: [],
    );
  }

  /// `Enter User Name`
  String get EnterUserName {
    return Intl.message(
      'Enter User Name',
      name: 'EnterUserName',
      desc: '',
      args: [],
    );
  }

  /// `Register Successfully`
  String get RegisterSuccessfully {
    return Intl.message(
      'Register Successfully',
      name: 'RegisterSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Chick your Email toreset your passowrd`
  String get ChickyourEmailtoresetyourpassowrd {
    return Intl.message(
      'Chick your Email toreset your passowrd',
      name: 'ChickyourEmailtoresetyourpassowrd',
      desc: '',
      args: [],
    );
  }

  /// `Could not launch Google Maps`
  String get CouldnotlaunchGoogleMaps {
    return Intl.message(
      'Could not launch Google Maps',
      name: 'CouldnotlaunchGoogleMaps',
      desc: '',
      args: [],
    );
  }

  /// `Just Now`
  String get justnow {
    return Intl.message(
      'Just Now',
      name: 'justnow',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
