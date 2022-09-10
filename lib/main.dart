// Package
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Controller
import 'package:coverfi_flutter/Controller/accessibility_state_controller.dart';
import 'package:coverfi_flutter/Controller/dashboard_state_controller.dart';
import 'package:coverfi_flutter/Controller/borrow_state_controller.dart';

// Routes
import 'main_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.orange,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(131, 74, 200, 1),
            brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)
        // brightness: Brightness.dark,
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/homePage",
      getPages: appRoutes(),
      initialBinding: InitialBindings(),
    );
  }
}

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AccessibilityStateController>(AccessibilityStateController());
    Get.put<DashboardStateController>(DashboardStateController());
    Get.put<BorrowStateController>(BorrowStateController());
  }
}
