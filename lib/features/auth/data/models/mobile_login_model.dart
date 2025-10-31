// To parse this JSON data, do
//
//     final mobileLoginModel = mobileLoginModelFromJson(jsonString);

class MobileLoginModel {
  final String? email;
  final String? password;
  final int? tokenExpiry;

  MobileLoginModel({
    this.email = "anmolmobileapp@gmail.com",
    this.password = "SIsdXbkiLo",
    this.tokenExpiry = 1000,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "tokenExpiry": tokenExpiry,
  };
}
