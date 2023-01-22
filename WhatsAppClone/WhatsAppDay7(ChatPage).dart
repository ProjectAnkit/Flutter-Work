import 'package:classico1/Pages/ChatPage/ChatPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ChatModel.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(178, 2, 133, 89),
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const Icon(Icons.arrow_back),
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: Center(child: widget.chatModel.isGroup? const CircleAvatar(radius:25,backgroundColor: Colors.grey, child: Center(child: Icon(Icons.group,color: Colors.white,))):const CircleAvatar(radius:25,backgroundColor: Colors.grey, child: Center(child: Icon(Icons.person,color: Colors.white,))),),
              )
            ],
          ),
        ),
       title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(widget.chatModel.Name,style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),),
           const SizedBox(
            height: 5,
           ),
          widget.chatModel.isGroup? Text("",style: GoogleFonts.roboto(fontSize: 12),):Text("Last Seen "+widget.chatModel.timing,style: GoogleFonts.roboto(fontSize: 12,color: Colors.white),)
        ],
       ),
       actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.video_call)),
         IconButton(onPressed: (){}, icon: const Icon(Icons.call)),
         PopupMenuButton(
          onSelected: (value) {
            print(value); 
          },
          itemBuilder: (context) {
            return[
                const PopupMenuItem(value: "View contact",child: Text("View contact"),),
                const PopupMenuItem(value: "Media,links, and docs",child: Text("Media,links, and docs"),),
                const PopupMenuItem(value: "Search",child: Text("Search"),),
                const PopupMenuItem(value: "Mute notifications",child: Text("Mute notifications"),),
                const PopupMenuItem(value: "Disappearing messages",child: Text("Disappearing messages"),),
                const PopupMenuItem(value: "Wallpaper",child: Text("Wallpaper"),),
                const PopupMenuItem(value: "More",child: Text("More"),)
            ];
          },
         )
       ],
      ),
    );
  }
}
