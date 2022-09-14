import 'package:coverfi_flutter/Components/drawer.dart';
import 'package:coverfi_flutter/Components/tab_bar_component.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: AppBar(
            elevation: 0,
            title: const Text("Cover.Fi"),
            actions: <Widget>[
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.card_giftcard_rounded),
                tooltip: "Refer a friend",
              )
            ],

          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        final List<String> summaries = [
                          "Current TVL",
                          "Total Loans Originated",
                          "Total Protocol Revenue",
                          "Total Tokens Burned"
                        ];
                        final List<int> values = [10000, 20000, 30000, 40000];
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: 250,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        stops: [0,0.5,1],
                                        colors: [
                                          Color(0xD39557AA),
                                          Color(0x94FFAD00),
                                          Color(0xFFFDD531),
                                        ]
                                    ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        summaries[index],
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Text("\$${values[index]}")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ))
                ],
              ),
              const SizedBox(height: 10),
              const Expanded(
                child: TabBarComponent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
