import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/core/navigation/navigator.dart';
import 'package:kt_course/core/reactive/setting_value/controller/setting_value.dart';
import 'package:kt_course/ui/pages/course_details/controller/course_details_controller.dart';
import 'package:kt_course/ui/pages/course_details/course_details_page.dart';
import 'package:kt_course/ui/pages/discover/discover_page.dart';
import 'package:kt_course/ui/pages/home/controller/home_controller.dart';
import 'package:kt_course/ui/pages/home/home_page.dart';
import 'package:kt_course/ui/pages/onboarding/controller/onboarding_controller.dart';
import 'package:kt_course/ui/pages/onboarding/onboarding_page.dart';
import 'package:kt_course/ui/pages/search/search_page.dart';
import 'package:kt_course/ui/pages/settings/settings_page.dart';
import 'package:kt_course/ui/widgets/custom_video_player/controller/custom_video_player_controller.dart';
import 'package:kt_course/ui/widgets/custom_video_player/custom_video_player_full_screen.dart';
import 'package:kt_course/ui/widgets/login/login_sheet.dart';
import 'package:kt_course/ui/widgets/settings/bottom_sheet/controller/setting_options_sheet_controller.dart';
import 'package:kt_course/ui/widgets/settings/bottom_sheet/setting_options_sheet.dart';
import 'package:kt_course/ui/widgets/settings/bottom_sheet/settings_options_sheet_item.dart';
import 'package:provider/provider.dart';

// Creating an instance of the NavigationDefine class and assigning it to the variable nav
final nav = NavigationDefine();

// Defining the NavigationDefine class
class NavigationDefine {
  // Creating a final variable to hold the Navigator instance obtained from the dependency injector
  final _navigator = injector.get<Navigator>();

  // Method to show a snack bar, with optional message and error parameters
  showSnackBar({String? message, dynamic error}) =>
      _navigator.showSnackBar(message: message, error: error);

  pop({Object? result}) {
    return _navigator.pop(result: result);
  }

  toOnBoading() {
    _navigator.push(
        Provider(
          create: (_) => OnboardingController(),
          child: const OnboardingPage(),
        ),
        type: PushType.replaceAll);
  }

  toHome() {
    _navigator.push(
        Provider(
          create: (_) => HomeController(),
          child: const HomePage(),
        ),
        type: PushType.replaceAll);
  }

  toSettings() {
    _navigator.push(const SettingsPage(),
        animationType: NavigatorAnimationType.fade);
  }

  toSettingOptionsSelectSheet<T>(
      {required SettingValue<T> settingValue,
      required List<SettingOptionsSelectSheetItem> items,
      Function(T)? onChangeCallBack,
      String? title}) {
    _navigator.showBottomSheet(
        Provider(
          create: (_) => SettingOptionsSheetController<T>(
              settingValue: settingValue, 
              items: items,
              onChangeCallBack: onChangeCallBack),
          child: SettingOptionsSelectSheet<T>(),
        ),
        title: title,
        initialChildSize: 0.5,
        maxChildSize: 0.5);
  }

  toCourseDetails() {
    final controller = CourseDetailsController();
    _navigator.push(
      Provider(
        create: (_) => controller,
        child: const CourseDetailsPage(),
        dispose: (_, __) => controller.onDispose(),
      )
    );
  }

  enterVideoPlayerFullScreenMode(CustomVideoPlayerController controller) {
    _navigator.push(
      CustomVideoPlayerFullScreen(controller)
    );
  }

  Future<(String, String)?> showLoginSheet() async {
    return await _navigator.showBottomSheet<(String, String)>(
      const LoginSheet()
    );
  }
}
