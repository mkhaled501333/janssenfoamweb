import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:janssenfoamweb/foam/customers/Customer_controller.dart';
import 'package:janssenfoamweb/foam/widgits/blocks/blockFirebaseController.dart';
import 'package:janssenfoamweb/foam/widgits/cars/biscol.dart';
import 'package:janssenfoamweb/foam/widgits/finalproduct/final_product_controller.dart';
import 'package:janssenfoamweb/foam/widgits/login/loginController.dart';
import 'package:janssenfoamweb/foam/widgits/login/loginPage.dart';
import 'package:janssenfoamweb/foam/widgits/orders/Order_controller.dart';
import 'package:janssenfoamweb/foam/widgits/orders/cuttingOrders.dart';
import 'package:provider/provider.dart';

String usermame = "";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          databaseURL: "https://janson-11f24-default-rtdb.firebaseio.com",
          apiKey: "AIzaSyAkWHl9E0KfHcvf5Ifx0WVvEXuvk2URhhs",
          appId: "1:106186917009:android:fcd892c86b7d3e3447ab30",
          messagingSenderId: "106186917009",
          projectId: "janson-11f24"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OrderController(),
        ),
        ChangeNotifierProvider(
          create: (context) => final_prodcut_controller(),
        ),
        ChangeNotifierProvider(
          create: (context) => Customer_controller(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Carscontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => BlockFirebasecontroller(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'janssen Dashboard',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Builder(builder: (context) {
          // context.read<BlockFirebasecontroller>().getData();
          // context.read<Carscontroller>().getdata();
          // context.read<final_prodcut_controller>().getData();
          context.read<OrderController>().getData();
          context.read<Customer_controller>().getData();
          // context.read<IndusterialSecuritycontroller>().getdata();
          return Scaffold(
            body: Consumer<LoginController>(
              builder: (context, myType, child) {
                return myType.loggedIn == false
                    ? LoginPage()
                    : StatisticsCuttingOrders();
              },
            ),
          );
        }),
      ),
    );
  }
}
