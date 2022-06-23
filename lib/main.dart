import 'package:flutter/material.dart';
import 'package:scope_model/service_locator.dart';
import 'package:scope_model/ui/home_view.dart';
import 'package:scoped_model/scoped_model.dart';

import 'homepage.dart';
import 'model.dart';

void main() {
  setUplocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<Cart>(
      model: Cart(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView(),
      ),
    );
  }
}
