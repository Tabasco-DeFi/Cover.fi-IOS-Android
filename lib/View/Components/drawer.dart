import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.green[300]
                ),
                child: const Text("Drawer Header")
            ),
            ListTile(
              title: const Text("About"),
              onTap: (){
                // Go to Borrow page
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Borrow"),
              onTap: (){
                // Go to Borrow page
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Lend"),
              onTap: (){
                // Got to Lending page
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Dashboard"),
              onTap: (){
                // Go to Dashboard
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
