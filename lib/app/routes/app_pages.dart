// import 'package:chat_gpt_flutter/app/modules/avatars/controllers/avatars_controller.dart';
// import 'package:chat_gpt_flutter/app/modules/input_name%20copy/views/input_name_view.dart';
import 'package:chat_gpt_flutter/app/modules/user/bindings/user_binding.dart';
import 'package:get/get.dart';

import '../modules/chat_image/bindings/chat_image_binding.dart';
import '../modules/chat_image/views/chat_image_view.dart';
import '../modules/chat_text/bindings/chat_text_binding.dart';
import '../modules/chat_text/views/chat_text_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

import '../model/Profile.dart';

import '../modules/user/views/avatars_view.dart';
import '../modules/user/views/input_name_view.dart';
import '../modules/user/views/zodiac_view.dart';
import '../modules/info/views/info_view.dart';
import '../modules/info/bindings/info_binding.dart';
import '../modules/purchase/views/purchase_view.dart';
import '../modules/purchase/bindings/purchase_binding.dart';
import '../modules/premium/views/premium_view.dart';
import '../modules/premium/bindings/premium_binding.dart';
import '../modules/chat_page/views/chat_page_view.dart';
import '../modules/chat_page/bindings/chat_page_binding.dart';
import '../modules/pick_bot/views/pick_bot_view.dart';
import '../modules/pick_bot/bindings/pick_bot_binding.dart';
import '../modules/view_profile/views/view_profile_view.dart';
import '../modules/view_profile/bindings/view_profile_binding.dart';
import '../modules/no_model/views/no_model_view.dart';
import '../modules/no_model/bindings/no_model_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PICKBOT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_IMAGE,
      page: () => const ChatImageView(),
      binding: ChatImageBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_TEXT,
      page: () => const ChatTextView(
        profile: Profile(
            name: 'name',
            description: 'description',
            avatarAsset: 'avatarAsset',
            zodiacAsset: 'zodiacAsset',
            message: 'message'),
      ),
      binding: ChatTextBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_NAME,
      page: () => const InputNameView(),
      binding: InputNameBinding(),
    ),
    GetPage(
      name: _Paths.Avatars,
      page: () => const AvatarsView(),
      binding: AvatarsBinding(),
    ),
    GetPage(
      name: _Paths.ZODIAC,
      page: () => const ZodiacView(),
      binding: ZodiacBinding(),
    ),
    GetPage(
      name: _Paths.INFO,
      page: () => const InfoView(),
      binding: InfoBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE,
      page: () => const PurchaseView(),
      binding: PurchaseBinding(),
    ),
    GetPage(
      name: _Paths.PREMIUM,
      page: () => const PremiumView(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: _Paths.CHATPAGE,
      page: () => const ChatPageView(
        profile: Profile(
            name: 'name',
            description: 'description',
            avatarAsset: 'avatarAsset',
            zodiacAsset: 'zodiacAsset',
            message: 'message'),
      ),
      binding: ChatPageBinding(),
    ),
    GetPage(
      name: _Paths.NOMODEL,
      page: () => NoModelView(),
      binding: NoModelBinding(),
    ),
    GetPage(
      name: _Paths.PICKBOT,
      page: () => const PickBotView(
        profile: Profile(
            name: '',
            description: '',
            avatarAsset: '',
            zodiacAsset: '',
            message: ''),
      ),
      binding: PickBotBinding(),
    ),
    GetPage(
      name: _Paths.VIEWPROFILE,
      page: () => const ViewProfileView(
        profile: Profile(
            name: '',
            description: '',
            avatarAsset: '',
            zodiacAsset: '',
            message: ''),
      ),
      binding: ViewProfileBinding(),
    ),
  ];
}
