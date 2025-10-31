import 'dart:convert';

import 'package:anmol_marketing/core/constants/api_keys.dart';
import 'package:anmol_marketing/features/account_statements/data/models/get_account_statements.dart';
import 'package:anmol_marketing/core/data/network_manager/dio_helper.dart';
import 'package:anmol_marketing/core/local_cache/storage.dart';

class AccountStatementRepository {
  static final dioHeloper = DioHelper();

static  Future<List<GetAccountStatementsModel>> getAccountStatements(
    String fromDate,
    String toDate,
  ) async {
    try {
      final response = await dioHeloper.getApi(
        url: ApiKeys.getAccountStatements,
        requestBody: jsonEncode({"FromDate": fromDate, "ToDate": toDate}),
        authToken:await storage.userToken ,
        isAuthRequired: true,
      );

      if (response is List) {
        return response
            .map((e) => GetAccountStatementsModel.fromJson(e))
            .toList();
      } else {
        throw Exception("list is expected but recieved map");
      }
    } catch (error) {
    
      rethrow;
    }
  }
}
