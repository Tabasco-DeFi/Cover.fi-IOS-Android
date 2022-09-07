import 'package:coverfi_flutter/Controller/borrow_state_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Controllers
import 'package:coverfi_flutter/Controller/borrow_state_controller.dart';

class BorrowInputComponent extends StatefulWidget {
  const BorrowInputComponent({Key? key, required this.idx}) : super(key: key);
  final int idx;
  @override
  State<BorrowInputComponent> createState() => _BorrowInputComponentState();
}

class _BorrowInputComponentState extends State<BorrowInputComponent> {
  final BorrowStateController borrowStateController = Get.find<BorrowStateController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          /// Switch on the selected input form
          getQuestionComponent(),
          getTextFieldComponent(),
          // getSubmitButtonComponent(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }

  Obx getQuestionComponent(){
    return Obx(() => Flexible(
        flex: 5,
        fit: FlexFit.tight,
        child: Center(
            child: Text(
                borrowStateController.userInput[widget.idx] ?? "",
                style: const TextStyle(fontSize: 35)
            )
        )
    ));
  }

  Obx getTextFieldComponent(){
    return Obx(() => Flexible(
      flex: 3,
      child: TextField(
        controller: borrowStateController.userTextController[widget.idx]?.value,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: "Amount of USDT to Borrow",
          suffixIcon: IconButton(
            onPressed: (){
              borrowStateController.userTextController[widget.idx]?.value.clear();
            },
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
    )
    );
  }

  Obx getSubmitButtonComponent() {
    return Obx(() => Flexible(
      flex: 1,
      child: SizedBox(
        child: CupertinoButton(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
          onPressed: (){
            borrowStateController.updateUserInput(
                widget.idx,
                borrowStateController.userTextController[widget.idx]?.value.text ?? ""
            );
            borrowStateController.userTextController[widget.idx]?.value.clear();
          },
          color: Colors.purple[300],
          child: const Text("Submit"),
        ),
      ),
    ));
  }
}
