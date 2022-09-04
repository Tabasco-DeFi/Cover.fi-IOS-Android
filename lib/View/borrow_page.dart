import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coverfi_flutter/Controller/borrow_state_controller.dart';

class BorrowPage extends StatefulWidget {
  const BorrowPage({Key? key}) : super(key: key);

  @override
  State<BorrowPage> createState() => _BorrowPageState();
}

class _BorrowPageState extends State<BorrowPage> {
  final stateController = Get.find<BorrowStateController>();
  final List<String> _currencies = ["USDC", "USDT", "DAI"];

  // @override
  // void dispose() {
  //   super.dispose();
  //   stateController.textEditingController.value.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text("Loan Currency"),
            DropdownButton<String>(
              onChanged: (String? value) {},
              value: _currencies[0],
              items: _currencies.map((String currency) {
                return DropdownMenuItem<String>(
                    value: currency, child: Text(currency));
              }).toList(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text("Target Loan Amount"),
            // Flexible(
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.height * 0.15,
            //     child: TextField(
            //       obscureText: true,
            //       decoration: const InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: "Loan Amount"
            //       ),
            //       controller: stateController.textEditingController.value,
            //       onSubmitted: (String value){
            //         print(value);
            //       },
            //     ),
            //   ),
            // )
          ],
        )
      ],
    );
  }
}



