import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kma_app/Helper/const/color.dart';
import 'package:kma_app/View/HomeScreen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:kma_app/View/LoginScreen/login_viewmodel.dart';

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

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 4,
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
                      controller: username,
                      decoration: InputDecoration(
                        hintText: 'Tài khoản',
                        fillColor: Colors.white,
                        filled: true,
                        errorText: widget.viewModel.isCheckLogin
                            ? 'Value can\'t empty'
                            : null,
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
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Mật khẩu',
                          errorText: widget.viewModel.isCheckLogin
                              ? 'Value can\'t empty'
                              : null,
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
                    onTap: () async {
                      String data = await widget.viewModel
                          .login(username.text, password.text);
                      if (username.text.isEmpty && password.text.isEmpty) {
                        widget.viewModel.isCheckLogin = true;
                        setState(() {});
                      } else {
                        widget.viewModel.isCheckLogin = false;
                        setState(() {
                          if (data != '') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } else {
                            final snackBar = SnackBar(content: Text(
                                'Username or Password don\'t valid'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        });

                      }
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
      ),
    );
  }
}
