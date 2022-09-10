import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coverfi_flutter/Components/borrow_input_component.dart';
import 'package:coverfi_flutter/Components/stepper_component.dart';

class BorrowInputPage extends StatelessWidget {
  const BorrowInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          title: const Text("Borrow"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index){
                        final List<String> titles = [
                          "Stablecoin Type",
                          "Target Loan Amount" ,
                          "Tenor" ,
                          "Collateral Type" ,
                          "Subscription Period" ,
                          "Lower Bound" ,
                          "Upper Bound" ,
                          "Loan Rate",
                          "Repayment Amount" ,
                          "Collateral Amount"
                        ];
                        return GestureDetector(
                          onTap: (){
                          },
                          child: Card(
                            elevation: 10,
                            child: SizedBox(
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        titles[index],
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontWeight: FontWeight.bold)
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          const Center(child: Text("Info"))
        ],
      ),
    );
  }

  List<Widget> addBorrowInputComponents(){
    List<Widget> borrowComponents = <Widget>[];
    for(int i = 0; i < 9; i++){
      borrowComponents.add(BorrowInputComponent(idx: i));
    }
    return borrowComponents;
  }
}
