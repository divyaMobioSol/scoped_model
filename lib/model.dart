import 'package:scoped_model/scoped_model.dart';

class Cart extends Model {
  List cartItems = [];

  addtoCart() {
    cartItems.add(2);
    notifyListeners();
  }
}
