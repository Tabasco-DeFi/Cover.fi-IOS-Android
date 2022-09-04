import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LendPage extends StatefulWidget {
  const LendPage({Key? key}) : super(key: key);

  @override
  State<LendPage> createState() => _LendPageState();
}

class _LendPageState extends State<LendPage> {
  final _textController = TextEditingController();
  String userInput = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          getQuestionComponent(context),
          getTextFieldComponent(context),
          getSubmitButtonComponent(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }

  Flexible getQuestionComponent(BuildContext context){
    return Flexible(
        flex: 5,
        fit: FlexFit.tight,
        child: Center(
            child: Text(
                userInput,
                style: TextStyle(fontSize: 35)
            )
        )
    );
  }

  Flexible getTextFieldComponent(BuildContext context){
    return Flexible(
      flex: 3,
      child: TextField(
        controller: _textController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: "Amount of USDT to Borrow",
          suffixIcon: IconButton(
            onPressed: (){
              _textController.clear();
            },
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
    );
  }

  Flexible getSubmitButtonComponent(BuildContext context) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        child: CupertinoButton(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
          onPressed: (){
            setState(() {
              userInput = _textController.text;
              _textController.clear();
            });
          },
          color: Colors.purple[300],
          child: const Text("Submit"),
        ),
      ),
    );
  }
}
