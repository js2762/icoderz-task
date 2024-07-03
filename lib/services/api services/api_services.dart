import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icoderz_task/models/userdata.dart';
import 'package:icoderz_task/services/storage%20services/storage_services.dart';


class ApiServices extends GetxService {

  final storageServiceController = Get.find<StorageServices>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> login({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      var idTokenResult = await user?.getIdTokenResult();
      print(99999999);
      print(idTokenResult);
      if (idTokenResult != null) {
        storageServiceController.authUserBox.put("userData", UserData(idToken: idTokenResult.toString(),email: user!.email.toString()));

        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }


  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        storageServiceController.authUserBox.put("userData", UserData(idToken: googleAuth.idToken.toString(), email: googleUser.email,profileImage: googleUser.photoUrl));
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



  Future<bool> signUp({required String email,required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      var idTokenResult = await user?.getIdTokenResult();
      print(idTokenResult);
      print(272727);
      if (idTokenResult != null) {
        storageServiceController.authUserBox.put("userData", UserData(idToken: idTokenResult.toString(),email: user!.email.toString()));
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }


}