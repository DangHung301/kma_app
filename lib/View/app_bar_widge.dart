import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kma_app/Helper/const/color.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      margin: EdgeInsets.only(right: 7, left: 7, top: 50, bottom: 30),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 35,
              width: 35,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                // backgroundImage:
                //     AssetImage('assets/image/logo_splash_screen.png'),
              ),
            ),
          ),
          Expanded(
            child: Text(
              'NGUYỄN ĐĂNG HÙNG',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: colorText, fontSize: 18),
            ),
            flex: 7,
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 40,
              width: 40,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    AssetImage('assets/image/logo_splash_screen.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
