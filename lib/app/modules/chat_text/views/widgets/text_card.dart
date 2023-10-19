import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../model/Profile.dart';

class TextCard extends StatelessWidget {
  TextCard({Key? key, this.textData, required this.profile}) : super(key: key);
  Profile profile;

  var textData;

  @override
  Widget build(BuildContext context) {
    print('object');
    return Padding(
      padding: const EdgeInsets.only(left: 150, right: 12, bottom: 12, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(179, 163, 58, 137),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(profile.name),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Image(
                  image: AssetImage(
                      'assets/Sprite/chat_page/aichat_slot_thoughtBtn.png'),
                  width: 50,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            width: Get.size.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                color: Color.fromRGBO(233, 230, 230, 0.49),
                border: Border.all(
                  color: Color.fromRGBO(220, 130, 255, 0.494),
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              textData.message['content'],
              // 'The female pirate captain of the grand pirate crew, her hobbies are drinking, adventuring, and robbing young handsome men. She can handle much more than she appears.',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'BalloThambi2-Regular',
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}

class MyTextCard extends StatelessWidget {
  MyTextCard({Key? key, this.textData, required this.profile})
      : super(key: key);
  final Profile profile;

  var textData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(179, 163, 58, 137),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(profile.name),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: Color.fromARGB(179, 230, 20, 177),
              border:
                  Border.all(color: Color.fromARGB(148, 243, 9, 231), width: 5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              textData.message['content'],
              // 'The female pirate captain of the grand pirate crew, her hobbies are drinking, adventuring, and robbing young handsome men. She can handle much more than she appears.',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'BalloThambi2-Regular',
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
