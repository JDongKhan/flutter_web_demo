import 'package:flutter/material.dart';

import 'utils/my_route_information_parser.dart';
import 'utils/my_router_delegate.dart';

BookRouterDelegate delegate = BookRouterDelegate();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint('MyApp build');
    return MaterialApp.router(
      title: 'Navigator 2.0',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: delegate,
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}
