// To parse this JSON data, do
//
//     final createOrderModelApi = createOrderModelApiFromJson(jsonString);

import 'dart:convert';

CreateOrderModelApi createOrderModelApiFromJson(String str) =>
    CreateOrderModelApi.fromJson(json.decode(str));

String createOrderModelApiToJson(CreateOrderModelApi data) =>
    json.encode(data.toJson());

class CreateOrderModelApi {
  final int? paymentModeId;
  final List<ModelRow>? rows;

  CreateOrderModelApi({this.paymentModeId, this.rows});

  CreateOrderModelApi copyWith({int? paymentModeId, List<ModelRow>? rows}) =>
      CreateOrderModelApi(
        paymentModeId: paymentModeId ?? this.paymentModeId,
        rows: rows ?? this.rows,
      );

  factory CreateOrderModelApi.fromJson(Map<String, dynamic> json) =>
      CreateOrderModelApi(
        paymentModeId: json["PaymentModeId"],
        rows: json["Rows"] == null
            ? []
            : List<ModelRow>.from(
                json["Rows"]!.map((x) => ModelRow.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "PaymentModeId": paymentModeId,
    "Rows": rows == null
        ? []
        : List<dynamic>.from(rows!.map((x) => x.toJson())),
  };
}

class ModelRow {
  final int? productId;
  final int? qty;
  final double? price;
  final double? discRatio;
  final double? discValue;

  ModelRow({
    this.productId,
    this.qty,
    this.price,
    this.discRatio,
    this.discValue,
  });

  ModelRow copyWith({
    int? productId,
    int? qty,
    double? price,
    double? discRatio,
    double? discValue,
  }) => ModelRow(
    productId: productId ?? this.productId,
    qty: qty ?? this.qty,
    price: price ?? this.price,
    discRatio: discRatio ?? this.discRatio,
    discValue: discValue ?? this.discValue,
  );

  factory ModelRow.fromJson(Map<String, dynamic> json) => ModelRow(
    productId: json["ProductId"],
    qty: json["Qty"],
    price: json["Price"],
    discRatio: json["DiscRatio"],
    discValue: json["DiscValue"],
  );

  Map<String, dynamic> toJson() => {
    "ProductId": productId,
    "Qty": qty,
    "Price": price,
    "DiscRatio": discRatio,
    "DiscValue": discValue,
  };
}
