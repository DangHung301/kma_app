import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kma_app/Helper/const/color.dart';

class AppBarDefault extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String name;

  AppBarDefault({
    Key? key,
    required this.name,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: backgroundColor),
      elevation: 0,
      leading: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/image/avata.jpg')),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),

      actions: [
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/image/logo_splash_screen.png')),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ],
      title: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: colorText, fontWeight: FontWeight.w700),
      ),


    );
  }
}
