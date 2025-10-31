import 'package:anmol_marketing/features/auth/presentation/change_password/change_password_binding.dart';
import 'package:anmol_marketing/features/orders/presentation/create_orders/create_order_binding.dart';
import 'package:anmol_marketing/features/auth/presentation/forget_password/forget_password_binding.dart';
import 'package:anmol_marketing/features/account_statements/presentation/ac_statements_screen.dart';
import 'package:anmol_marketing/features/auth/presentation/change_password/change_password_screen.dart';
import 'package:anmol_marketing/features/auth/presentation/forget_password/forget_password_screen.dart';
import 'package:get/get.dart';
import '../../features/account_statements/presentation/ac_statements_binding.dart';
import '../../features/auth/presentation/signin/signin_screen.dart';
import '../../features/auth/presentation/signin/signin_binding.dart';
import '../../features/auth/presentation/signup/signup_binding.dart';
import '../../features/auth/presentation/signup/signup_screen.dart';
import '../../features/auth/presentation/verify_otp/phone_verification_binding.dart';
import '../../features/auth/presentation/verify_otp/phone_verification_screen.dart';
import '../../features/categories/presentation/catalogue_binding.dart';
import '../../features/categories/presentation/catalogue_screen.dart';
import '../../features/dashboard/presentation/dashboard_binding.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/expiry_claim/presentation/expairy_claim_screen.dart';
import '../../features/expiry_claim/presentation/expiry_claim_binding.dart';
import '../../features/navbar/navbar.dart';
import '../../features/navbar/navbar_binding.dart';
import '../../features/orders/presentation/confirm_orders/confirm_order_binding.dart';
import '../../features/orders/presentation/confirm_orders/confirm_order_screen.dart';
import '../../features/orders/presentation/create_orders/create_order_screen.dart';
import '../../features/products/presentation/selecte_products/select_product_binding.dart';
import '../../features/products/presentation/selecte_products/select_product_screen.dart';
import '../../features/products/presentation/view_products/view_products_binding.dart';
import '../../features/products/presentation/view_products/view_products_screen.dart';
import '../../features/splash/splash_binding.dart';
import '../../features/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.phoneVerification,
      page: () => PhoneVerificationScreen(),
      binding: PhoneVerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.navbar,
      page: () => NavBarScreen(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.catalogue,
      page: () => CatalogueScreen(),
      binding: CatalogueBinding(),
    ),
    GetPage(
      name: AppRoutes.createOrder,
      page: () => CreateOrderScreen(),
      binding: CreateOrderBinding(),
    ),
    GetPage(
      name: AppRoutes.selectProduct,
      page: () => SelectProductScreen(),
      binding: SelectProductBinding(), // Create this binding class
    ),
    GetPage(
      name: AppRoutes.confirmOrder,
      page: () => ConfirmOrderScreen(),
      binding: ConfirmOrderBinding(),
    ),
    GetPage(
      name: AppRoutes.viewProducts,
      page: () => ViewProductsScreen(),
      binding: ViewProductsBinding(),
    ),
    GetPage(
      name: AppRoutes.expiryClaim,
      page: () => ExpairyClaimScreen(),
      binding: ExpiryClaimBinding(),
    ),
    GetPage(
      name: AppRoutes.acStatements,
      page: () => AcStatementsScreen(),
      binding: AcStatementsBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
     GetPage(
      name: AppRoutes.changePassword,
      page: () => ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
