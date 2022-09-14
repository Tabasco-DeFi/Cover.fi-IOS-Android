import 'package:flutter/material.dart';

class CardDetailsComponent extends StatelessWidget {
  CardDetailsComponent({Key? key, required this.data}) : super(key: key);
  dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Borrow Pool ${data["poolId"]}"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 10,
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: data["loanCurrency"] == "USDT" ?
                    Colors.greenAccent[100]:
                    (data["loanCurrency"] == "USDC" ? Colors.blueAccent[100]: Colors.yellowAccent[100])
                ),
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    getRow("Pool ID", data["poolId"]),
                    getRow("Loan Currency", data["loanCurrency"]),
                    getRow("Borrow Amount", data["borrowAmount"]),
                    getRow("Tenor", data["tenor"]),
                    getRow("Subscription Start", data["subscriptionStart"]),
                    getRow("Subscription End", data["subscriptionEnd"]),
                    getRow("Term Start", data["termStart"]),
                    getRow("Term End", data["termEnd"]),
                    getRow("Collateral Currency", data["collateralCurrency"]),
                    getRow("Lower Boundary(%)", data["lowerBound"]),
                    getRow("Upper Boundary(%)", data["upperBound"]),
                    getRow("Loan Rate(%)", data["loanRate"]),
                    getRow("Repayment Amount", data["repaymentAmount"]),
                    getRow("Collateral Amount", data["collateralAmount"]),
                  ],
                )
            ),
          )
        ),
      ),
    );
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
