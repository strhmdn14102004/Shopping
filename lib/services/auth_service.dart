import 'package:ecommerce_app/overlay/email.dart';
import 'package:ecommerce_app/overlay/error_overlay.dart';
import 'package:ecommerce_app/overlay/success_overlay.dart';
import 'package:ecommerce_app/screens/auth_views/login_screen.dart';
import 'package:ecommerce_app/screens/navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => NavigationScreen());
    }
  }
 String? get userEmail => _user.value?.email;

  void register(BuildContext context, String email, String password) async {
  try {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    Navigator.of(context).push(
      ErrorOverlay(
        message: "Isi Data Dengan Benar",
      ),
    );
  }
}


  void signIn(BuildContext context,String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
     Navigator.of(context).push(
      ErrorOverlay(
        message: "Login gagal cek kembali data yang kamu masukan",
      ),
    );
    }
  }

   void resetPassword(String email) async {
  try {
    await auth.sendPasswordResetEmail(email: email);
     Navigator.of(Get.context!).push(
      SuccessOverlay(
        message: 'Cek email kamu, email reset password berhasil dikirimkan.',
      ),
    );
  } catch (e) {
    print("Reset Password Error: $e");
    Navigator.of(Get.context!).push(
      ErrorOverlay(
        message: 'Failed to send reset password email. Please try again.',
      ),
    );
  }
}

void verifyEmail() async {
  try {
    User? user = auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      Navigator.of(Get.context!).push(
      EmailOverlay(
        message: 'Verifikasi berhasil dikirim, check Email Kamu.',
      ),
    );
    } else {
      Navigator.of(Get.context!).push(
      ErrorOverlay(
        message: 'Email Sudah Diverifikasi.',
      ),
    );
    }
  } catch (e) {
    print("Email Verification Error: $e");
    Navigator.of(Get.context!).push(
      ErrorOverlay(
        message: 'Failed to send verification email. Please try again.',
      ),
    );
  }
}

  void logout() {
    try {
      auth.signOut();
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Error Occurred :/',
        duration: Duration(milliseconds: 900),
      ));
    }
  }
}

class AuthService {
  //GOOGLE SIGN IN
  signInWithGoogle() async {
    //OPEN UP THE ACCOUNTS LIST
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //AUTHENTICATION REQUEST FROM GOOGLE
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //CREATE NEW USER CREDENTIALS
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //SIGN IN USER
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
