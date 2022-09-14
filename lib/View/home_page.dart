/// Packages
import 'package:animations/animations.dart';
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
  final List<Widget> _pageList = <Widget>[
    MainPage(),
    LendPage(),
    BorrowPage(),
    MetaMaskWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardStateController>(builder: (controller) {
      return Scaffold(
        body: PageTransitionSwitcher(
          transitionBuilder: (
              Widget child,
              Animation<double> primaryAnimation,
              Animation<double> secondaryAnimation
              ){
            return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
            );
          },
          child: _pageList[controller.tabIndex.value] /// !Entry point
        ),
        bottomNavigationBar: BottomNavigationBar(
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
