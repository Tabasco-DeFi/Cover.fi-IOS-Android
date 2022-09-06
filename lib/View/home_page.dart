/// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

/// Views
import 'package:coverfi_flutter/View/borrow_page.dart';
import 'package:coverfi_flutter/View/lend_page.dart';
import 'package:coverfi_flutter/View/main_page.dart';
import 'package:coverfi_flutter/View/metamask_page.dart';

/// Controllers
import 'package:coverfi_flutter/Controller/dashboard_state_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dashboardController = Get.find<DashboardStateController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardStateController>(builder: (controller) {
      return Scaffold(
        body: Stack(
            children: <Widget>[
              IndexedStack(
                index: controller.tabIndex.value,
                children: <Widget>[
                  // Widgets
                  MainPage(),
                  LendPage(),
                  BorrowPage(),
                  MetaMaskWidget()
                ],
              )
            ]
        ),
        // body: SafeArea(
        //   top: true,
        //   bottom: true,
        //   child: Stack(
        //       children: <Widget>[
        //         IndexedStack(
        //           index: controller.tabIndex.value,
        //           children: <Widget>[
        //             // Widgets
        //             MainPage(),
        //             LendPage(),
        //             BorrowPage(),
        //             MetaMaskWidget()
        //           ],
        //         )
        //     ]
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.purple[300],
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.tabIndex.value,
            onTap: controller.changeTabIndex,
            items: <BottomNavigationBarItem>[
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.home, label: "Home"),
              _bottomNavigationBarItem(
                  icon: FontAwesomeIcons.commentDollar, label: "Lend"),
              _bottomNavigationBarItem(
                  icon: FontAwesomeIcons.coins, label: "Borrow"),
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.person, label: "Profile"),
            ]),
      );
    });
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
