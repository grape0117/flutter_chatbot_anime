import 'package:flutter/material.dart';
import '../../../../model/Profile.dart';

class DefaultMessage extends StatelessWidget {
  // const MateChat({Key?: key}) : super(key: key);
  const DefaultMessage({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 1.0,
        // margin: EdgeInsets.only(left: 20),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Color.fromRGBO(145, 143, 143, 0.486),
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            profile.message,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'BalloThambi2-Regular',
                fontSize: 14),
          ),
        ));
  }
}
