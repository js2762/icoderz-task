import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icoderz_task/controllers/auth_controller.dart';
import 'package:icoderz_task/data/app_images.dart';
import 'package:icoderz_task/views/authentication/signup_view.dart';

import '../../data/validation.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "Hi, Welcome Back! 👋",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: CustomTextFormField(
                          hintText: "Enter your email",
                          validator: (value) => Validation.emailValidation(value.toString()),
                          controller: authController.emailController,
                        ),
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: CustomTextFormField(
                          validator: (value) => Validation.passwordValidation(value.toString()),
                          hintText: "Please Enter Your Password",
                          obscureText: authController.obSecureTextVal.value,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                authController.toggleObSecureVal();
                              },
                              child: Icon(
                                authController.obSecureTextVal.value ? Icons.visibility_off : Icons.visibility,
                                color: Colors.black,
                              )),
                          controller: authController.passwordController,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          margin: const EdgeInsets.only(bottom: 10),
                          bgColor: Colors.blue,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          onPressed: () {
                            final isValid = formKey.currentState?.validate();
                            if (isValid != true) {
                              return;
                            } else {
                              authController.login();
                            }
                          },
                          childWidget: authController.loginLoading.value ? const CircularProgressIndicator(
                            color: Colors.white,
                          )  : const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                            bgColor: Colors.white,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            onPressed: () {
                              authController.googleSignIn();
                            },
                            childWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                    AppImages.googleIcon,
                                    height: 25,
                                  ),
                                ),
                                const Text(
                                  "Sign-In with Google",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          height: 40,
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(children: [
            const TextSpan(text: "Don't have an account ? ", style: TextStyle(color: Colors.grey)),
            TextSpan(
              text: "Sign Up",
              style: const TextStyle(color: Colors.black),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  authController.clearLoginTextControllers();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const SignupView();
                    },
                  ));
                },
            ),
          ])),
        ),
      ),
    );
  }
}
