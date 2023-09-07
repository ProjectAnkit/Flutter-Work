//Payment Method

 Future<dynamic> createOrder(String amount) async {
    var mapHeader = <String, String>{};
    mapHeader['Authorization'] = "Basic ${dotenv.env['AUTHORIZATION']!}";
    mapHeader['Accept'] = "application/json";
    mapHeader['Content-Type'] = "application/x-www-form-urlencoded";
    var map = <String, String>{};
    setState(() {
      map['amount'] = "${(num.parse(amount) * 100)}";
    });
    map['currency'] = "INR";
    map['receipt'] = "receipt1";
    print("map $map");
    final response = await retry(
      // Make a GET request
      () => http
          .post(Uri.https("api.razorpay.com","/v1/orders"),
          headers: mapHeader,
          body: map)
          .timeout(const Duration(seconds: 2)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    print("....${response.body}");
    if (response.statusCode == 200) {
      RazorpayOrderResponse data =
      RazorpayOrderResponse.fromJson(json.decode(response.body));
      openCheckout(data,amount);
    } else {
      toastmessage().showerror("Something went wrong!");
    }
  }

  



  void openCheckout(RazorpayOrderResponse data,String amount) async {
    var options = {
      'key': dotenv.env['RAZOR_TEST'],
      'amount': "${(num.parse(amount) * 100)}",
      'name': 'ShopMe',
      'description': '',
      'order_id': '${data.id}',
    };
 
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }



//PaymentResponseModel

class RazorpayOrderResponse {
 
  String? id;
  String? entity;
  int? amount;
  int? amountPaid;
  int? amountDue;
  String? currency;
  String? receipt;
  String? offerId;
  String? status;
  int? attempts;
  int? createdAt;
 
  RazorpayOrderResponse({
    this.id,
    this.entity,
    this.amount,
    this.amountPaid,
    this.amountDue,
    this.currency,
    this.receipt,
    this.offerId,
    this.status,
    this.attempts,
    this.createdAt,
  });
  RazorpayOrderResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    entity = json["entity"]?.toString();
    amount = json["amount"]?.toInt();
    amountPaid = json["amount_paid"]?.toInt();
    amountDue = json["amount_due"]?.toInt();
    currency = json["currency"]?.toString();
    receipt = json["receipt"]?.toString();
    offerId = json["offer_id"]?.toString();
    status = json["status"]?.toString();
    attempts = json["attempts"]?.toInt();
    createdAt = json["created_at"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["entity"] = entity;
    data["amount"] = amount;
    data["amount_paid"] = amountPaid;
    data["amount_due"] = amountDue;
    data["currency"] = currency;
    data["receipt"] = receipt;
    data["offer_id"] = offerId;
    data["status"] = status;
    data["attempts"] = attempts;
    data["created_at"] = createdAt;
    return data;
  }
}
