// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatModel>Mydata = [
    ChatModel(
      Name: "Sanjay",
       Message: "This is for me",
        timing: "6:40pm",
          isGroup: false,
          ),
          ChatModel(
      Name: "swarna",
       Message: "aaunga jaldi hi",
        timing: "yesterday",
          isGroup: false,
          ),
          ChatModel(
      Name: "Tripti",
       Message: "chalege",
        timing: "11-oct",
          isGroup: false,
          ),
          ChatModel(
      Name: "Gaytri",
       Message: "aadha kaam hi hua hai",
        timing: "10-oct",
          isGroup: false,
          ),
          ChatModel(
      Name: "Shweta",
       Message: "okay okay",
        timing: "5-oct",
          isGroup: false,
          ),
          ChatModel(
      Name: "Ankit",
       Message: "Late ho jayge",
        timing: "2-oct",
          isGroup: false,
          ),
          ChatModel(
      Name: "Avish Agrahari",
       Message: "Done",
        timing: "1-oct",
          isGroup: false,
          ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (() {}),backgroundColor: Color.fromARGB(178, 2, 133, 89),child: Icon(Icons.chat)),
          body:ListView.builder(
            itemCount: Mydata.length,
            itemBuilder: (context, index) => CustomCard(chatModel: Mydata[index],)),
          );
      }
  }



class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(radius:25,backgroundColor: Colors.grey, child: Center(child: Icon(Icons.person,color: Colors.white,))),
      title: Text(chatModel.Name,style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),),
      subtitle: Row(
        children: [
          const Icon(Icons.done_all,color: Colors.blue,size: 17,),
          const SizedBox(
            width: 2,
          ),
          Text(chatModel.Message,style: GoogleFonts.roboto(fontSize: 15),),
        ],
      ),
      trailing: Text(chatModel.timing),

    );
  }
}


class ChatModel {
     String Name;
     String Message;
     String timing;
     bool isGroup;
  ChatModel({
    required this.Name,
    required this.Message,
    required this.timing,
    required this.isGroup,
  });
     
}
