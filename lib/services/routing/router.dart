import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/views/screens/auth/login_view.dart';
import 'package:pet_nations/src/views/screens/auth/otp_view.dart';
import 'package:pet_nations/src/views/screens/dashboard/dashboard_view.dart';
import 'package:pet_nations/src/views/screens/introduction/introduction_view.dart';
import 'package:pet_nations/src/views/screens/pet_screens/add_pet.dart';
import 'package:pet_nations/src/views/screens/pet_screens/pet_details.dart';
import 'package:pet_nations/src/views/screens/product/product_details.dart';
import 'package:pet_nations/src/views/screens/profile_screens/customer_support_view.dart';
import 'package:pet_nations/src/views/screens/profile_screens/profile_page.dart';
import 'package:pet_nations/src/views/screens/splash/splash_view.dart';

class AppRouter {
  static List<GetPage> routes = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashView(),
        transition: Transition.fade),
    GetPage(name: AppRoutes.introduction, page: () => const IntroductionView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(
        name: AppRoutes.otp,
        page: () => const OtpView(),
        transition: Transition.upToDown,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(
        name: AppRoutes.dashboard,
        page: () => const DashboardView(),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.customerSupport,
        page: () => const CustomerSupportView()),
    GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),
    GetPage(name: AppRoutes.profile, page: () => const ProfilePage()),
    GetPage(name: AppRoutes.addPet, page: () => const AddPetScreen()),
    GetPage(name: AppRoutes.petDetails, page: () => const PetDetails())
  ];
}
