import 'package:coverfi_flutter/Model/mock_borrow.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BorrowStateController extends GetxController{
  /// BorrowSummaryPage - State

  // Current Step
  RxInt step = 0.obs;
  // List to check if the selected step is completed
  List<bool> isCompleted = List<bool>.filled(10, false, growable: false);

  updateStep(int _step) {
    step.value = _step;
  }
  updateCompletedStep(int index){
    isCompleted[index] = true;
  }

  // Borrow Input Page
  Map<int, bool> inputIsInitialized = <int, bool>{}.obs;
  Map<int, String> userInput = <int, String>{}.obs;
  Map<int, TextEditingController> userTextController = <int, TextEditingController>{}.obs;

  initializeUserInput(int idx) {
    inputIsInitialized[idx] = true;
    userInput[idx] = "";
    userTextController[idx] = TextEditingController();
  }
  updateUserInput(int index, String value){
    userInput[index] = value;
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
