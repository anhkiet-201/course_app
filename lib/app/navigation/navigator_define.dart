import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/core/navigation/navigator.dart';
import 'package:kt_course/ui/pages/onboarding/controller/onboarding_controller.dart';
import 'package:kt_course/ui/pages/onboarding/onboarding_page.dart';
import 'package:provider/provider.dart';

// Creating an instance of the NavigationDefine class and assigning it to the variable nav
final nav = NavigationDefine();

// Defining the NavigationDefine class
class NavigationDefine {
  
  // Creating a final variable to hold the Navigator instance obtained from the dependency injector
  final _navigator = injector.get<Navigator>();

  // Method to show a snack bar, with optional message and error parameters
  showSnackBar({String? message, dynamic error}) => _navigator.showSnackBar(message: message, error: error);

  toOnBoading() {
    _navigator.push(
      Provider(
        create: (_) => OnboardingController(),
        child: const OnboardingPage(),
      ),
      type: PushType.replaceAll
    );
  }
}
