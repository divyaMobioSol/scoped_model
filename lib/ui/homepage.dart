import 'package:flutter/material.dart';

import 'package:scope_model/scope_models/home_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../view_state/view.dart';

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);

  // Cart cart = Cart();
  homeModel model = homeModel();

  bool isCart = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<homeModel>(
      builder: ((context, child, model) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Scoped Model'),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    isCart = false;
                    model.saveData();
                  },
                  child: const Icon(Icons.update),
                ),
                FloatingActionButton(
                  onPressed: () {
                    isCart = true;
                    model.addtoCart();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            body: isCart ? cartData(model) : updateData(model));
      }),
    );
  }

  Center cartData(homeModel model) {
    return Center(
        // ignore: sized_box_for_whitespace
        child: Container(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.cartItems.length.toString(),
            style: TextStyle(fontSize: 20),
          ),
          Flexible(
            child: Text(
              model.cartItems.toList().toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    ));
  }

  Center updateData(homeModel model) {
    return Center(
      child: SizedBox(
        height: 70,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getUIbody(model.state),
            Text(
              model.title,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  _getUIbody(ViewState state) {
    switch (state) {
      case ViewState.busy:
        return CircularProgressIndicator();

      case ViewState.retreived:
      default:
        return Text('done');
    }
  }
}
