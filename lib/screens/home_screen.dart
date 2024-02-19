import 'package:get/get.dart';
import 'category_export.dart';
import 'package:ecommerce_app/widgets/flash_sale_grid.dart';
import 'package:ecommerce_app/widgets/sale_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void logoutUser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    List categoryScreen = [
      const PhoneScreen(),
      const ConsoleScreen(),
      const LaptopScreen(),
      const CameraScreen(),
      const AudioScreen(),
      const GamesScreen()
    ];

    List<String> locations = [
      'assets/icons/smartphone.png',
      'assets/icons/console.png',
      'assets/icons/laptop.png',
      'assets/icons/camera.png',
      'assets/icons/headphones.png',
      'assets/icons/game.png'
    ];
    List<String> titles = [
      'Phones',
      'Consoles',
      'Laptop',
      'Camera',
      'Audio',
      'Games'
    ];

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: const Text(
            'Shopping',
            style: TextStyle(
              fontFamily: 'Tektur',
              fontSize: 32.0,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () => logoutUser(),
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0, top: 4, bottom: 8),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3, 3.5),
                            blurRadius: 2.5)
                      ]),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Image.asset('assets/icons/exit.png'),
                  )),
                ),
              ),
            )
          ],
        ),
        body: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                //SEARCH BAR AND DELIVERY DISCOUNT SECTION
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                       
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                      height: h * 0.2,
                      width: w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 12.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.grey[200],
                                ),
                                height: h * 0.075,
                                width: w,
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      IconlyLight.search,
                                      color: Colors.grey[600],
                                    ),
                                    SizedBox(
                                      width: w * 0.03,
                                    ),
                                    Text(
                                      'Cari Barang',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 17.0,
                                          color: Colors.black),
                                    )
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(
                              height: h * 0.019,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255, 0, 178, 160),
                                    Color.fromARGB(238, 14, 198, 155)
                                  ])),
                              height: h * 0.075,
                              width: w,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Pengiriman sekarang',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: w * 0.01,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 17.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Center(
                                              child: Text(
                                            "50%",
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w * 0.015,
                                    ),
                                    const Text(
                                      'lebih murah.',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.015,
                    ),

                    //CATEGORIES AND FLASH SALE SECTION
                    Container(
                      decoration: const BoxDecoration(
                        
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0))),
                      height: h,
                      width: w,
                      child: Column(
                        children: [
                          //CATEGORIES TEXT
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Row(children: [
                              const Text(
                                'Kategori',
                                style: TextStyle(
                                    fontFamily: 'Tektur',
                                    fontSize: 25.0,
                                 
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                            ]),
                          ),
                          //LISTVIEW OF CATEGORIES
                          Container(
                            width: double.infinity,
                            height: 100,
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Expanded(
                                    child: ListView.builder(
                                        itemCount: titles.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: ((context, index) {
                                          return InkWell(
                                            onTap: () =>
                                                Get.to(categoryScreen[index]),
                                            child: CategoryContainer(
                                              
                                                height: h,
                                                title: titles[index],
                                                location: locations[index]),
                                          );
                                        }))),
                              ],
                            ),
                          ),
                          //FLASH SALE AND TIMER TEXT
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Flash Sale',
                                  style: TextStyle(
                                      fontFamily: 'Tektur',
                                      fontSize: 25.0,
                                     
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: w * 0.03,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.lime,
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: FlashSaleCountdown()),
                                )
                              ],
                            ),
                          ),
                          //GRIDVIEW OF FLASH SALE PRODUCTS
                          Expanded(child: FlashSaleGrid()),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key,
      required this.height,
      required this.title,
      required this.location});

  final double height;
  final String title;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            height: 70,
            width: 70,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Image.asset(location)),
            ),
          ),
          SizedBox(
            height: height * 0.008,
          ),
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'Lato',
                
                fontSize: 13.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
