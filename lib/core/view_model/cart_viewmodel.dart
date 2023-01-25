import 'package:get/get.dart';

import '../../model/cart_model.dart';
import '../service/local_database_cart.dart';

class CartViewModel extends GetxController {
  List<CartModel> _cartProducts = [];
  var checkBool = true.obs;

  List<CartModel> get cartProducts => _cartProducts;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  @override
  void onInit() {
    super.onInit();
    getCartProducts();
  }

  getCartProducts() async {
    _cartProducts = await LocalDatabaseCart.db.getAllProducts();
    print(_cartProducts);

    getTotalPrice();
    update();
  }

  changeStatus() {
    if (checkBool.isTrue) {
      checkBool.toggle();
    } else {
      checkBool.value = true; //or pressedBool.toggle();
    }
  }

  addProduct(CartModel cartModel) async {
    bool _isExist = false;
    _cartProducts.forEach((element) {
      if (element.productId == cartModel.productId) {
        _isExist = true;
        getCartProducts();
      }
    });
    if (!_isExist) {
      await LocalDatabaseCart.db.insertProduct(cartModel);
      getCartProducts();
    }
  }

  removeProduct(String productId) async {
    await LocalDatabaseCart.db.deleteProduct(productId);
    getCartProducts();
  }

  removeAllProducts() async {
    await LocalDatabaseCart.db.deleteAllProducts();
    getCartProducts();
  }

  getTotalPrice() {
    _totalPrice = 0;
    _cartProducts.forEach((cartProduct) {
      _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);
    });
  }

  increaseQuantity(cartProduct) async {
    cartProduct.quantity++;
    getTotalPrice();
    await LocalDatabaseCart.db.update(cartProduct);
    update();
  }

  decreaseQuantity(cartProduct) async {
    if (cartProduct.quantity != 0) {
      cartProduct.quantity--;
      getTotalPrice();
      await LocalDatabaseCart.db.update(cartProduct);
      update();
    }
  }
}
