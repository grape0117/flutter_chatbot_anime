import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/Profile.dart';
import '../../pick_bot/controllers/pick_bot_controller.dart';
import 'profileCard_.dart';
import '../../chat_page/views/chat_page_view.dart';

enum Swipe { left, right, none }

class DragWidget extends StatefulWidget {
  const DragWidget({
    Key? key,
    required this.profile,
    required this.index,
    required this.swipeNotifier,
    this.isLastCard = false,
  }) : super(key: key);
  final Profile profile;
  final int index;
  final ValueNotifier<Swipe> swipeNotifier;
  final bool isLastCard;

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        // Data is the value this Draggable stores.
        data: widget.index,
        feedback: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
            valueListenable: widget.swipeNotifier,
            builder: (context, swipe, _) {
              return RotationTransition(
                turns: widget.swipeNotifier.value != Swipe.none
                    ? widget.swipeNotifier.value == Swipe.left
                        ? const AlwaysStoppedAnimation(-5 / 360)
                        : const AlwaysStoppedAnimation(5 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: Stack(
                  children: [
                    ProfileCard(profile: widget.profile),
                    widget.swipeNotifier.value != Swipe.none
                        ? widget.swipeNotifier.value == Swipe.right
                            ? Positioned(
                                top: MediaQuery.of(context).size.height * 0.3,
                                right: MediaQuery.of(context).size.width * 0.4,
                                child: Image(
                                  image: AssetImage(
                                      'assets/Sprite/pick_model/icon_card_like_big.png'),
                                  width: 50,
                                ))
                            : Positioned(
                                top: MediaQuery.of(context).size.height * 0.3,
                                right: MediaQuery.of(context).size.width * 0.4,
                                child: Image(
                                  image: AssetImage(
                                      'assets/Sprite/pick_model/icon_card_unlike_big.png'),
                                  width: 50,
                                ))
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ),
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
            widget.swipeNotifier.value = Swipe.right;
          }
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
            widget.swipeNotifier.value = Swipe.left;
          }
        },
        onDragEnd: (drag) {
          widget.swipeNotifier.value = Swipe.none;
        },

        childWhenDragging: Container(
          color: Colors.transparent,
        ),

        //This will be visible when we press action button
        child: ValueListenableBuilder(
            valueListenable: widget.swipeNotifier,
            builder: (BuildContext context, Swipe swipe, Widget? child) {
              return Stack(
                children: [
                  ProfileCard(profile: widget.profile),
                  // heck if this is the last card and Swipe is not equal to Swipe.none
                  swipe != Swipe.none && widget.isLastCard
                      ? swipe == Swipe.right
                          ? Positioned(
                              top: MediaQuery.of(context).size.height * 0.3,
                              right: MediaQuery.of(context).size.width * 0.4,
                              child: Image(
                                image: AssetImage(
                                    'assets/Sprite/pick_model/icon_card_like_big.png'),
                                width: 50,
                              ))
                          : Positioned(
                              top: MediaQuery.of(context).size.height * 0.3,
                              right: MediaQuery.of(context).size.width * 0.4,
                              child: Image(
                                image: AssetImage(
                                    'assets/Sprite/pick_model/icon_card_unlike_big.png'),
                                width: 50,
                              ))
                      : const SizedBox.shrink(),
                ],
              );
            }),
      ),
    );
  }
}

class CardsStackWidget extends StatefulWidget {
  const CardsStackWidget({Key? key}) : super(key: key);

  @override
  State<CardsStackWidget> createState() => _CardsStackWidgetState();
}

