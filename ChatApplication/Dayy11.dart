//near to completion

//CustomDropDownMenu
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDropDownField extends StatefulWidget {
  const MyDropDownField({super.key, required this.items, this.onChanged});
  final List<String> items;
  final Function(dynamic)? onChanged;

  @override
  State<MyDropDownField> createState() => _MyDropDownFieldState();
}

class _MyDropDownFieldState extends State<MyDropDownField> {

  
  bool show = false;
  String label = "Select your option";

  @override
  Widget build(BuildContext context) {
    
    return Column(
                  children: [
                    InkWell(
                      onTap: (){
                          show = !show;
                          setState(() {
                            
                          });
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(label,style: GoogleFonts.jost(color: Colors.grey,fontSize: 18),),
                              Icon(show?Icons.arrow_drop_up:Icons.arrow_drop_down,color: Colors.grey,),     
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: show? 120:0,
                      width: MediaQuery.of(context).size.width,
                      child: Expanded(
                            child: Visibility(
                              visible: true,
                              child: ListView.builder(
                                itemCount: widget.items.length,
                                itemBuilder: (context,index)=> InkWell(
                                  onTap: (){   
                                    setState(() {
                                       label = widget.items[index].toString();
                                       show = !show;
                                    });
                                    widget.onChanged!(label);
                                  },
                                  child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(color: Color.fromARGB(255, 43, 42, 42), border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Text(widget.items[index],style: GoogleFonts.jost(color: Colors.grey,fontSize: 18),),
                                        ),
                                      ],
                                    )
                                  ),
                                )),
                            ),
                          ),
                    ),
                  ],
                );
  }
}





//CodeVerification Function Updated

                ontap: ()async{
    
                  setState(() {
                    loading = true;
                  });
                  
                  
                  final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId, 
                    smsCode: _codecontroller.text.toString());
    
                  await auth.signInWithCredential(credential).then((value) async {
    
                    setState(() {
                      loading = false;
                    });
                    
                    final user = auth.currentUser;
                    final userdoc = await FirebaseFirestore.instance.collection("User").doc(user!.uid).get();
                    Map<String,dynamic> userdata = userdoc.data() as Map<String,dynamic>;
                    String imageurl = userdata['profile url'].toString();
                    if(userdoc.exists)
                    {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageScreen(imageurl: imageurl,)));
                    }
                    else{
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Intropage()));
                    }
    
                  }).onError((error, stackTrace) {
    
                    setState(() {
                      loading = false;
                    });
    
                    Displayerror().toastmessage(error.toString());
                  });
      
                }
