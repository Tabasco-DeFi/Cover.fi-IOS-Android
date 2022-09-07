import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class MetaMaskWidget extends StatelessWidget {
  MetaMaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          title: const Text("Wallet"),
        ),
      ),
      body: SafeArea(
        bottom: true,
        top: true,
        child: Center(
          // color: Colors.green[300],
          child: Column(
            children: [
              Image(
                image: const AssetImage("assets/images/wallet.png"),
                semanticLabel: "Wallet",
                // height: 220,
                height: MediaQuery.of(context).size.height * 0.23,
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: const Text(
                    "Your crypto wallet securely stores your\n "
                    "digital goods and cryptocurrencies. \n"
                    "Connect to one of our wallet provider\n"
                    "or create a new wallet",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.012),
              ListView.builder(
                  padding: const EdgeInsets.all(13.0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> titles = [
                      "Metamask",
                      "Ledger",
                      "Phantom",
                      "Coinbase Wallet"
                    ];
                    List<String> icons = [
                      "metamask_32",
                      "metamask_32",
                      "metamask_32",
                      "coinbase_32"
                    ];
                    return Card(
                      child: ListTile(
                        leading: Image(
                          image: AssetImage("assets/images/${icons[index]}.png"),
                        ),
                        title: Text(titles[index],
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        onTap: () {},
                      ),
                    );
                  },
                  itemCount: 4),
            ],
          ),
        ),
      ),
    );
  }
}
