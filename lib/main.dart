import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Home/data/home_impl.dart';
import 'package:helping_hands/Features/Home/presentation/manager/acc_on_map/acc_on_map_cubit.dart';
import 'package:helping_hands/Features/Home/presentation/manager/home_list/home_list_cubit.dart';
import 'package:helping_hands/Features/Home/presentation/manager/navigation_bar/navigation_bar_cubit.dart';
import 'package:helping_hands/Features/PostReport/presentation/manager/post_report/post_report_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserBotton/user_botton_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserField/user_field_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/emaergancy_contacts/contacts/contacts_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/emaergancy_contacts/search/search_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/toggles/toggles_cubit.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:helping_hands/Features/auth/presentation/manager/forget_password/forget_passowrd_cubit.dart';
import 'package:helping_hands/Features/dangerMap/presentation/manager/danger_map/danger_map_cubit.dart';
import 'package:helping_hands/Features/findContact/presentation/manager/contact_location/contact_location_cubit.dart';
import 'package:helping_hands/Features/maps/presentation/manager/Searchdir/location_Cubit.dart';
import 'package:helping_hands/core/GeneralImp/back_gound_services.dart';
import 'package:helping_hands/core/GeneralImp/notifications_controller.dart';
import 'package:helping_hands/core/GeneralImp/notifications_util.dart';
import 'package:helping_hands/language_theme_cubit/language_cubit_cubit.dart';
import 'package:helping_hands/material_app.dart';
import 'Features/auth/presentation/manager/authCubit.dart';
import 'Features/chat/presentation/manager/chatCuibt.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;

void main() async {
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  WidgetsFlutterBinding.ensureInitialized();
  HomeImpl().requestLocationPermission();
  await NotificationsController.initializeLocalNotifications();
  await NotificationsController.initializeNotificationsEventListeners();
  await NotificationsController.initializeIsolateReceivePort();
  await NotificationsController.interceptInitialCallActionRequest();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await langdetect.initLangDetect();

  final ImagePickerPlatform imagePickerImplementation =
      ImagePickerPlatform.instance;
  if (imagePickerImplementation is ImagePickerAndroid) {
    imagePickerImplementation.useAndroidPhotoPicker = true;
  }
  WidgetsFlutterBinding.ensureInitialized();

  BackgoundServices().initializeService();
  FlutterBackgroundService().startService();

  WidgetsFlutterBinding.ensureInitialized();

// test
// test

  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationUtils.requestBasicPermissionToSendNotifications(context);

    NotificationUtils.requestBasicPermissionToSendNotifications;
    return ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        minTextAdapt: true,
        splitScreenMode: true,

        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => authCubit(),
              ),
              BlocProvider(
                create: (context) => ChatCubit(),
              ),
              BlocProvider(
                create: (context) => UserFieldCubit(),
              ),
              BlocProvider(
                create: (context) => UserBottonCubit(),
              ),
              BlocProvider(
                create: (context) => ForgetPassowrdCubit(),
              ),
              BlocProvider(
                create: (context) => LanguageCubit(),
              ),
              BlocProvider(
                create: (context) => SearchCubit(),
              ),
              BlocProvider(
                create: (context) => ContactsCubit(),
              ),
              BlocProvider(
                create: (context) => NavigationBarCubit(),
              ),
              BlocProvider(
                create: (context) => LocationCubit(),
              ),
              BlocProvider(
                create: (context) => ContactLocationCubit(),
              ),
              BlocProvider(
                create: (context) => PostReportCubit(),
              ),
              BlocProvider(
                create: (context) => HomeListCubit(),
              ),
              BlocProvider(
                create: (context) => TogglesCubit(),
              ),
              BlocProvider(
                create: (context) => AccOnMapCubit(),
              ),
              BlocProvider(
                create: (context) => DangerMapCubit(),
              ),
            ],
            child: Materialapp(),
          );
        });
  }
}
