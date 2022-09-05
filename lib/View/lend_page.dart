import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LendPage extends StatelessWidget {
  LendPage({Key? key}) : super(key: key);

  final _textController = TextEditingController();
  String userInput = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          getStableCoinWidgets(context, "USDT"),
          getStableCoinWidgets(context, "USDC"),
          getStableCoinWidgets(context, "DAI"),

        ],
      ),
    );
  }

  Flexible getStableCoinWidgets(BuildContext context, String stableCoin){
    return Flexible(
        flex: 3,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(20.0),
          // color: stableCoin == "USDT" ?
          //   Colors.green[300] :
          //   stableCoin == "USDC" ?
          //     Colors.blue[400] :
          //     Colors.orange[300],
          child: GestureDetector(
            onTap: (){},
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Card(
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: Image.asset(
                            stableCoin == "USDT" ?
                            "assets/images/usdt.png" :
                            stableCoin == "USDC" ?
                            "assets/images/usdc.png" :
                            "assets/images/dai.png",
                          )
                      ),
                      SizedBox(height: 10),
                      Text(
                          stableCoin == "USDT" ?
                          "USDT" :
                          stableCoin == "USDC" ?
                          "USDC" :
                          "DAI",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600)
                      ),
                    ],
                  )
              ),
            ),
          ),
        )
    );
  }
}