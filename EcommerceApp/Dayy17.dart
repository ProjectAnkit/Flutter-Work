import 'dart:convert';

import 'package:ecommerce_app/Utils/ToastMessages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> makePayment(Map<String,dynamic>?paymentIntent,BuildContext context)async{

  try{

    paymentIntent = await createPaymentIntent("100","INR");

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent!["client_secret"],
        style: ThemeMode.light,
        merchantDisplayName: "ShopMe"
      )).then((value) {});

      // ignore: use_build_context_synchronously
      displayPaymentSheet(context,paymentIntent);

  }

  catch(e){
      toastmessage().showerror(e.toString());
  }
}




createPaymentIntent(String amount,String currency)async{

    try{

      Map<String,dynamic>body = {

        'amount': calculateAmount(amount),
        'currency': currency,

      };


      var response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
        );

        return jsonDecode(response.body);
    }


    catch(e){
      toastmessage().showerror(e.toString());
    }

}




calculateAmount(String amount){
  final amountt = int.parse(amount)*100;
  return amountt.toString();
}




displayPaymentSheet(BuildContext context,Map<String,dynamic>?paymentIntent)async{

  try{

    await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
        context: context, 
        builder: (context){
          return const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle,color: Colors.green,size: 100,),
                SizedBox(
                  height: 10,
                ),
                Text("Payment successful"),
              ],
            ),
          );
        });

        paymentIntent = null;
    }).onError((error, stackTrace) {
      toastmessage().showerror(error.toString());
    });

    
  } on StripeException catch(e){
    toastmessage().showerror(e.toString());
     const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
  } catch(e){
    toastmessage().showerror(e.toString());
  }
}
