import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BorrowStateController extends GetxController{
  // BorrowPage - State
  RxString loanCurrency = "".obs;
  RxInt targetLoanAmount = 0.obs;
  RxInt loanTenor = 0.obs;
  RxInt subscriptionPeriod = 0.obs;
  // subscription start date
  // subscription end date
  RxString collateralCurrency = "".obs;
  RxDouble lowerProtectionRange = 0.0.obs;
  RxDouble upperProtectionRange = 0.0.obs;
  RxDouble loanRate = 0.0.obs;
  RxInt repaymentAmount = 0.obs;
  RxInt collateralAmount = 0.obs;

  // BorrowPage - Form - State
  Rx<TextEditingController> textEditingController = TextEditingController().obs;
}