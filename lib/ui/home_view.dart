import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scope_model/scope_models/home_model.dart';
import 'package:scope_model/service_locator.dart';
import 'package:scope_model/view_state/view.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<homeModel>(
        model: locator<homeModel>(),
        child: ScopedModelDescendant<homeModel>(
          builder: ((context, child, model) {
            return Scaffold(
                floatingActionButton: FloatingActionButton(onPressed: () {
                  model.saveData();
                }),
                body: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      _getUIbody(model.state),
                      SizedBox(
                        height: 50,
                      ),
                      Text(model.title),
                    ],
                  ),
                ));
          }),
        ));
  }

  Widget _getUIbody(ViewState state) {
    switch (state) {
      case ViewState.busy:
        return CircularProgressIndicator();

      case ViewState.retreived:
      default:
        return Text('done');
    }
  }
}
