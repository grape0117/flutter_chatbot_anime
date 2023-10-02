import 'package:chat_gpt_flutter/app/modules/avatars/controllers/avatars_controller.dart';
// import 'package:chat_gpt_flutter/app/modules/input_name%20copy/views/input_name_view.dart';
import 'package:chat_gpt_flutter/app/modules/input_name/bindings/input_name_binding.dart';
import 'package:get/get.dart';

import '../modules/chat_image/bindings/chat_image_binding.dart';
import '../modules/chat_image/views/chat_image_view.dart';
import '../modules/chat_text/bindings/chat_text_binding.dart';
import '../modules/chat_text/views/chat_text_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

import '../modules/avatars/views/avatars_view.dart';
import '../modules/avatars/bindings/avatars_binding.dart';
import '../modules/input_name/views/input_name_view.dart';
import '../modules/input_name/bindings/input_name_binding.dart';
import '../modules/zodiac/views/zodiac_view.dart';
import '../modules/zodiac/bindings/zodiac_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
      page: () => const ChatTextView(),
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
  ];
}
