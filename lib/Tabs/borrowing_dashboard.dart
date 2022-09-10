import 'package:coverfi_flutter/Controller/borrow_state_controller.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
// Models
import 'package:coverfi_flutter/Model/mock_borrow.dart';
import 'package:flutter/services.dart';

class BorrowingDashboard extends StatefulWidget {
  const BorrowingDashboard({Key? key}) : super(key: key);

  @override
  State<BorrowingDashboard> createState() => _BorrowingDashboardState();
}

class _BorrowingDashboardState extends State<BorrowingDashboard> {
  final BorrowStateController stateController = Get.find<BorrowStateController>();

  @override
  void initState() {
    super.initState();
    final result = fetchData();
  }

  Future<List<MockBorrowModel>> fetchData() async {
    final String jsonData = await rootBundle.loadString("assets/json/mock_borrow_data.json");
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => MockBorrowModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: <Widget>[]
    );
  }

  List<Widget> getListItems() {
    List<Widget> listItems = [];
    var result = stateController.mockBorrowData;
    // print("Result is ${result.value}");

    // for(int i=0;i< result["data"].length; i++){
    //   String poolState = result["data"][i]["poolState"];
    //   int poolId = result["data"][i]["poolId"];
    //   String borrowerAddress = result["data"][i]["borrowerAddress"];
    //   String loanCurrency = result["data"][i]["loanCurrency"];
    //   int borrowAmount = result["data"][i]["borrowAmount"];
    //   int tenor = result["data"][i]["tenor"];
    //   String subscriptionStart = result["data"][i]["subscriptionStart"];
    //   String subscriptionEnd = result["data"][i]["subscriptionEnd"];
    //   String termStart = result["data"][i]["termStart"];
    //   String termEnd = result["data"][i]["termEnd"];
    //   int lowerBound = result["data"][i]["lowerBound"];
    //   int upperBound = result["data"][i]["upperBound"];
    //   int loanRate = result["data"][i]["loanRate"];
    //   int lenderCount = result["data"][i]["lenders"].length;
    //
    //   listItems.add(
    //       Padding(
    //         padding: const EdgeInsets.all(10),
    //         child: Container(
    //             height: 200,
    //             decoration: BoxDecoration(
    //                 color: Colors.purple[200],
    //                 borderRadius: BorderRadius.circular(10)
    //             ),
    //             child: Column(
    //               children: <Widget>[
    //                 Text("$poolId"),
    //                 Text(borrowerAddress),
    //                 Text("$borrowAmount"),
    //               ],
    //             )
    //         ),
    //       )
    //   );
    // }

    print("complete");
    return listItems;
  }


}


