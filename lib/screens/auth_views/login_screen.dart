import 'package:ecommerce_app/screens/auth_views/forget_screen.dart';
import 'package:ecommerce_app/screens/auth_views/registration_screen.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var isHidden = true.obs;

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  //IMAGE AND CONSTANT WELCOME MESSAGE
                  children: [
                    Lottie.asset('assets/lottie/login.json', width: 250),
                    // SvgPicture.asset(
                    //   'assets/images/login_image.svg',
                    //   width: w * 0.7,
                    // ),

                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0, left: 10, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Selamat Datang',
                            style: GoogleFonts.ubuntuCondensed(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0, left: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Masukan Email Dan Password Anda',
                            style: GoogleFonts.ubuntuCondensed(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: h * 0.04,
                    ),

                    //TEXTFIELDS TO INPUT CREDENTIALS
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
                                hintText: "Enter Email address"),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Obx(
                            () => TextFormField(
                              controller: passwordController,
                              obscureText: isHidden.value,
                              decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        isHidden.value = !isHidden.value;
                                      },
                                      child: Obx(
                                        () => isHidden.value
                                            ? const Icon(IconlyLight.show)
                                            : const Icon(IconlyLight.hide),
                                      )),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide:
                                          const BorderSide(color: Colors.teal)),
                                  hintText: "Password"),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),

                          //FORGOT PASSWORD
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(const ForgotPassword()),
                                child: Text(
                                  "Lupa Password?",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.04,
                          ),

                          //LOGIN BUTTON
                          GestureDetector(
                            onTap: () {
                              BuildContext context =
                                  Get.context!; // Get the current context
                              AuthController.instance.signIn(
                                  context,
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                            },
                            child: Container(
                              height: h * 0.06,
                              width: w * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Center(
                                  child: Text(
                                "LOGIN",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, left: 10, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Belum punya akun? ',
                                    style: GoogleFonts.lato(fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: w * 0.008,
                                  ),
                                  GestureDetector(
                                      onTap: () => Get.to(RegistrationScreen()),
                                      child: Text(
                                        'Daftar',
                                        style: GoogleFonts.lato(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
