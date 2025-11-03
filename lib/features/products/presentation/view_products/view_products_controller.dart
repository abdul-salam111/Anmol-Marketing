
import '../../../../core/barrel.dart';
import '../../../../core/shared/data/models/get_companies_model/get_companies_model.dart';

class ViewProductsController extends GetxController {
  // Fetch products by company id from api
  RxList<GetProductsModel> products = <GetProductsModel>[].obs;
  RxList<GetProductsModel> filteredProducts =
      <GetProductsModel>[].obs; // For search results
  late GetCompaniesModel company;
  RxString searchQuery = "".obs;
  RxBool isLoading = false.obs;

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      products.value = await ProductsRepository.getCompanyProducts(
        company.companyId!.toString(),
      );
      filteredProducts.assignAll(products);

      isLoading.value = false;
    } on InvalidAppToken {
      isLoading.value = true;

      final response = await AuthRepository.loginUser(
        LoginUserModel(
          loginId: await storage.readValues(StorageKeys.phoneNumber),
          password: await storage.readValues(StorageKeys.password),
        ),
      );
      await SessionController().saveUserInStorage(response);
      await SessionController().getUserfromSharedpref();

      products.value = await ProductsRepository.getCompanyProducts(
        company.companyId!.toString(),
      );
      filteredProducts.assignAll(products);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void searchProduct(String query) {
    searchQuery.value = query.toLowerCase();

    if (query.isEmpty) {
      // If search is empty, show all products
      filteredProducts.value = products;
    } else {
      // Filter products where productName contains the query (case-insensitive)
      filteredProducts.value = products.where((product) {
        return product.productName!.toLowerCase().contains(searchQuery.value);
      }).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    company = Get.arguments;
    fetchProducts();
    // Setup debounce for search (300ms delay)
    debounce(
      searchQuery.value.obs,
      (_) => searchProduct(searchQuery.value.toString().trim()),
      time: const Duration(milliseconds: 300),
    );
  }
}
