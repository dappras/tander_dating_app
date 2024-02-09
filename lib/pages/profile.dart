import 'package:dating_app_clone/components/template.dart';
import 'package:dating_app_clone/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 2;
    var storage = GetStorage();

    var user = storage.read('user') ?? {};

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
              top: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(1000))),
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(1000)),
                      child: Image.network(
                        "${user.photoUrl}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Center(
                    child: Text(
                      "${user.displayName}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: const Color(ColorWay.gray),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Name"),
                      Text(
                        "${user.displayName}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: const Color(ColorWay.gray),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Email"),
                      Text(
                        "${user.email}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    padding: const EdgeInsets.symmetric(vertical: 19),
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: const BoxDecoration(
                        color: Color(ColorWay.primary),
                        borderRadius: BorderRadius.all(Radius.circular(130))),
                    child: const Center(
                      child: Text(
                        "SIGN OUT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
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
