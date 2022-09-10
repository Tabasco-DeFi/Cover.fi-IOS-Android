import 'package:coverfi_flutter/Controller/borrow_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepperComponent extends StatelessWidget {
  StepperComponent({Key? key}) : super(key: key);
  final BorrowStateController borrowStateController = Get.find<BorrowStateController>();
  @override
  Widget build(BuildContext context) {
    return Stepper(
        type: StepperType.horizontal,
        physics: const ScrollPhysics(),
        elevation: 10,
        currentStep: borrowStateController.step.value,
        onStepTapped: (index){
          borrowStateController.updateStep(index);
          // Get.to(()=>BorrowInputPage());
        },
        onStepCancel: (){
          if(borrowStateController.step.value != 0){
            borrowStateController.step.value--;
          }
        },
        onStepContinue: (){
          if(borrowStateController.step.value != 9){
            borrowStateController.step.value++;
          }
        },
        controlsBuilder: _createEventControlBuilder,
        steps: stepCreator(),
    );
  }
  Widget _createEventControlBuilder(BuildContext context, ControlsDetails details) {
    return SingleChildScrollView(
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
                onPressed: (){},
                child: const Text("Previous")
            ),
            TextButton(
                onPressed: (){},
                child: const Text("Next")
            )
          ]
      ),
    );
  }

  List<Step> stepCreator(){
    final steps = {
      "Stablecoin Type" : borrowStateController.loanCurrency.value,
      "Target Loan Amount" : borrowStateController.targetLoanAmount.value,
      "Tenor" : borrowStateController.loanTenor.value,
      "Collateral Type" : borrowStateController.collateralType.value,
      "Subscription Period" : borrowStateController.subscriptionPeriod.value,
      "Lower Bound" : borrowStateController.lowerProtectionRange.value,
      "Upper Bound" : borrowStateController.upperProtectionRange.value,
      "Loan Rate" : borrowStateController.loanRate.value,
      "Repayment Amount" : borrowStateController.repaymentAmount.value,
      "Collateral Amount" : borrowStateController.collateralAmount.value
    };
    List<Step> result = <Step>[];
    for(var i=0; i<steps.length; i++){
      result.add(
          Step(
            // isActive: borrowStateController.step.value >= i,
              isActive: borrowStateController.isCompleted[i],
              title: Text(
                steps.keys.toList()[i],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Text(
                "${steps.values.toList()[i]}",
                style: const TextStyle(fontSize: 15),
              )
          )
      );
    }
    return result;
  }

}
