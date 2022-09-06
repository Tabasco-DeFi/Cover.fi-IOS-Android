import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BorrowStateController extends GetxController{
  // BorrowSummaryPage - State
  RxInt step = 0.obs;
  List<bool> isCompleted = List<bool>.filled(10, false, growable: false);

  updateStep(int _step) {
    step.value = _step;
  }
  updateCompletedStep(int index){
    isCompleted[index] = true;
  }



  // BorrowPage - State
  RxString loanCurrency = "".obs;
  RxInt targetLoanAmount = 0.obs;
  RxInt loanTenor = 0.obs;
  RxString collateralType = "".obs;
  RxInt subscriptionPeriod = 0.obs;
  // subscription start date
  // subscription end date
  RxDouble lowerProtectionRange = 0.0.obs;
  RxDouble upperProtectionRange = 0.0.obs;
  RxDouble loanRate = 0.0.obs;
  RxInt repaymentAmount = 0.obs;
  RxInt collateralAmount = 0.obs;

  // Borrowing status
  RxBool isFillingBorrowForm = false.obs;

  // BorrowPage - Form - State
  Rx<TextEditingController> textEditingController = TextEditingController().obs;

  updateLoanCurrency(String stableCoin){
    loanCurrency.value = stableCoin;
  }

  updateIsFillingBorrowForm(){
    isFillingBorrowForm.value = !isFillingBorrowForm.value;
  }
}