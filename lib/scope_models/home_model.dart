import 'package:scope_model/service_locator.dart';
import 'package:scope_model/services/storage_service.dart';
import 'package:scope_model/view_state/view.dart';
import 'package:scoped_model/scoped_model.dart';

class homeModel extends Model {
  List cartItems = [];

  addtoCart() {
    cartItems.add(2);
    print(cartItems);
    notifyListeners();
  }

  String title = 'hello Everybody';
  StorageService storageService = StorageService();
  ViewState state = ViewState.busy;

  Future saveData() async {
    setState(ViewState.busy);
    title = 'hello buddy';
    await locator<StorageService>().saveData();
    title = 'hello macha';
    setState(ViewState.retreived);
  }

  void setState(ViewState newState) {
    state = newState;
    notifyListeners();
  }
}
