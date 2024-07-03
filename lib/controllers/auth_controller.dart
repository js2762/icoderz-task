import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icoderz_task/services/api%20services/api_services.dart';
import 'package:icoderz_task/services/storage%20services/storage_services.dart';
import 'package:icoderz_task/views/home/home_view.dart';
import '../models/userdata.dart';

class AuthController extends GetxController {
  final storageServiceController = Get.find<StorageServices>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool obSecureTextVal = true.obs;
  RxBool obSecureTextVal2 = true.obs;
  String errorMessage = "";
  RxBool loginLoading = false.obs;
  RxBool signUpLoading = false.obs;

  /// sign up
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();

  ///
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  toggleObSecureVal() {
    obSecureTextVal.value = !obSecureTextVal.value;
  }

  /// signUp
  toggleObSecureVal2() {
    obSecureTextVal2.value = !obSecureTextVal2.value;
  }

  clearLoginTextControllers() {
    emailController.clear();
    passwordController.clear();
  }

  clearSignUpTextControllers() {
    signUpEmailController.clear();
    signUpPasswordController.clear();
  }



  Future<void> login() async {
    loginLoading.value = true;
    try {
      bool isLogin = await ApiServices().login(email: emailController.text, password: passwordController.text);
      if (isLogin) {
        clearLoginTextControllers();
        Get.offAll(() => const HomeView());
      }
      loginLoading.value = false;
    } on FirebaseAuthException catch (error) {
      print(error.code);
      if (error.code == 'user-not-found') {
        errorMessage = 'User not found, Please enter valid E-mail';
      } else if (error.code == 'invalid-credential') {
        errorMessage = 'Invalid credential';
      } else if (error.code == 'email-already-in-use') {
        errorMessage = 'User is already exists with this E-mail, try with another E-mail';
      } else {
        errorMessage = 'Could not authenticate you. Please try again later.';
      }
      loginLoading.value = false;
      await Fluttertoast.showToast(msg: errorMessage.toString(), toastLength: Toast.LENGTH_SHORT);
    } catch (error) {
      loginLoading.value = false;
      await Fluttertoast.showToast(msg: error.toString(), toastLength: Toast.LENGTH_SHORT);
    }
  }

  Future<void> signUp(BuildContext context) async {
    signUpLoading.value = true;
    try {
      bool isSignUp = await ApiServices().signUp(
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
      );
      if (isSignUp) {
        clearSignUpTextControllers();
        Get.offAll(() => const HomeView());
      }
      signUpLoading.value = false;
    } on FirebaseAuthException catch (error) {
      print(error.code);
      if (error.code == 'email-already-in-use') {
        errorMessage = 'User is already exists with this E-mail, try with another E-mail';
      } else {
        errorMessage = 'Could not authenticate you. Please try again later.';
      }
      signUpLoading.value = false;
      await Fluttertoast.showToast(msg: errorMessage.toString(), toastLength: Toast.LENGTH_SHORT);
    } catch (error) {
      signUpLoading.value = false;
      await Fluttertoast.showToast(msg: error.toString(), toastLength: Toast.LENGTH_SHORT);
    }
  }

  Future<bool> checkAutoLogin() async {
    var userData = storageServiceController.authUserBox.get("userData");
    if (userData?.idToken == null || userData?.idToken == "") {
      return false;
    } else {
      return true;
    }
  }

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        storageServiceController.authUserBox.put("userData", UserData(idToken: googleAuth.idToken.toString(), email: googleUser.email,profileImage: googleUser.photoUrl));
        Get.offAll(()=>const HomeView());
        // Handle successful sign-in here
        // You can get user details using: googleUser.displayName, googleUser.email, etc.
      } else {
        // Handle unsuccessful sign-in here
      }
    } catch (error) {
      // Handle errors here
      print('Error signing in: $error');
    }
  }

  logOut() async {
    FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    storageServiceController.earningEntryBox.clear();
    storageServiceController.expensesEntryBox.clear();
    storageServiceController.authUserBox.clear();
  }

}
