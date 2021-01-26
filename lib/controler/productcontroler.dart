import 'package:api_getx/apiservices/fetchapi.dart';
import 'package:api_getx/models/products.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
