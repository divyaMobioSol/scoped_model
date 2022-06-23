import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model.dart';

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);

  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      
      body: Center(child: ScopedModelDescendant<Cart>(
        builder: ((context, child, model) {
          return Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(model.cartItems.length.toString()),
              SizedBox(
                height: 30,
              ),
              FloatingActionButton(
                onPressed: () {
                  model.addtoCart();
                },
                child: Icon(Icons.add),
              )
            ],
          );
        }),
      )),
    );
  }
}
