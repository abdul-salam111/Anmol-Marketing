import '../../../core/barrel.dart';
import '../../../core/data/models/get_models/get_companies.dart';

/// Controller for managing the company catalogue
/// Handles fetching, filtering, and searching companies
class CatalogueController extends GetxController {
  // Observables
  final RxString searchQuery = "".obs; // Search input from user
  final RxList<GetCompaniesModel> companies =
      <GetCompaniesModel>[].obs; // All companies
  final RxList<GetCompaniesModel> filterCompanies =
      <GetCompaniesModel>[].obs; // Filtered companies
  final RxBool isLoading = false.obs; // Loading state
  final RxString errorMessage = ''.obs; // Error message

  @override
  void onReady() {
    super.onReady();

    // Initial data fetch
    fetchCompanies();

    // Listen to search query changes and apply filtering
    ever(searchQuery, (String value) {
      searchCompanies(value.trim());
    });
  }

  /// Fetches companies from local database
  /// Handles token expiration by attempting reauthentication
  Future<void> fetchCompanies() async {
    try {
      // Set loading state and reset error
      _setLoadingState(true);
      errorMessage.value = '';

      // Clear existing data
      filterCompanies.clear();

      // Fetch companies from repository
      final List<GetCompaniesModel> localCompanies =
          await CompaniesRepository.getCompaniesList();

      // Update observables with fetched data
      companies.value = localCompanies;
      filterCompanies.value = localCompanies;
    } on InvalidAppToken {
      // Handle token expiration by reauthenticating
      await _handleTokenExpiration();
    } catch (e) {
      // Set error message on failure
      errorMessage.value = 'Failed to load companies ${e.toString()}';
    } finally {
      // Reset loading state
      isLoading.value = false;
    }
  }

  /// Handles token expiration by reauthenticating and refetching data
  Future<void> _handleTokenExpiration() async {
    try {
      // Attempt to reauthenticate
      final response = await AuthRepository.loginUser(
        LoginUserModel(
          loginId: await storage.readValues(StorageKeys.phoneNumber),
          password: await storage.readValues(StorageKeys.password),
        ),
      );

      // Save new session data
      await Future.wait([
        SessionController().saveUserInStorage(response),
        SessionController().getUserfromSharedpref(),
      ]);

      // Reset states
      _setLoadingState(true);
      errorMessage.value = '';
      filterCompanies.clear();

      // Refetch companies
      final List<GetCompaniesModel> localCompanies =
          await CompaniesRepository.getCompaniesList();

      // Update observables
      companies.value = localCompanies;
      filterCompanies.value = localCompanies;
    } catch (e) {
      // Set error message if reauthentication fails
      errorMessage.value = 'Session expired. Please login again.';
    } finally {
      // Reset loading state
      isLoading.value = false;
    }
  }

  /// Filters companies based on search query
  /// [query]: The search term to filter companies by name
  void searchCompanies(String query) {
    if (query.isEmpty) {
      // Show all companies when query is empty
      filterCompanies.value = companies;
    } else {
      // Filter companies by name (case-insensitive)
      final String lowerQuery = query.toLowerCase();
      filterCompanies.value = companies
          .where(
            (GetCompaniesModel company) =>
                company.companyName?.toLowerCase().contains(lowerQuery) ??
                false,
          )
          .toList();
    }
  }

  /// Helper method to set loading state
  void _setLoadingState(bool loading) {
    isLoading.value = loading;
  }

  @override
  void onClose() {
    // Clean up resources
    searchQuery.close();
    super.onClose();
  }
}
