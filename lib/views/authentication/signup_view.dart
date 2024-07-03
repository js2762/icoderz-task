import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../data/validation.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "Create an account",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "Email Address",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: CustomTextFormField(
                          validator: (value) => Validation.emailValidation(value.toString()),
                          controller: authController.signUpEmailController,
                          hintText: "Enter your email",
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
                          obscureText: authController.obSecureTextVal2.value,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                authController.toggleObSecureVal2();
                              },
                              child: Icon(
                                authController.obSecureTextVal2.value ? Icons.visibility_off : Icons.visibility,
                                color: Colors.black,
                              )),
                          controller: authController.signUpPasswordController,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          margin: const EdgeInsets.only(top: 30),
                          bgColor: Colors.blue,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          onPressed: () {
                            final isValid = _formKey.currentState?.validate();
                            if (isValid != true) {
                              return;
                            } else {
                              authController.signUp(context);
                            }
                          },
                          childWidget: authController.signUpLoading.value ? const CircularProgressIndicator(color: Colors.white,) : const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
            const TextSpan(text: "Already have an account ? ", style: TextStyle(color: Colors.grey)),
            TextSpan(
              text: "Login",
              style: const TextStyle(color: Colors.black),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  authController.clearSignUpTextControllers();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const LoginView();
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
