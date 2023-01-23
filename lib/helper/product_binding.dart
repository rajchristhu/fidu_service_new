
import 'package:get/get.dart';

import '../core/view_model/auth_view_model.dart';
import '../core/view_model/control_view_model.dart';
import '../core/view_model/home_view_model.dart';
import '../core/view_model/product_view_model.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductViewmodel());
  }
}
