import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert'; // Used to get JSON functions

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  return Card(
                      elevation: 10,
                      child: SizedBox(
                        width: 150,
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("\$${values[index]}")
                          ],
                        ),
                      ));
                },
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        const Center(child: Text("Info"))
      ],
    );
  }
}
