
import '../../core/barrel.dart';
import '../../core/shared/data/models/get_companies_model/get_companies_model.dart';

/// Controller for the bottom-navigation bar.
///
/// Responsibilities:
/// 1. Track the currently selected tab (`currentIndex`).
/// 2. Provide a cached list of companies used by multiple tabs.
/// 3. Handle transparent token refresh if the stored session expires.
class NavbarController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                                Observables                                 */
  /* -------------------------------------------------------------------------- */

  /// Index of the currently active bottom-navigation tab.
  final RxInt currentIndex = 0.obs;

  /// Companies that have been synced from the backend into the local DB.
  final RxList<GetCompaniesModel> companies = <GetCompaniesModel>[].obs;

  /* -------------------------------------------------------------------------- */
  /*                               Data Fetching                                */
  /* -------------------------------------------------------------------------- */

  /// Loads companies from the repository.
  ///
  /// If the API token is invalid, the user is silently re-authenticated
  /// and the request is retried once.
  Future<void> fetchCompanies() async {
    try {
      companies.assignAll(await CompaniesRepository.insertAndFetchCompanies());
    } on InvalidAppToken {
      await _reAuthenticateAndRetry();
    } catch (e) {
      debugPrint('Error fetching companies: $e');
    }
  }

  /// Re-authenticates the user with stored credentials and re-fetches companies.
  Future<void> _reAuthenticateAndRetry() async {
    try {
      final response = await AuthRepository.loginUser(
        LoginUserModel(
          loginId: await storage.readValues(StorageKeys.phoneNumber) ?? '',
          password: await storage.readValues(StorageKeys.password) ?? '',
        ),
      );

      await Future.wait([
        SessionController().saveUserInStorage(response),
        SessionController().getUserfromSharedpref(),
      ]);

      companies.assignAll(await CompaniesRepository.insertAndFetchCompanies());
    } catch (e) {
      debugPrint('Re-authentication failed: $e');
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                              Lifecycle Hooks                               */
  /* -------------------------------------------------------------------------- */

  @override
  Future<void> onReady() async {
    super.onReady();
    await fetchCompanies();
  }
}