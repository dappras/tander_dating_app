import 'package:dating_app_clone/components/template.dart';
import 'package:dating_app_clone/controller/likes_controller.dart';
import 'package:dating_app_clone/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikesPage extends StatelessWidget {
  const LikesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0;

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
        appBar: AppBar(
          title: const Text(
            "Likes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
            ),
            child: body(context),
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

  Widget body(BuildContext context) {
    var likesCont = Get.put(LikesController());

    return likesCont.listUser.isNotEmpty
        ? Obx(() => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // Atur jumlah item dalam satu baris
                  crossAxisCount: 2,
                  // Atur rasio antara lebar dan tinggi setiap item
                  childAspectRatio: 2 / 4,
                  // Atur jarak antara item di baris
                  crossAxisSpacing: 10,
                  // Atur jarak antara item di kolom
                  mainAxisSpacing: 12,
                ),
                itemCount:
                    likesCont.listUser.length, // Jumlah total item dalam grid
                itemBuilder: (BuildContext context, int index) {
                  dynamic item = likesCont.listUser[index];

                  return Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          child: Image.network(
                            "${item['picture']['large']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.03,
                        right: MediaQuery.of(context).size.width * 0.03,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${item['name']['first']} ${item['name']['last']}, ${item['dob']['age']}",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
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
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Text(
                                        "${item['location']['city']}",
                                        softWrap: true,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ))
        : Container();
  }
}