class _CardsStackWidgetState extends State<CardsStackWidget>
    with SingleTickerProviderStateMixin {
  List<Profile> previousItem = [];

  List<Profile> draggableItems = [
    Profile(
        name: 'Belliville',
        description:
            'The female pirate captain of the grand pirate crew, her hobbies are drinking, adventuring, and robbing young handsome men. She can handle much more than she appears.',
        avatarAsset: 'assets/Sprite/pick_model/avatar_1.png',
        zodiacAsset: 'assets/Sprite/zodiac/img_constellation_Cancer.png',
        message: 'Hello World!'),
    Profile(
        name: 'Sarah',
        description:
            'Maintaining a career and a relationship might be challenging, but after coming home to an empty bed too many times, I am willing to take on that challenge. Are you?',
        avatarAsset: 'assets/Sprite/pick_model/avatar_2.png',
        zodiacAsset: 'assets/Sprite/zodiac/img_constellation_Cancer.png',
        message:
            'There is not so much perfection in the world but my surname stars with P.'),
    Profile(
        name: 'Arpros',
        description:
            "It's hard to find any anyone more workaholic than her. According to her colleagues' descriptions, they hardly ever come accross her outside the company. Does she not even stroll around the streets?",
        avatarAsset: 'assets/Sprite/pick_model/avatar_3.png',
        zodiacAsset: 'assets/Sprite/zodiac/img_constellation_Cancer.png',
        message: 'What can I do for you?'),
    Profile(
        name: 'Vivian',
        description:
            "The class president, a somewhat hot-tempered catgirl, always gives off a serious and assertive vibe, but deep inside, she surprisingly becomes easily shy.",
        avatarAsset: 'assets/Sprite/pick_model/avatar_4.png',
        zodiacAsset: 'assets/Sprite/zodiac/img_constellation_Cancer.png',
        message:
            "Hmph! Don't get the wrong idea. I'm not tutoring you because I care about you."),
  ];

  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  // ValueNotifier<Swipe> indexNotifier = ValueNotifier(int.0)
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        draggableItems.removeLast();
        _animationController.reset();

        swipeNotifier.value = Swipe.none;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) => Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: List.generate(draggableItems.length, (index) {
                if (index == draggableItems.length - 1) {
                  return PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                          const Rect.fromLTWH(0, 0, 580, 340),
                          const Size(580, 340)),
                      end: RelativeRect.fromSize(
                          Rect.fromLTWH(
                              swipe != Swipe.none
                                  ? swipe == Swipe.left
                                      ? -300
                                      : 300
                                  : 0,
                              0,
                              580,
                              340),
                          const Size(580, 340)),
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeInOut,
                    )),
                    child: RotationTransition(
                      turns: Tween<double>(
                              begin: 0,
                              end: swipe != Swipe.none
                                  ? swipe == Swipe.left
                                      ? -0.1 * 0.3
                                      : 0.1 * 0.3
                                  : 0.0)
                          .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve:
                              const Interval(0, 0.4, curve: Curves.easeInOut),
                        ),
                      ),
                      child: DragWidget(
                        profile: draggableItems[index],
                        index: index,
                        swipeNotifier: swipeNotifier,
                        isLastCard: true,
                      ),
                    ),
                  );
                } else {
                  return DragWidget(
                    profile: draggableItems[index],
                    index: index,
                    swipeNotifier: swipeNotifier,
                  );
                }
              }),
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                print('next image $index');
                print("DDDCCCCVC ${draggableItems[index].name}");
                previousItem = [draggableItems[index]];
                draggableItems.removeAt(index);
              });
              //           },
            },
          ),
        ),
        Positioned(
          right: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              print('let us chat with this model!');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatPageView(profile: draggableItems[index]),
                ),
              );
              // Get.toNamed(Routes.CHAT_TEXT);
              setState(() {
                // draggableItems.add(previousItem[0]);
              });
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 50,
          right: 50,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child:
                // Row(chil
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        print('----------skip');
                        // printInfo(widget);
                        // print(widget.);
                        // print(index.value);
                        swipeNotifier.value = Swipe.left;
                        _animationController.forward();
                      },
                      child: Image.asset(
                        'assets/Sprite/pick_model/profile_btn_dislike_bg.png',
                        width: 35,
                        height: 35,
                      ))),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        print('--------------like');
                        swipeNotifier.value = Swipe.right;
                        // _animationController.forward();
                        print('object');
                        Get.toNamed(Routes.CHAT_TEXT);
                      },
                      child: Image.asset(
                        'assets/Sprite/pick_model/profile_bgn_like_bg.png',
                        width: 40,
                        height: 40,
                      ))),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        print('--------------back');
                      },
                      child: Image.asset(
                        'assets/Sprite/pick_model/img_btn_back_main.png',
                        width: 35,
                        height: 35,
                      ))),
            ]),
          ),
        ),
      ],
    );
  }
// }
}
