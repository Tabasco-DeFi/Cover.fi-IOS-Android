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
  late Future<List<dynamic>> _borrowerData;

  Future<List<dynamic>> fetchData() async {
    final String jsonData = await rootBundle.loadString("assets/json/mock_borrow_data.json");
    final result = json.decode(jsonData); // List<dynamic>
    return result;
  }

  @override
  void initState() {
    super.initState();
    _borrowerData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // The fetchData() will be called each time the widget is reconstructed.
      // Should be used to fetch data from blockchain later on
      // If the fetchData() should be not be called every time, initialize the state using StatefulWidget [initState() | didChangeDependencies() | didUpdateWidget()]
      future: _borrowerData,
      // snapshot -> Most recent communication with future
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError) {
            return const Text("Error");
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: getListItems(snapshot.data),
              ),
            );
          } else {
            return const Text("Empty Data");
          }
        } else {
            return Text("State : ${snapshot.connectionState}");
        }
      },
      );
  }

  List<Widget> getListItems(List<dynamic>? data) {
    List<Widget> listItems = [];

    for(int i=0;i< data!.length; i++){
      listItems.add(
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: getCustomCard(data[i])

                ),
            ),
          )
      );
    }
    return listItems;
  }

  Card getCustomCard(dynamic data){
    return Card(
      elevation: 10,
      color: data["loanCurrency"] == "USDT" ?
        Colors.greenAccent[100]:
        (data["loanCurrency"] == "USDC" ? Colors.blueAccent[100]: Colors.yellowAccent[100]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Borrow Amount", style: TextStyle(color: Colors.black)),
                Image(
                  image: data["loanCurrency"] == "USDT" ?
                    const AssetImage("assets/images/usdt48.png"):
                    data["loanCurrency"] == "USDC" ?
                      const AssetImage("assets/images/usdc48.png"):
                      const AssetImage("assets/images/dai48.png")
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text("\$${data["borrowAmount"]} ${data["loanCurrency"]}", style: const TextStyle(color: Colors.black, fontSize: 24)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(filterWalletAddress(data["borrowerAddress"]), style: const TextStyle(color: Colors.black)),
                Row(
                  children: [
                    Column(children: const <Widget>[
                      Text("Valid", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                      Text("Thru", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12))
                    ]),
                    const SizedBox(width: 4),
                    Text("${data["subscriptionEnd"]}"),
                  ],
                )
              ],
            )

          ],
        ),
      ),
    );
  }

  String filterWalletAddress(String address){
    String firstDigits = address.substring(0,5);
    String trailingDigts = address.substring(address.length-5);
    return "$firstDigits******$trailingDigts";
  }
}


