class ChangePasswordRequestModel {
  final String password;
  final String confirmPassword;
  final int customerId;

  ChangePasswordRequestModel({
    required this.password,
    required this.confirmPassword,
    required this.customerId,
  });

  /// Convert JSON to Model
  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRequestModel(
      password: json['Password'] ?? '',
      confirmPassword: json['ConfirmPassword'] ?? '',
      customerId: json['CustomerId'] ?? 0,
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      "Password": password,
      "ConfirmPassword": confirmPassword,
      "CustomerId": customerId,
    };
  }
}
