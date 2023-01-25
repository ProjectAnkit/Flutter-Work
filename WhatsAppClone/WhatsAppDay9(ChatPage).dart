import 'package:classico1/Pages/ChatPage/ChatPage.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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

  bool show = false;
  FocusNode focusNode  = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus)
      {
        show = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            // ignore: prefer_const_constructors
            Align(
              alignment: Alignment.bottomCenter,
              child: WillPopScope(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width-55,
                          child: Card(
                            margin: const EdgeInsets.only(left: 4,right: 2,bottom: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                            child: TextFormField(  
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center, 
                              maxLines: 5,
                              minLines: 1,  
                              keyboardType: TextInputType.multiline,
                              cursorColor: Colors.black,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                prefixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                     show = !show;
                                        });
                                }, icon: const Icon(Icons.emoji_emotions_outlined)),
                                border: InputBorder.none,
                                contentPadding:const EdgeInsets.all(5),
                                hintText: "Type a Message", 
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const IconButton(onPressed: null, icon: Icon(Icons.attach_file)),
                                    const IconButton(onPressed: null, icon: Icon(Icons.camera_alt_rounded)),
                                  ],
                                ),
                              ), 
                            ), 
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.only(right: 2,bottom: 8),
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromARGB(178, 2, 133, 89),
                            child: Center(child: Icon(Icons.mic,color: Colors.white,)),
                          ),
                        ),
                      ],
                    ),
                    show?SizedBox(
                      height: MediaQuery.of(context).size.height*0.35,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {
                          print(emoji);
                          setState(() {
                            _controller.text = _controller.text + emoji.emoji;
                          });
                        },
                        config: const Config(
                          columns: 7,
                        ),
                      ),
                    ):Container(),
                  ], 
                ),
                onWillPop: (){
                  if(show){
                     setState(() {
                        show = false;
                     });
                  }
                  else
                  {
                    Navigator.pop(context);
                  }
                  return Future.value(false);
                }
              ),
            )
          ]),
      )
    );
  }
}
