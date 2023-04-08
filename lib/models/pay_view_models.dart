// To parse this JSON data, do
//
//     final payViewModels = payViewModelsFromJson(jsonString);

import 'dart:convert';

PayViewModels payViewModelsFromJson(String str) =>
    PayViewModels.fromJson(json.decode(str));

String payViewModelsToJson(PayViewModels data) => json.encode(data.toJson());

class PayViewModels {
  PayViewModels({
    this.id,
    this.externalId,
    this.userId,
    this.status,
    this.merchantName,
    this.merchantProfilePictureUrl,
    this.amount,
    this.payerEmail,
    this.description,
    this.expiryDate,
    this.invoiceUrl,
    this.availableBanks,
    this.availableRetailOutlets,
    this.availableEwallets,
    this.availableQrCodes,
    this.availableDirectDebits,
    this.availablePaylaters,
    this.shouldExcludeCreditCard,
    this.shouldSendEmail,
    this.successRedirectUrl,
    this.failureRedirectUrl,
    this.created,
    this.updated,
    this.currency,
  });

  String? id;
  String? externalId;
  String? userId;
  String? status;
  String? merchantName;
  String? merchantProfilePictureUrl;
  int? amount;
  String? payerEmail;
  String? description;
  DateTime? expiryDate;
  String? invoiceUrl;
  List<AvailableBank>? availableBanks;
  List<dynamic>? availableRetailOutlets;
  List<dynamic>? availableEwallets;
  List<AvailableQrCode>? availableQrCodes;
  List<AvailableDirectDebit>? availableDirectDebits;
  List<AvailablePaylater>? availablePaylaters;
  bool? shouldExcludeCreditCard;
  bool? shouldSendEmail;
  String? successRedirectUrl;
  String? failureRedirectUrl;
  DateTime? created;
  DateTime? updated;
  String? currency;

  factory PayViewModels.fromJson(Map<String, dynamic> json) => PayViewModels(
        id: json["id"],
        externalId: json["external_id"],
        userId: json["user_id"],
        status: json["status"],
        merchantName: json["merchant_name"],
        merchantProfilePictureUrl: json["merchant_profile_picture_url"],
        amount: json["amount"],
        payerEmail: json["payer_email"],
        description: json["description"],
        expiryDate: json["expiry_date"] == null
            ? null
            : DateTime.parse(json["expiry_date"]),
        invoiceUrl: json["invoice_url"],
        availableBanks: json["available_banks"] == null
            ? []
            : List<AvailableBank>.from(
                json["available_banks"]!.map((x) => AvailableBank.fromJson(x))),
        availableRetailOutlets: json["available_retail_outlets"] == null
            ? []
            : List<dynamic>.from(
                json["available_retail_outlets"]!.map((x) => x)),
        availableEwallets: json["available_ewallets"] == null
            ? []
            : List<dynamic>.from(json["available_ewallets"]!.map((x) => x)),
        availableQrCodes: json["available_qr_codes"] == null
            ? []
            : List<AvailableQrCode>.from(json["available_qr_codes"]!
                .map((x) => AvailableQrCode.fromJson(x))),
        availableDirectDebits: json["available_direct_debits"] == null
            ? []
            : List<AvailableDirectDebit>.from(json["available_direct_debits"]!
                .map((x) => AvailableDirectDebit.fromJson(x))),
        availablePaylaters: json["available_paylaters"] == null
            ? []
            : List<AvailablePaylater>.from(json["available_paylaters"]!
                .map((x) => AvailablePaylater.fromJson(x))),
        shouldExcludeCreditCard: json["should_exclude_credit_card"],
        shouldSendEmail: json["should_send_email"],
        successRedirectUrl: json["success_redirect_url"],
        failureRedirectUrl: json["failure_redirect_url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "external_id": externalId,
        "user_id": userId,
        "status": status,
        "merchant_name": merchantName,
        "merchant_profile_picture_url": merchantProfilePictureUrl,
        "amount": amount,
        "payer_email": payerEmail,
        "description": description,
        "expiry_date": expiryDate?.toIso8601String(),
        "invoice_url": invoiceUrl,
        "available_banks": availableBanks == null
            ? []
            : List<dynamic>.from(availableBanks!.map((x) => x.toJson())),
        "available_retail_outlets": availableRetailOutlets == null
            ? []
            : List<dynamic>.from(availableRetailOutlets!.map((x) => x)),
        "available_ewallets": availableEwallets == null
            ? []
            : List<dynamic>.from(availableEwallets!.map((x) => x)),
        "available_qr_codes": availableQrCodes == null
            ? []
            : List<dynamic>.from(availableQrCodes!.map((x) => x.toJson())),
        "available_direct_debits": availableDirectDebits == null
            ? []
            : List<dynamic>.from(availableDirectDebits!.map((x) => x.toJson())),
        "available_paylaters": availablePaylaters == null
            ? []
            : List<dynamic>.from(availablePaylaters!.map((x) => x.toJson())),
        "should_exclude_credit_card": shouldExcludeCreditCard,
        "should_send_email": shouldSendEmail,
        "success_redirect_url": successRedirectUrl,
        "failure_redirect_url": failureRedirectUrl,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "currency": currency,
      };
}

class AvailableBank {
  AvailableBank({
    this.bankCode,
    this.collectionType,
    this.transferAmount,
    this.bankBranch,
    this.accountHolderName,
    this.identityAmount,
  });

  String? bankCode;
  String? collectionType;
  int? transferAmount;
  String? bankBranch;
  String? accountHolderName;
  int? identityAmount;

  factory AvailableBank.fromJson(Map<String, dynamic> json) => AvailableBank(
        bankCode: json["bank_code"],
        collectionType: json["collection_type"],
        transferAmount: json["transfer_amount"],
        bankBranch: json["bank_branch"],
        accountHolderName: json["account_holder_name"],
        identityAmount: json["identity_amount"],
      );

  Map<String, dynamic> toJson() => {
        "bank_code": bankCode,
        "collection_type": collectionType,
        "transfer_amount": transferAmount,
        "bank_branch": bankBranch,
        "account_holder_name": accountHolderName,
        "identity_amount": identityAmount,
      };
}

class AvailableDirectDebit {
  AvailableDirectDebit({
    this.directDebitType,
  });

  String? directDebitType;

  factory AvailableDirectDebit.fromJson(Map<String, dynamic> json) =>
      AvailableDirectDebit(
        directDebitType: json["direct_debit_type"],
      );

  Map<String, dynamic> toJson() => {
        "direct_debit_type": directDebitType,
      };
}

class AvailablePaylater {
  AvailablePaylater({
    this.paylaterType,
  });

  String? paylaterType;

  factory AvailablePaylater.fromJson(Map<String, dynamic> json) =>
      AvailablePaylater(
        paylaterType: json["paylater_type"],
      );

  Map<String, dynamic> toJson() => {
        "paylater_type": paylaterType,
      };
}

class AvailableQrCode {
  AvailableQrCode({
    this.qrCodeType,
  });

  String? qrCodeType;

  factory AvailableQrCode.fromJson(Map<String, dynamic> json) =>
      AvailableQrCode(
        qrCodeType: json["qr_code_type"],
      );

  Map<String, dynamic> toJson() => {
        "qr_code_type": qrCodeType,
      };
}
