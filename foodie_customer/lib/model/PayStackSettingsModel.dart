class PayStackSettingData {
  String publicKey;
  String secretKey;
  String callbackURL;
  String webhookURL;
  bool isEnabled;
  bool isSandbox;

  // PayStackSettingData({
  //   this.publicKey = 'pk_live_1b1387af43b798bbe2e74cd17ddca779a7620587',
  //   this.callbackURL = 'https://qwikchow.com/',
  //   this.webhookURL = 'https://qwikchow.com/',
  //   this.secretKey = 'sk_live_59ab0342459d68956f3fe784a3c8aebd104883ad',
  //   required this.isSandbox,
  //   required this.isEnabled, 
  // });
    PayStackSettingData({
    this.publicKey = '',
    this.callbackURL = '',
    this.webhookURL = '',
    this.secretKey = '',
    required this.isSandbox,
    required this.isEnabled, 
  });


  factory PayStackSettingData.fromJson(Map<String, dynamic> parsedJson) {
    return PayStackSettingData(
      publicKey: parsedJson['publicKey'] ?? '',
      webhookURL: parsedJson['webhookURL'] ?? '',
      callbackURL: parsedJson['callbackURL'] ?? '',
      isSandbox: parsedJson['isSandbox'],
      isEnabled: parsedJson['isEnable'],
      secretKey: parsedJson['secretKey'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'secretKey': this.secretKey,
      'callbackURL': this.callbackURL,
      'webhookURL': this.webhookURL,
      'isEnable': this.isEnabled,
      'isSandbox': this.isSandbox,
      'publicKey': this.publicKey,
    };
  }
}
