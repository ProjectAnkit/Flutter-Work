//BottomNavigators

isHomePage? Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                decoration:  BoxDecoration(color: Colors.white,boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -0.5),
                    color: Colors.grey.shade300,
                    spreadRadius: 1
                  )
                ]),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       
                         InkWell(
                          onTap: () async {
                           
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade400),
                                color: Colors.white),
                            child: const Center(
                              child: Icon(
                                Icons.support_agent_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),


                        InkWell(
                          onTap: () async {

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartPage()));
                           
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade400),
                                color: Colors.white),
                            child: const Center(
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),


                        InkWell(
                          onTap: () async {
                           
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade400),
                                color: Colors.white),
                            child: const Center(
                              child: Icon(
                                Icons.favorite,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),



                         InkWell(
                          onTap: () async {
                            
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade400),
                                color: Colors.white),
                            child: const Center(
                              child: Icon(
                                Icons.question_mark,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),



                         InkWell(
                          onTap: () async {
                            final user = auth.currentUser;
                            final userdata = await firestore
                                .collection("User")
                                .doc(user!.phoneNumber)
                                .get();
                            Map<String, dynamic> usermap =
                                userdata.data() as Map<String, dynamic>;
                            String name = usermap["name"].toString();
                            String phoneNumber =
                                usermap["phoneNumber"].toString();
                            String email = usermap["email"].toString();

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                          name: name,
                                          phoneNumber: phoneNumber,
                                          email: email,
                                        )));
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade400),
                                color: Colors.white),
                            child: const Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ):Container(),



//Using of Shimmer on LoadingImages with CachedNetworkImage
                      Container(
                            height: 220,
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: CachedNetworkImage(
                                   imageUrl: widget.productmodel.image.toString(),
                                   placeholderFadeInDuration: const Duration(milliseconds: 100),
                                   placeholder: (context, url) => 
                                   Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.white60,
                                     child: Container(
                                        height: 220,
                                        decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(10)),
                                      ),
                                   ),
                                  ),
                            ),
                          ),
                        
