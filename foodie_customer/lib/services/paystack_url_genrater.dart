import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:foodie_customer/main.dart';
import 'package:foodie_customer/model/NewUser.dart';
import 'package:foodie_customer/model/PayFastSettingData.dart';
import 'package:foodie_customer/model/payStackURLModel.dart';
import 'package:http/http.dart' as http;

class PayStackURLGen {
  static Future payStackURLGen(
      {required String amount,
      required String secretKey,
      required String currency,
      double? subTotal,
      NewUser? usersDetails}) async {
    dynamic payStackCollectionData;
    Map<String, dynamic> vendorsBankCode = {
      'Access Bank Nigeria Plc': '044',
      'Diamond Bank Plc': '063',
      'Ecobank Nigeria': '050',
      'Enterprise Bank Plc': '084',
      'Fidelity Bank Plc': '070',
      'First Bank of Nigeria Plc': '011',
      'First Bank of Nigeria': '011',
      'First City Monument Bank': '214',
      'Guaranty Trust Bank Plc': '058',
      'Jaiz Bank': '301',
      'Keystone Bank Ltd': '082',
      'Mainstreet Bank Plc': '014',
      'Skye Bank Plc': '076',
      'Stanbic IBTC Plc': '039',
      'Sterling Bank Plc': '232',
      'Union Bank Nigeria Plc': '032',
      'United Bank for Africa Plc': '033',
      'Unity Bank Plc': '215',
      'WEMA Bank Plc': '035',
      'Zenith Bank International': '057',
      'Providus Bank': '101',
      'PARALLEX BANK LIMITED': '104',
      'LOTUS BANK LIMITED': '303',
      'PREMIUM TRUST BANK LTD': '105',
      'SIGNATURE BANK LTD': '106',
      'GLOBUS BANK': '103',
      'Opay': '999992',
      'Moniepoint': '50515',
      'Kuda Bank': '50211',
      'Palm pay': '999991',
      'Total trust bank': '889',
      'Titan trust bank': '102'
    };

    if (usersDetails?.userBankDetails.accountNumber != null) {
      debugPrint("DATA IS AVAILABLE AT THE MOMENT AND GOOD TO GO");
      debugPrint(usersDetails?.lastName);
      debugPrint(usersDetails?.firstName);
      debugPrint(usersDetails?.email);
      // debugPrint((subTotal as double).toString());
      // UserBankDetails? bankdetails = usersDetails?.userBankDetails;
      String? accountNumber = usersDetails?.userBankDetails.accountNumber;
      String? bankName = usersDetails?.userBankDetails.bankName;
      // double? subtotal = subTotal;
      debugPrint(bankName);
      String? bankCode = vendorsBankCode[bankName];
      String? vendorsMail = usersDetails?.email;
      double newAmount = double.parse(amount);
      double newSubTotal = (subTotal! * 100.0);
      String? vendorsName =
          usersDetails!.firstName + '' + usersDetails.lastName;
      double mainAccountTotalAmount = (newAmount - newSubTotal);
      debugPrint(mainAccountTotalAmount.toString());
      double percentage = ((newSubTotal * 100) / newAmount);
      String newPercentage = percentage.toString();
      final url = "https://api.paystack.co/subaccount";
      final response = await http.post(Uri.parse(url), body: {
        "business_name": vendorsName,
        "bank_code": bankCode,
        "account_number": accountNumber,
        "percentage_charge": newPercentage,
      }, headers: {
        "Authorization": "Bearer $secretKey",
      });
      final data = jsonDecode(response.body);
      if (data['status']) {
        String sub_account = data['data']['subaccount_code'];
        debugPrint(sub_account);
        final newUrl = "https://api.paystack.co/transaction/initialize";
        final newResponse = await http.post(Uri.parse(newUrl), body: {
          "email": vendorsMail,
          "amount": amount,
          "subaccount": sub_account,
          "transaction_charge": mainAccountTotalAmount.toString(),
        }, headers: {
          "Authorization": "Bearer $secretKey",
        });
        final newData = jsonDecode(newResponse.body);
        if (!newData["status"]) {
          return null;
        }
        payStackCollectionData = newData;
        // return PayStackUrlModel.fromJson(newData);
      }
    } else {
      final url = "https://api.paystack.co/transaction/initialize";

      final response = await http.post(Uri.parse(url), body: {
        "email": MyAppState.currentUser?.email,
        "amount": amount,
        "currency": currency,
      }, headers: {
        "Authorization": "Bearer $secretKey",
      });
      debugPrint(response.body);
      final data = jsonDecode(response.body);
      if (!data["status"]) {
        return null;
      }
      payStackCollectionData = data;
      // return PayStackUrlModel.fromJson(data);
    }
    return PayStackUrlModel.fromJson(payStackCollectionData);
  }

  static Future<bool> verifyTransaction({
    required String reference,
    required String secretKey,
    required String amount,
  }) async {
    debugPrint("we Enter payment Settle");
    debugPrint(reference);

    final url = "https://api.paystack.co/transaction/verify/$reference";

    var response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $secretKey",
    });

    debugPrint(response.body);
    final data = jsonDecode(response.body);
    if (data["status"] == true) {
      if (data["message"] == "Verification successful") {}
    }

    return data["status"];

    //PayPalClientSettleModel.fromJson(data);
  }

  static Future<String> getPayHTML(
      {required String amount,
      required PayFastSettingData payFastSettingData,
      String itemName = "wallet Topup"}) async {
    String newUrl =
        'https://${!payFastSettingData.isSandbox ? "www" : "sandbox"}.payfast.co.za/eng/process';
    Map body = {
      'merchant_id': payFastSettingData.merchantId,
      'merchant_key': payFastSettingData.merchantKey,
      'amount': amount,
      'item_name': itemName,
      'return_url': payFastSettingData.returnUrl,
      'cancel_url': payFastSettingData.cancelUrl,
      'notify_url': payFastSettingData.notifyUrl,
      'name_first': MyAppState.currentUser!.firstName,
      'name_last': MyAppState.currentUser!.lastName,
      'email_address': MyAppState.currentUser!.email,
    };

    final response = await http.post(
      Uri.parse(newUrl),
      body: body,
    );

    debugPrint(response.body);
    return response.body;
  }
}
