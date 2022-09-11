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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(255, 255, 255, 0.5)),
          child: TabBar(
            indicator: CircleTabIndicator(color: const Color.fromRGBO(0, 0, 0, 0.5), radius: 4),
            indicatorWeight: 5.0,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
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

// TabIndicator -> Extends Decoration
class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;
  CircleTabIndicator({
    required Color color,
    required double radius
  }): _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius): _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg){
    final Offset circleOffset = offset + Offset(cfg.size!.width/2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}