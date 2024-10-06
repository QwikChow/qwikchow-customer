import 'package:cloud_firestore/cloud_firestore.dart';

class NewUser {
  bool active;
  Timestamp createdAt;
  String email;
  String firstName;
  String id;
  String lastName;
  String phoneNumber;
  String profilePictureURL;
  String role;
  UserBankDetails userBankDetails;
  String vendorID;

  NewUser({
    required this.active,
    required this.createdAt,
    required this.email,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePictureURL,
    required this.role,
    required this.userBankDetails,
    required this.vendorID,
  });

  factory NewUser.fromJson(Map<String, dynamic> parsedJson) {
    return NewUser(
      active: parsedJson['active'] ?? false,
      createdAt: parsedJson['createdAt'] ?? Timestamp.now(),
      email: parsedJson['email'] ?? '',
      firstName: parsedJson['firstName'] ?? '',
      id: parsedJson['id'] ?? '',
      lastName: parsedJson['lastName'] ?? '',
      phoneNumber: parsedJson['phoneNumber'] ?? '',
      profilePictureURL: parsedJson['profilePictureURL'] ?? '',
      role: parsedJson['role'] ?? '',
      userBankDetails: UserBankDetails.fromJson(parsedJson['userBankDetails'] ?? {}),
      vendorID: parsedJson['vendorID'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'active': this.active,
      'createdAt': this.createdAt,
      'email': this.email,
      'firstName': this.firstName,
      'id': this.id,
      'lastName': this.lastName,
      'phoneNumber': this.phoneNumber,
      'profilePictureURL': this.profilePictureURL,
      'role': this.role,
      'userBankDetails': this.userBankDetails.toJson(),
      'vendorID': this.vendorID,
    };
  }
}

class UserBankDetails {
  String accountNumber;
  String bankName;
  String branchName;
  String holderName;
  String otherDetails;

  UserBankDetails({
    required this.accountNumber,
    required this.bankName,
    required this.branchName,
    required this.holderName,
    required this.otherDetails,
  });

  factory UserBankDetails.fromJson(Map<String, dynamic> parsedJson) {
    return UserBankDetails(
      accountNumber: parsedJson['accountNumber'] ?? '',
      bankName: parsedJson['bankName'] ?? '',
      branchName: parsedJson['branchName'] ?? '',
      holderName: parsedJson['holderName'] ?? '',
      otherDetails: parsedJson['otherDetails'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountNumber': this.accountNumber,
      'bankName': this.bankName,
      'branchName': this.branchName,
      'holderName': this.holderName,
      'otherDetails': this.otherDetails,
    };
  }
}