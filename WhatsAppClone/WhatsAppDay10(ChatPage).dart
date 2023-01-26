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
  var Iconfonts = GoogleFonts.roboto(fontSize: 15,color: Colors.grey);

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
                                    IconButton(onPressed: (){
                                       showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context, builder: (Builder)=> MyAttachments());
                                    }, icon: const Icon(Icons.attach_file)),
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





  Widget MyAttachments(){
    return Container(
      height: 360,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.deepPurple,
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.insert_drive_file),color: Colors.white,iconSize: 26,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Document",style: Iconfonts,),
                      ),
                    ],
                  ),

                   Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt),color: Colors.white,iconSize: 26,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Camera",style: Iconfonts,),
                      ),
                    ],
                  ),

                   Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.purple,
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.photo_size_select_actual_rounded),color: Colors.white,iconSize: 26,)),
                      Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Gallery",style: Iconfonts,),
                      ),
                    ],
                  ),
                ],
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orange[700],
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.headphones),color: Colors.white,iconSize: 26,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Audio",style: Iconfonts,),
                      ),
                    ],
                  ),

                   Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green[400],
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.location_on),color: Colors.white,iconSize: 26,)),
                      Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Location",style: Iconfonts,),
                      ),
                    ],
                  ),

                   Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color.fromARGB(255, 3, 128, 88),
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.currency_rupee_rounded),color: Colors.white,iconSize: 26,)),
                      Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Payment",style: Iconfonts,),
                      ),
                    ],
                  ),
                ],
              ),


              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue[600],
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.person),color: Colors.white,iconSize: 26,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Contact",style: Iconfonts,),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                   Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color.fromARGB(255, 3, 128, 88),
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.poll),color: Colors.white,iconSize: 26,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Poll",style: Iconfonts,),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}
