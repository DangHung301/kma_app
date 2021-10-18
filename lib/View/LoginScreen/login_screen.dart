import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kma_app/Helper/const/color.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController input = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image:
                        const AssetImage('assets/image/logo_splash_screen.png'),
                    height: size.height * 0.2,
                    width: size.width,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'HỌC VIỆN KỸ THUẬT MẬT MÃ',
                    style: TextStyle(
                        color: colorText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 27),
                  child: TextField(
                    controller: input,
                    cursorHeight: 41,
                    decoration: InputDecoration(
                      hintText: 'Tài khoản',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 27),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Mật khẩu',

                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {},
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.white))),
                  ),
                ),
                Container(
                  height: size.height * 0.08,
                  child: SizedBox(),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      alignment: AlignmentDirectional.center,
                      width: size.width,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 27),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [startLinearColor, endLinearColor]),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      )),
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {},
                  child: Container(
                      alignment: AlignmentDirectional.center,
                      width: size.width,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 27),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: endLinearColor),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        'Đăng nhập với quyền giảng viên',
                        style: TextStyle(color: startLinearColor, fontSize: 15),
                      )),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text('Đăng ký',
                        style: TextStyle(
                            color: startLinearColor,
                            fontSize: 18,
                            decoration: TextDecoration.underline)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
