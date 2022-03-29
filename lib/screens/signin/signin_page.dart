import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/config/routes.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/widgets/custom_button/custom_button.dart';
import 'package:store_app/widgets/text_input/text_input.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isEmail = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Container(),
            flex: 1,
          ),
          Flexible(
            child: Column(
              children: [
                _isEmail
                    ? CustomInput(
                        placeholder: AppPlaceHolder.emailAddress,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress)
                    : CustomInput(
                        placeholder: AppPlaceHolder.password,
                        controller: emailController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        inputFormatter: true),
                Container(
                  child: GestureDetector(
                    child: Text(
                      "Login using ${_isEmail ? AppPlaceHolder.phoneNumber : AppPlaceHolder.emailAddress}",
                      style: TextStyle(color: Colors.indigoAccent),
                    ),
                    onTap: () => {
                      setState(() {
                        _isEmail = !_isEmail;
                      })
                    },
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.symmetric(vertical: 5),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomInput(
                    placeholder: "Password",
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    isIconRequired: true),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onClick: () =>
                      {Navigator.pushNamed(context, Routes.dashboard)},
                  buttonName: AppConstants.loginButtonName,
                  buttonColor: AppColors.loginButtonColor,
                  textColor: Color(0xFFFFFF),
                )
              ],
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
