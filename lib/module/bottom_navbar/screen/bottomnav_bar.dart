import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/module/Chat/screen/chat_screen.dart';
import 'package:untitled/module/MyOrder/screen/myoder_screen.dart';
import 'package:untitled/module/Profile/screen/user_profile_screen.dart';
import 'package:untitled/module/bottom_navbar/controller/bottomnavbar_controller.dart';
import 'package:untitled/module/Home/screen/addservice_screen.dart';
import 'package:untitled/module/Home/screen/home_screen.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/icon_resources.dart';

class BottomNavBar extends StatelessWidget{
  BottomNavController bottomNavController = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Scaffold(
          backgroundColor: ColorRes.backGroundColor,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomNavController.tabIndex.value,
          onTap: (index)
          {
            bottomNavController.changeTabIndex(index);
          },
          selectedItemColor: ColorRes.primaryColor,
          unselectedItemColor: Colors.black,
          backgroundColor: ColorRes.whiteColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 10.0,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconRes.homeIcon)),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconRes.secondIcon)),
                label: "Second"
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconRes.chatIcon)),
                label: "Chat"
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconRes.profileIcon)),
                label: "Profile"
            ),
          ],
        ),
          body: Obx(()=>IndexedStack(
            index: bottomNavController.tabIndex.value,
            children: [
              HomeScreen(),
              MyOrderScreen(),
              ChatScreen(),
              ProfileScreen()
            ],
          )),
      ),
    );
  }
}
// @override
// Widget build(BuildContext context) {
//   final BottomNavController bottomNavController =
//   Get.put(BottomNavController(), permanent: false);
//   return SafeArea(
//       child: Scaffold(
//         bottomNavigationBar:
//         buildBottomNavigationMenu(context, landingPageController),
//         body: Obx(() => IndexedStack(
//           index: landingPageController.tabIndex.value,
//           children: [
//             HomePage(),
//             ExplorePage(),
//             PlacesPage(),
//             SettingsPage(),
//           ],
//         )),
//       ));
// }