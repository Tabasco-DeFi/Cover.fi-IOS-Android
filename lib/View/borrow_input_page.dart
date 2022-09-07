import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coverfi_flutter/Components/borrow_input_component.dart';

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
      body: BorrowInputComponent(idx: 1)
      // Column(
      //   children: <Widget>[
      //     BorrowInputComponent(idx: 0)
      //   ],
      // ),
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
