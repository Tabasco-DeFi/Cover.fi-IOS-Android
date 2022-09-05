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
  final List<String> _tenors = ["1 Month", "3 Month", "6 Month"];
  final List<String> _collateralCurrency = ["BTC", "ETH", "SOL", "BNB"];

  // @override
  // void dispose() {
  //   super.dispose();
  //   stateController.textEditingController.value.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
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
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text("Target Loan Amount"),
              Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.15,
                  child: TextField(
                    // obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Loan Amount"
                    ),
                    controller: stateController.textEditingController.value,
                    onSubmitted: (String value){},
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text("Tenor"),
              DropdownButton<String>(
                onChanged: (String? value) {},
                value: _tenors[0],
                items: _tenors.map((String currency) {
                  return DropdownMenuItem<String>(
                      value: currency, child: Text(currency));
                }).toList(),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text("Collateral Currency"),
              DropdownButton<String>(
                focusColor: Colors.purple[300],
                onChanged: (String? value) {},
                value: _collateralCurrency[0],
                items: _collateralCurrency.map((String currency) {
                  return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency)
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text("Protection Layer"),
              Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.15,
                  child: TextField(
                    // obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Lower Bound"
                    ),
                    controller: stateController.textEditingController.value,
                    onSubmitted: (String value){},
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.15,
                  child: TextField(
                    // obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Upper Bound"
                    ),
                    controller: stateController.textEditingController.value,
                    onSubmitted: (String value){},
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text("Loan Rate"),
              Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.15,
                  child: TextField(
                    // obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Loan Amount"
                    ),
                    controller: stateController.textEditingController.value,
                    onSubmitted: (String value){},
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text("Repayment Amount"),
              Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.15,
                  child: TextField(
                    // obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Loan Amount"
                    ),
                    controller: stateController.textEditingController.value,
                    onSubmitted: (String value){},
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text("Collateral Amount"),
              Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.15,
                  child: TextField(
                    // obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Loan Amount"
                    ),
                    controller: stateController.textEditingController.value,
                    onSubmitted: (String value){},
                  ),
                ),
              )
            ],
          ),
        ),

      ],
    );
  }
}



