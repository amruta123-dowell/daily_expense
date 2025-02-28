enum SpendCat {
  shop("Shopping"),
  travel("Traveling"),
  food("Food"),
  grocery("Grocery"),
  others("Others");

  final String desc;
  const SpendCat(this.desc);
}

enum TransactionType {
  phonePay("PhonePay"),
  googlePay("GooglePay"),
  paytm("Paytm"), 
  netBanking("NetBanking"), 
  otherPayment("Other Payment");
  final String transaction;
  const TransactionType(this.transaction);
}
