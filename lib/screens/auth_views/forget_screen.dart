import 'package:ecommerce_app/overlay/error_overlay.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                IconlyBroken.arrow_left_2,
                size: h * 0.035,
              ))),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  //IMAGE AND CONSTANT WELCOME MESSAGE
                  children: [
                    Lottie.asset('assets/lottie/forgot.json', width: 250),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0, left: 10, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lupa Password?',
                            style: GoogleFonts.ubuntuCondensed(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                                hintText: "Masukan email"),
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          GestureDetector(
                            onTap: () {
                              String email = emailController.text.trim();
                              if (email.isNotEmpty) {
                                AuthController.instance.resetPassword(email);
                              } else {
                                Navigator.of(Get.context!).push(
                                  ErrorOverlay(
                                    message: 'isi email terlebih dahulu.',
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: h * 0.065,
                              width: w * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Center(
                                  child: Text(
                                "Kirim",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
