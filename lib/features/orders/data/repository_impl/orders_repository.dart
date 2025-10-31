import 'dart:convert';

import 'package:anmol_marketing/core/constants/api_keys.dart';
import 'package:anmol_marketing/core/core.dart';
import 'package:anmol_marketing/features/orders/data/models/get_all_orders.dart';
import 'package:anmol_marketing/features/orders/data/models/get_last_order.dart';
import 'package:anmol_marketing/core/data/models/post_models/create_order_model_for_api.dart';
import 'package:anmol_marketing/core/data/network_manager/dio_helper.dart';
import 'package:anmol_marketing/core/local_cache/storage.dart';

class OrdersRepository {
  static final _dioHelper = DioHelper();

  static Future<GetLastOrderModel> getLastOrder() async {
    try {
      final response = await _dioHelper.getApi(
        url: ApiKeys.getLastOrder,
        isAuthRequired: true,
        authToken: await storage.userToken,
      );
      return GetLastOrderModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<GetAllOrders>> getAllOrders({
    required String startingDate,
    required String toDate,
  }) async {
    try {
      final response = await _dioHelper.postApi(
        url: ApiKeys.getAllOrders,
        isAuthRequired: true,
        authToken: await storage.userToken,
        requestBody: jsonEncode({
          "DocDateRange": [startingDate, toDate],
        }),
      );
      List<GetAllOrders> ordersList;
      if (response is List) {
        ordersList = response
            .map((company) => GetAllOrders.fromJson(company))
            .toList();
        return ordersList;
      } else {
        throw Exception("Expected a list but got ${response.runtimeType}");
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<bool> createOrder(CreateOrderModelApi createOrder) async {
    try {
      await _dioHelper.postApi(
        url: ApiKeys.createOrder,
        authToken: await storage.userToken,
        isAuthRequired: true,
        requestBody: createOrder,
      );
      return true;
    } catch (error) {
      rethrow;
    }
  }
}
