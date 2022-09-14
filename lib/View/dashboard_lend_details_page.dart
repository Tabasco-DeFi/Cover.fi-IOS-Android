import 'package:coverfi_flutter/Controller/lend_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LendCardDetailsComponent extends StatelessWidget {
  LendCardDetailsComponent({Key? key, required this.data, required this.index}) : super(key: key);
  final dynamic data;
  final int index;
  final LendStateController stateController = Get.find<LendStateController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${data[index]["currency"]} ${stateController.selectedDay[index]}"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0,1],
                      colors: data[index]["currency"] == "USDT"?
                      [Color(0xfffceabb), Color(0xFF69F0AE)]:
                      data[index]["currency"] == "USDC"?
                      [Color(0xfffceabb), Color(0xFF82B1FF)]: [Color(0xfffceabb), Color(0xFFFFF8D)]
                  ),
                ),
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: <Widget>[
                  getRow("Asset", data[index]["currency"]),
                  getRow("Portfolio Allocation", data[index]["allocation"]),
                  getRow("Term Start", data[index]["termStart"]),
                  getRow("Term Start", calculateDate(data[index]["termStart"])),
                  getRow("Estimated APR", data[index]["apr"]),
                  getRow("Estimated Reward", data[index]["reward"][stateController.selectedIndex[index]])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String calculateDate(String date) {
    int day = int.parse(date.split("/")[0]);
    int month = int.parse(date.split("/")[1]);
    int year = int.parse(date.split("/")[2]);
    int endingPeriod = int.parse(stateController.selectedDay[index]!.split(" ")[0]);
    var endingDate = DateTime(year, month, day).add(Duration(days: endingPeriod));
    return "${endingDate.day.toString()}/${endingDate.month.toString()}/${endingDate.year.toString()}";
  }

  Widget getRow(String item, dynamic value){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("$item", style: const TextStyle(fontWeight: FontWeight.bold)),
          Text("$value")
        ],
      ),
    );
  }
}
