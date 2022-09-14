import 'package:animations/animations.dart';
import 'package:coverfi_flutter/Controller/lend_state_controller.dart';
import 'package:coverfi_flutter/View/dashboard_lend_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

class LendingDashboard extends StatefulWidget {
  const LendingDashboard({Key? key}) : super(key: key);

  @override
  State<LendingDashboard> createState() => _LendingDashboardState();
}

class _LendingDashboardState extends State<LendingDashboard> {
  final LendStateController stateController = Get.find<LendStateController>();
  final ContainerTransitionType _containerTransitionType = ContainerTransitionType
      .fadeThrough;
  late Future<List<dynamic>> _lendData;

  Future<List<dynamic>> fetchData() async {
    final String jsonData = await rootBundle.loadString(
        "assets/json/mock_lend_data.json");
    final result = json.decode(jsonData);
    return result;
  }

  @override
  void initState() {
    super.initState();
    _lendData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _lendData,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text("Error");
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                      children: getLendingDashboard(snapshot.data)
                  )
                  )
                );
            } else {
              return const Text("Empty Data");
            }
          } else {
            return Text("State: ${snapshot.connectionState}");
          }
        }
    );
  }

  List<Widget> getLendingDashboard(List<dynamic>? data) {
    // Initialize Period
    stateController.initializePeriod(data!);

    List<Widget> listItems = <Widget>[];

    for (int i = 0; i < data.length; i++) {
      listItems.add(
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 400,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: OpenContainer(
                  tappable: false,
                  closedColor: Colors.transparent,
                  transitionType: _containerTransitionType,
                  transitionDuration: const Duration(milliseconds: 500),
                  openBuilder: (BuildContext context,
                      void Function({Object? returnValue}) action) => LendCardDetailsComponent(data: data, index: i),
                  closedBuilder: (
                      BuildContext context, VoidCallback openContainer) =>
                      getLendingSummaryWidget(data[i], i, openContainer)
              ),
            ),
          )
      );
    }
    return listItems;
  }

  Card getLendingSummaryWidget(dynamic data, int currencyIndex, VoidCallback openContainer) {
    return Card(
      elevation: 4,
      color: data["currency"] == "USDT"
          ? Colors.greenAccent[100]
          : (data["currency"] == "USDC" ?
            Colors.blueAccent[100] :
            Colors.yellowAccent[100]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text(
                  data["currency"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  )
              ),
            ),
            const SizedBox(height: 15),
            const Text("Period", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                for(int i = 0; i < data["period"].length; i++)
                  Obx(() => ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: stateController.selected[currencyIndex]![i] == true ?
                          MaterialStateProperty.all(Colors.pink):
                          MaterialStateProperty.all(Colors.white)
                          ,
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              )
                          )
                      ),
                      onPressed: () {
                        if(stateController.checkSelected(currencyIndex) == -1){
                          // previously Not selected
                          stateController.updateSelected(currencyIndex, i, data["period"][i]);
                        } else {
                          // previously selected
                          stateController.updateSelected(currencyIndex, stateController.selected[currencyIndex]!.toList().indexOf(true), data["period"][i]);
                          stateController.updateSelected(currencyIndex, i, data["period"][i]);
                        }
                      },
                      child: Text(data["period"][i], style: const TextStyle(fontWeight: FontWeight.w600))
                  ))

              ]
            ),
            const SizedBox(height: 15),
            Text("Est. APR ${data["apr"]}", style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 15),
            Text("Completion: ${data["quota"]}/${data["maximum"]} ${data["currency"]}"),
            LinearProgressIndicator(
              value: data["quota"]/data["maximum"],
              color: Colors.pink,
            ),
            const SizedBox(height: 15),
            ElevatedButton(onPressed: (){
              openContainer();
            },
            child: const Text("Subscribe"))
          ],
        ),
      ),
    );
  }
}
