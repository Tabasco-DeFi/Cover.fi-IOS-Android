import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorrowStepsPage extends StatelessWidget {
  const BorrowStepsPage({Key? key}) : super(key: key);

  /// 1. Search Token 2. [Borrow|Repay] 3. Borrow Duration
  /// 4. Borrow Amount 5. Borrow Rates 6. Required Collateral
  /// 7. Collateral Currency 8. Protection Layer 9. Generate Pool
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Borrow Summary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: createStepper(context),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: 60,
                  child: Container(
                    color: Colors.greenAccent,
                    child: const Center(child: Text("Test")),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> createStepper(BuildContext context){
    List<Widget> stepperItems = <Widget>[];
    final List<String> stepperIcons = <String>["one","two","three","four","five","six","seven","eight","nine"];

    for(int idx = 0; idx < 9; idx++){
      if(idx != 8){
        stepperItems.add(stepperImage(context,idx, stepperIcons[idx]));
        stepperItems.add(stepperContainer());
      } else {
        stepperItems.add(stepperImage(context,idx, stepperIcons[idx]));
      }
    }
    return stepperItems;
  }

  GestureDetector stepperImage(BuildContext context, int idx, String number){
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.03,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Image(
          image: AssetImage("assets/icons/$number.png"),
          color: Colors.white,
        ),
      ),
    );
  }

  Padding stepperContainer(){
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.purple[300],
              border: Border(
                  left: BorderSide(
                      color: Colors.grey[900]!,
                      width: 1
                  )
              )
          ),
          child: const SizedBox(height: 40)
      ),
    );
  }
}
