// lib/app/routes/app_pages.dart

import 'package:get/get.dart';
import 'package:manajement_kost/app/modules/chat_pemilik/binding/chat_pemilik_binding.dart';
import 'package:manajement_kost/app/modules/chat_pemilik/view/chat_pemilik_view.dart';
import 'package:manajement_kost/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:manajement_kost/app/modules/date_picker/binding/date_picker_binding.dart';
import 'package:manajement_kost/app/modules/date_picker/views/date_picker_view.dart';
import 'package:manajement_kost/app/modules/home/bindings/my_kos_binding.dart';
import 'package:manajement_kost/app/modules/home/views/my_kos_view.dart';
import 'package:manajement_kost/app/modules/homepage/views/homepage_view.dart';
import 'package:manajement_kost/app/modules/login/bindings/login_page_binding.dart';
import 'package:manajement_kost/app/modules/login/views/login_page_views.dart';
import 'package:manajement_kost/app/modules/login_penyewa/bindings/login_penyewa_binding.dart';
import 'package:manajement_kost/app/modules/login_penyewa/views/login_penyewa_view.dart';
import 'package:manajement_kost/app/modules/payment/binding/payment_binding.dart';
import 'package:manajement_kost/app/modules/payment/view/payment_view.dart';
import 'package:manajement_kost/app/modules/signup/bindings/signup_binding.dart';
import 'package:manajement_kost/app/modules/signup/view/signup_view.dart';
import '../modules/chats/views/chat_view.dart';
import '../modules/not_paid_bills/view/not_paid_bills_view.dart';
import '../modules/paid_bills/view/paid_bills_view.dart';
import '../modules/personal_info/view/personal_info_view.dart';
import '../modules/profile/view/profile_view.dart';
import '../modules/riwayat_kost/view/riwayat_kost_view.dart';
import '../modules/riwayat_kost_none/view/riwayat_kost_none_view.dart';
import '../modules/settings/view/settings_view.dart';
import '../modules/transaction_history/view/transaction_history_view.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/room_detail/views/room_detail_view.dart';
import 'app_routes.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

// Import semua views

// Import semua bindings
import '../modules/not_paid_bills/bindings/not_paid_bills_binding.dart';
import '../modules/paid_bills/bindings/paid_bills_binding.dart';
import '../modules/chats/bindings/chat_binding.dart';
import '../modules/room_detail/bindings/room_detail_binding.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/personal_info/bindings/personal_info_binding.dart';
import '../modules/riwayat_kost_none/bindings/riwayat_kost_none_binding.dart';
import '../modules/riwayat_kost/bindings/riwayat_kost_binding.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/transaction_history/bindings/transaction_history_binding.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.NOT_PAID_BILLS,
      page: () => const NotPaidBillsView(),
      binding: NotPaidBillsBinding(),
    ),
    GetPage(
      name: AppRoutes.PAID_BILLS,
      page: () => const PaidBillsView(),
      binding: PaidBillsBinding(),
    ),
    GetPage(
      name: AppRoutes.CHATS,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.PERSONAL_INFO,
      page: () => const PersonalInfoView(),
      binding: PersonalInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.RIWAYAT_KOST_NONE,
      page: () => const RiwayatKostNoneView(),
      binding: RiwayatKostNoneBinding(),
    ),
    GetPage(
      name: AppRoutes.RIWAYAT_KOST,
      page: () => const RiwayatKostView(),
      binding: RiwayatKostBinding(),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.TRANSACTION_HISTORY,
      page: () => const TransactionHistoryView(),
      binding: TransactionHistoryBinding(),
    ),
    GetPage(
      name: AppRoutes.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: AppRoutes.ROOM_DETAIL,
      page: () => const RoomDetailView(),
      binding: RoomDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.HOMEPAGE,
      page: () => HomepageView(),
      binding: KosBinding(),
    ),
    GetPage(
      name: '/splash',
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
     GetPage(
      name: '/loginpenyewa',
      page: () => LoginPenyewa(),
      binding: LoginPenyewaBinding(),
    ),
    GetPage(
      name: '/signup',
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: '/chatpemilik',
      page: () => ChatPemilikView(),
      binding: ChatPemilikBinding(),
    ),
    GetPage(
      name: '/payment',
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () =>  const MyKosView() ,
      binding: MyKosBinding(),
    ),
    GetPage(
    name: AppRoutes.DATE_PICKER,
    page: () => const DatePickerView(),
    binding: DatePickerBinding(),
  ),
  ];
}
