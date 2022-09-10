// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller
import 'package:coverfi_flutter/Controller/borrow_state_controller.dart';
import 'package:coverfi_flutter/View/new_borrow_stepper_page.dart';

// Views
import 'package:coverfi_flutter/View/borrow_summary_page.dart';

class BorrowPage extends StatelessWidget {
  BorrowPage({Key? key}) : super(key: key);
  final _textController = TextEditingController();
  final borrowStateController = Get.find<BorrowStateController>();

  String userInput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          title: Text("Borrow"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getStableCoinWidgets(context, "USDT"),
            getStableCoinWidgets(context, "USDC"),
            getStableCoinWidgets(context, "DAI"),

          ],
        ),
      ),
    );
  }

  Flexible getStableCoinWidgets(BuildContext context, String stableCoin){
    return Flexible(
        flex: 3,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: (){
              borrowStateController.isFillingBorrowForm();
              borrowStateController.updateLoanCurrency(stableCoin);
              borrowStateController.updateCompletedStep(0); // Selected Stablecoin
              Get.to(BorrowStepsPage());
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Card(
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: Image.asset(
                            stableCoin == "USDT" ?
                            "assets/images/usdt.png" :
                            stableCoin == "USDC" ?
                            "assets/images/usdc.png" :
                            "assets/images/dai.png",
                          )
                      ),
                      const SizedBox(height: 10),
                      Text(
                          stableCoin == "USDT" ?
                          "USDT" :
                          stableCoin == "USDC" ?
                          "USDC" :
                          "DAI",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600)
                      ),
                    ],
                  )
              ),
            ),
          ),
        )
    );
  }
}