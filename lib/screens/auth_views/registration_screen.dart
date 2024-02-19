import 'package:ecommerce_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var isHidden = true.obs;

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
                    Lottie.asset('assets/lottie/register.json', width: 250),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0, left: 10, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Buat Akun Baru',
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

                    //TEXTFIELDS TO INPUT CREDENTIALS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                                hintText: "Masukan Nama Panjang"),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                                hintText: "Masukan Email"),
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
                                  hintText: "Masukan Password"),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),

                          //REGISTER BUTTON
                          GestureDetector(
                            onTap: () {
                              BuildContext context =
                                  Get.context!; // Get the current context
                              AuthController.instance.register(
                                  context,
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                            },
                            child: Container(
                              height: h * 0.065,
                              width: w * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Center(
                                  child: Text(
                                "Daftar",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                            ),
                          ),
                            SizedBox(height: h * 0.02),
                          Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, left: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah punya akun? ',
                              style: GoogleFonts.lato(fontSize: 16),
                            ),
                            SizedBox(
                              width: w * 0.008,
                            ),
                            GestureDetector(
                                onTap: () => Get.back(),
                                child: Text(
                                  'LOGIN',
                                  style: GoogleFonts.lato(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ))
                          ],
                        )),
                          SizedBox(height: h * 0.04),
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
