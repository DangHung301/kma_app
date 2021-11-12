import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kma_app/Helper/const/color.dart';
import 'package:kma_app/View/Screen/Tabar/main_tabbar_view.dart';
import 'package:kma_app/View/Screen/Tabar/tabbar_viewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  final LoginViewModel viewModel;

  LoginScreen(this.viewModel);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Scaffold(
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
                      image: const AssetImage(
                          'assets/image/logo_splash_screen.png'),
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
              flex: 6,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 27),
                    child: TextField(
                      controller: username,
                      decoration: InputDecoration(
                        hintText: 'Tài khoản',
                        errorText: widget.viewModel.userNameInvalidate,
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
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 27),
                    child: TextField(
                      controller: password,
                      obscureText: widget.viewModel.isPassword,
                      decoration: InputDecoration(
                          hintText: 'Mật khẩu',
                          errorText: widget.viewModel.passwordInvalidate,
                          suffixIcon: IconButton(
                            icon: widget.viewModel.isPassword
                                ? Icon(Icons.remove_red_eye_outlined)
                                : Icon(Icons.remove_red_eye),
                            onPressed: () {
                              widget.viewModel.isPassword =
                              !widget.viewModel.isPassword;
                              setState(() {});
                            },
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                              const BorderSide(color: Colors.white))),
                    ),
                  ),
                  Container(
                    height: size.height * 0.07,
                    child: SizedBox(),
                  ),
                  InkWell(
                    onTap: () async {
                      widget.viewModel
                          .checkInvalidate(username.text, password.text);
                      String data = await widget.viewModel.login(
                          username.text.toString(), password.text.toString());
                      if (data != '') {
                        SharedPreferences preference =
                        await SharedPreferences.getInstance();
                        preference.setString('token', data);

                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (context) =>
                            MainTabbarView(viewModel: TabbarViewModel())), (
                            route) => false);


                      } else {
                        final snackBar = SnackBar(
                            content: Text('Username or Passwor Inconrrect'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      setState(() {});
                    },
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
                        child: const Text(
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
                          style:
                          TextStyle(color: startLinearColor, fontSize: 15),
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
      ),
    );
  }
}
