import 'package:dating_app_clone/components/template.dart';
import 'package:dating_app_clone/routes/route_name.dart';
import 'package:dating_app_clone/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              colors: [
                Color(ColorWay.white),
                Color(ColorWay.primary),
                Color(ColorWay.primary),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const Text(
                "TANDER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Meet the right person",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.width * 0.12,
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: const FormSection(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 6),
          child: const Text(
            "Sign in to continue",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Color(ColorWay.gray)),
          ),
        ),
        Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
          child: const TextField(
            decoration: InputDecoration(hintText: "Username"),
          ),
        ),
        Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: const TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: "Password"),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            padding: const EdgeInsets.symmetric(vertical: 19),
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(
                color: Color(ColorWay.primary),
                borderRadius: BorderRadius.all(Radius.circular(130))),
            child: const Center(
              child: Text(
                "SIGN IN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: const Text(
              "Or",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(ColorWay.primary)),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await AuthService().signInWithGoogle();
            Get.offAllNamed(RouteName.homePage);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 19),
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(130)),
                border: Border.all(
                  color: const Color(ColorWay.primary),
                  width: 1,
                )),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset(
                      'assets/images/google.png',
                      width: 16,
                      height: 16,
                    ),
                  ),
                  const Text(
                    "SIGN IN WITH GOOGLE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(ColorWay.gray),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
