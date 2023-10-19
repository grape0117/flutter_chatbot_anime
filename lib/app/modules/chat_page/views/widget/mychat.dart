import 'package:flutter/material.dart';
import '../../../../model/Profile.dart';

class MyChat extends StatelessWidget {
  // const MateChat({Key?: key}) : super(key: key);
  const MyChat({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 40,
            child: Container(
              alignment: Alignment.center,
              width: 70,
              height: 25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/Sprite/chat_page/aichat_slotName_bg.png'),
                      fit: BoxFit.fill)),
              child: Text(
                profile.name,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'BalloThambi2-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          Positioned(
            top: 40,
            child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.6,
                // height: ,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(165, 54, 165, 0.478),
                    border: Border.all(
                      color: Color.fromRGBO(220, 130, 255, 0.494),
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  profile.description,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'BalloThambi2-Regular',
                      fontSize: 14),
                )),
          )
        ],
      ),
    );
  }
}
