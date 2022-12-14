import 'package:get/get.dart';

// Views
import 'package:coverfi_flutter/View/home_page.dart';
import 'package:coverfi_flutter/View/metamask_page.dart';
import 'package:coverfi_flutter/View/borrow_summary_page.dart';
import 'package:coverfi_flutter/View/borrow_input_page.dart';
import 'package:coverfi_flutter/View/new_borrow_stepper_page.dart';

appRoutes() => [
      GetPage(
        name: '/homePage',
        page: () => const HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: "/metamask",
        page: () => MetaMaskWidget(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: "/borrowPage",
        page: () => BorrowStepsPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500)
      ),
      GetPage(
          name: "/borrowInputPage",
          page: () => const BorrowInputPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500)
      )
    ];
