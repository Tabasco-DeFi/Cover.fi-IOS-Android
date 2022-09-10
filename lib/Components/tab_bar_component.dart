import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coverfi_flutter/Tabs/recent_trending_dashboard.dart';
import 'package:coverfi_flutter/Tabs/borrowing_dashboard.dart';
import 'package:coverfi_flutter/Tabs/lending_dashboard.dart';

class TabBarComponent extends StatelessWidget {
  const TabBarComponent({Key? key}) : super(key: key);
  final List<List> tabOptions = const [
    ["Recent", RecentTrendDashboard()],
    ["Lending", LendingDashboard()],
    ["Borrowing", BorrowingDashboard()],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          indicatorWeight: 2.0,
          indicatorColor: Colors.black,
          labelColor: Colors.deepPurple,
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
          labelStyle: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.bold
          ),
          tabs: <Widget>[
            Tab(child: Text(tabOptions[0][0])),
            Tab(child: Text(tabOptions[1][0])),
            Tab(child: Text(tabOptions[2][0])),
          ],
        ),
        Expanded(
            child: TabBarView(
              children: <Widget>[
                tabOptions[0][1],
                tabOptions[1][1],
                tabOptions[2][1],
              ],
          )
        )
      ],
    );
  }
}
