import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// Controller
import 'package:coverfi_flutter/Controller/borrow_state_controller.dart';

class BorrowSummaryPage extends StatelessWidget {
  BorrowSummaryPage({Key? key}) : super(key: key);
  final borrowStateController = Get.find<BorrowStateController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Center(
            child: Text("${borrowStateController.loanCurrency.value} Borrow Summary Page")
        ),
      ),
    );
  }

  // Stepper getStepper(){}
}
