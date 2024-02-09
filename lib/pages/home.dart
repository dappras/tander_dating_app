import 'package:dating_app_clone/components/template.dart';
import 'package:dating_app_clone/controller/home_controller.dart';
import 'package:dating_app_clone/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCont = Get.put(HomeController());
    var selectedIndex = 1;

    onItemTapped(var index) {
      if (index == 1) {
        Get.offNamed(RouteName.homePage);
      }

      if (index == 0) {
        Get.offNamed(RouteName.likePage);
      }

      if (index == 2) {
        Get.offNamed(RouteName.profilePage);
      }
    }

    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Obx(
                      () => Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                          child: homeCont.listUser.isNotEmpty
                              ? Image.network(
                                  homeCont.listUser.isNotEmpty
                                      ? "${homeCont.listUser[0]['picture']['large']}"
                                      : "",
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                        ),
                      ),
                    ),
                    Obx(
                      () => Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.04,
                        left: MediaQuery.of(context).size.width * 0.06,
                        right: MediaQuery.of(context).size.width * 0.06,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homeCont.listUser.isNotEmpty
                                    ? "${homeCont.listUser[0]['name']['first']} ${homeCont.listUser[0]['name']['last']}, ${homeCont.listUser[0]['dob']['age']}"
                                    : "",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: const Icon(
                                        Icons.location_pin,
                                        color: Color(ColorWay.primary),
                                        size: 12,
                                      ),
                                    ),
                                    Text(
                                      homeCont.listUser.isNotEmpty
                                          ? "${homeCont.listUser[0]['location']['country']}, ${homeCont.listUser[0]['location']['city']}"
                                          : "",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          homeCont.eventDislike();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(1000)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), // warna bayangan
                                spreadRadius:
                                    5, // radius bayangan yang menyebar
                                blurRadius: 7, // radius blur bayangan
                                offset: const Offset(0, 3), // offset bayangan
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Color(ColorWay.primary),
                            size: 40,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeCont.eventLike();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(ColorWay.primary),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(1000)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), // warna bayangan
                                spreadRadius:
                                    5, // radius bayangan yang menyebar
                                blurRadius: 7, // radius blur bayangan
                                offset: const Offset(0, 3), // offset bayangan
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Likes',
            ),
            BottomNavigationBarItem(
              icon: Container(),
              // icon: Icon(Icons.home),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: const Color(ColorWay.primary),
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(200)),
          child: InkWell(
            onTap: () {
              Get.offNamed(RouteName.homePage);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(ColorWay.primary),
                  borderRadius: BorderRadius.circular(200)),
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.all(14),
              child: const Icon(
                Icons.home,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
