import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.green[300]
              ),
              child: const Center(child: Text("Cover.Fi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),))
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
    );
  }
}