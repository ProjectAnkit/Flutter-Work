import 'package:flutter/material.dart';

class OwnMessage extends StatelessWidget {
  const OwnMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.symmetric(horizontal:15,vertical: 5),
          color: Color(0xffdcf8c6),
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 60,
                bottom: 10,
                top: 5,
              ),
              child: const Text("Hey sdhfkjdssdkj jdfhfkhsdfsd asjfbskdjfsdjkf safndskfnskd szdnasklnasklsd",style: TextStyle(fontSize: 16),),
            ),
            Positioned(
             right: 10,
             bottom: 4,
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text("12:00",style: TextStyle(fontSize: 12,color: Colors.grey),),
                  SizedBox(
                    width: 4,
                  ),
                  const Icon(Icons.done_all,size: 14,),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
