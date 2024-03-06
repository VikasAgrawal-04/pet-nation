import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/views/screens/auth/login_view.dart';
import 'package:pet_nations/src/views/screens/auth/otp_view.dart';
import 'package:pet_nations/src/views/screens/cart_screens/compare_screen.dart';
import 'package:pet_nations/src/views/screens/cart_screens/new_card_screen.dart';
import 'package:pet_nations/src/views/screens/cart_screens/payment_methods_screen.dart';
import 'package:pet_nations/src/views/screens/cart_screens/product_summary_screen.dart';
import 'package:pet_nations/src/views/screens/dashboard/dashboard_view.dart';
import 'package:pet_nations/src/views/screens/introduction/introduction_view.dart';
import 'package:pet_nations/src/views/screens/menu_screens/customer_support_view.dart';
import 'package:pet_nations/src/views/screens/menu_screens/product_list_screen.dart';
import 'package:pet_nations/src/views/screens/menu_screens/profile_page.dart';
import 'package:pet_nations/src/views/screens/menu_screens/track_order_screen.dart';
import 'package:pet_nations/src/views/screens/menu_screens/track_order_views/order_details.dart';
import 'package:pet_nations/src/views/screens/notification/notification_screen.dart';
import 'package:pet_nations/src/views/screens/pet_screens/add_pet.dart';
import 'package:pet_nations/src/views/screens/pet_screens/pet_details.dart';
import 'package:pet_nations/src/views/screens/product/product_details.dart';
import 'package:pet_nations/src/views/screens/product/wishlist_screen.dart';
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
    GetPage(name: AppRoutes.petDetails, page: () => const PetDetails()),
    GetPage(
        name: AppRoutes.productSummary,
        page: () => const ProductSummaryScreen()),
    GetPage(
        name: AppRoutes.paymentMethod, page: () => const PaymentMethodScreen()),
    GetPage(name: AppRoutes.newCard, page: () => const NewCardScreen()),
    GetPage(name: AppRoutes.compare, page: () => const CompareScreen()),
    GetPage(name: AppRoutes.wishlist, page: () => const WishlistScreen()),
    GetPage(
        name: AppRoutes.notification, page: () => const NotificationScreen()),
    GetPage(name: AppRoutes.orders, page: () => const TrackOrderScreen()),
    GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails()),
    GetPage(
        name: AppRoutes.shopByProduct, page: () => const ProductListScreen())
  ];
}
