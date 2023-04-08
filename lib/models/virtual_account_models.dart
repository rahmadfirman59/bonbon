// To parse this JSON data, do
//
//     final virtualAccountModels = virtualAccountModelsFromJson(jsonString);

import 'dart:convert';

VirtualAccountModels virtualAccountModelsFromJson(String str) =>
    VirtualAccountModels.fromJson(json.decode(str));

String virtualAccountModelsToJson(VirtualAccountModels data) =>
    json.encode(data.toJson());

class VirtualAccountModels {
  VirtualAccountModels({
    this.bankCode,
    this.collectionType,
    this.bankAccountNumber,
    this.accountHolderName,
  });

  String? bankCode;
  String? collectionType;
  String? bankAccountNumber;
  String? accountHolderName;

  factory VirtualAccountModels.fromJson(Map<String, dynamic> json) =>
      VirtualAccountModels(
        bankCode: json["bank_code"],
        collectionType: json["collection_type"],
        bankAccountNumber: json["bank_account_number"],
        accountHolderName: json["account_holder_name"],
      );

  Map<String, dynamic> toJson() => {
        "bank_code": bankCode,
        "collection_type": collectionType,
        "bank_account_number": bankAccountNumber,
        "account_holder_name": accountHolderName,
      };
}
