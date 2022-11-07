import 'package:flutter/material.dart';
//import 'package:flutter_application_1/pages/getroutes.dart';
import 'package:flutter_application_1/pages/signin_page.dart';
//import 'package:flutter/services.dart';

//import 'package:todo_app1/pages/list_item_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//import '../controller/signup_controller.dart';
import '../controller/signup_controller.dart';
import 'background.dart';
//import 'package:gender_picker/gender_picker.dart';

//import '../controller/login_controller.dart';
//import 'package:responsive_sizer/responsive_sizer.dart';
//import ''
/*class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blue.shade800,
       body: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
               colors: [
                 Colors.blueAccent.shade400,
                 Colors.purpleAccent
               ],
               begin: Alignment.bottomLeft,
               end: Alignment.topCenter),


         ),

        child:Row(
             //mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Container(
                 margin:  EdgeInsets.symmetric(vertical: 10.0,),
                // alignment: Alignment.topLeft,
                 child: Image.asset("assets/Image/fullcircle.png",height: 150,width: 150,alignment: Alignment.topLeft,scale: 5,),
               ),


               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                     [

                   Row(
                     children: [
                       Container(
                         height: 180,
                         child: Image.asset("assets/Image/listimage.png"),
                       ),
                     //],
                   //),
             //   ],
              //),

               Column(
                 children: [
                   Text("To"),
                   SizedBox(height: 20,),
                   Text("Do"),
                   SizedBox(height: 20,),
                   Text("Me")

                       ],
               ),
      ]
    ),
    ],
    ),
],
        ),

child: Container(
child:   Column(
  children: [
    Image.asset("assets/Image/fullcircle.png",height: 150,width: 150,alignment: Alignment.topLeft,scale: 5,)
    ]

    ),
  )
  ],
)
             //],
           ),


 /*child: AspectRatio(
   aspectRatio: 15/6,
   // 487/451,
   child: Container(
     decoration: BoxDecoration(
       image: DecorationImage(
        // fit: BoxFit.fitWidth,
         alignment: FractionalOffset.topLeft,
         //Image.asset("assets/Image/fullcircle.png",height: 150,width: 200,alignment: Alignment.topLeft,),
         image: AssetImage("assets/Image/fullcircle.png")
       )
     ),
   ),
 ),*/


   //    ),



        );

  }

 */
class HomePage extends StatelessWidget {
  final String? hint;
  final bool? obsecure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  // final  Widget child;
  HomePage({
    Key? key,
    this.hint,
    this.obsecure = false,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center,
        children: [
          const Background(),
          SingleChildScrollView(
              child: GetBuilder<SignupController>(builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 180,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    height: 500,
                    width: 300,

                    // height:MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                    child: Opacity(
                      opacity: 0.9,
                      child: Card(
                        color: Colors.white70,
                        elevation: 8,
                        // shadowColor: Colors.black,

                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: const BorderSide(color: Colors.white)),
                        child: ListTile(
                            title: Column(children: [
                          const Text(
                            "Create New Account",
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.end,

                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    width: 60,
                                    height: 70,
                                    child: SvgPicture.string(
                                      '<svg viewBox="108.0 259.0 35.5 35.4" ><path transform="translate(100.64, 251.28)" d="M 27.49029922485352 7.715988159179688 L 42.8846435546875 7.715988159179688 L 42.85090255737305 23.28578186035156 L 37.57217025756836 18.00868797302246 L 32.59705352783203 22.98380279541016 C 33.7138786315918 24.94753074645996 34.35665130615234 27.21324348449707 34.35665130615234 29.63247299194336 C 34.35665130615234 37.08586883544922 28.31700706481934 43.12889099121094 20.86024284362793 43.12889099121094 C 13.4068489074707 43.12889099121094 7.36383056640625 37.08586883544922 7.36383056640625 29.63247299194336 C 7.36383056640625 22.17908096313477 13.4068489074707 16.13606452941895 20.86024284362793 16.13606452941895 C 23.4329948425293 16.13606452941895 25.83029365539551 16.86993217468262 27.87837791442871 18.12003898620605 L 32.80119323730469 13.1331148147583 L 27.49035453796387 7.715992450714111 Z M 14.11372470855713 29.63415908813477 C 14.11372470855713 33.36085510253906 17.13523292541504 36.38236236572266 20.86192893981934 36.38236236572266 C 24.588623046875 36.38236236572266 27.61013221740723 33.36085510253906 27.61013221740723 29.63415908813477 C 27.61013221740723 25.9074592590332 24.588623046875 22.88595390319824 20.86192893981934 22.88595390319824 C 17.13523292541504 22.88595390319824 14.11372470855713 25.9074592590332 14.11372470855713 29.63415908813477 Z" fill="#a232da" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 20,
                                ),
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  // padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                                  child: Card(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      child: // Icon(Icons.local_car_wash_rounded,size: 70,),
                                          Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        width: 65,
                                        height: 60,
                                        child: SvgPicture.string(
                                          '<svg viewBox="225.0 259.0 20.5 34.7" ><path transform="translate(214.71, 254.18)" d="M 23.15934371948242 24.99068641662598 L 23.15934371948242 29.21538925170898 L 28.28594779968262 29.21538925170898 L 28.28594779968262 34.34199905395508 L 23.15934371948242 34.34199905395508 L 23.15934371948242 39.46859741210938 L 17.95447731018066 39.46859741210938 L 17.95447731018066 34.34199905395508 L 12.82915687561035 34.34199905395508 L 12.82915687561035 29.21538925170898 L 17.95447731018066 29.21538925170898 L 17.95447731018066 24.97529029846191 C 13.54759788513184 23.82706451416016 10.29151153564453 19.83200836181641 10.29151153564453 15.06719303131104 C 10.29151153564453 9.405604362487793 14.88184928894043 4.81526517868042 20.5434398651123 4.81526517868042 C 26.20630836486816 4.81526517868042 30.79408264160156 9.405604362487793 30.79408264160156 15.06719303131104 C 30.79408264160156 19.85125160217285 27.59187889099121 23.85785675048828 23.15933990478516 24.99068641662598 Z M 20.54344177246094 9.941868782043457 C 17.71200752258301 9.941868782043457 15.41683578491211 12.23575592041016 15.41683578491211 15.0671911239624 C 15.41683578491211 17.89734268188477 17.71200561523438 20.19251251220703 20.54344177246094 20.19251251220703 C 23.37487602233887 20.19251251220703 25.67004776000977 17.89734268188477 25.67004776000977 15.0671911239624 C 25.67004776000977 12.23575592041016 23.37487602233887 9.941868782043457 20.54344177246094 9.941868782043457 Z" fill="#a232da" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                          allowDrawingOutsideViewBox: true,
                                        ),
                                      )),
                                ),
                              ]),
                          TextFormField(
                            controller: controller.nameController,
                            // obscureText: obsecure,
                            obscureText: true,
                            // keyboardType: Keyboard.number,
                            //keyboardType: keyboardType,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)),
                              labelText: "Username",
                              //  controller: controller.nameController,

                              // hintText: hint,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.purple, width: 2.0),
                                //   labelText: "Username",
                                // fillColor: Colors.purple
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Email address",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.purple, width: 2.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: controller.passwordController,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Password",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.purple, width: 2.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: controller.conformPasswordController,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Re-enter Password",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.purple, width: 2.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            onPressed: () {
                              controller.checkSignup();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ListItem()));
                              // Get.to(ListItem());
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            color: Colors.purple,
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already an user?"),
                              TextButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             SigninPage()));
                                    // Get.toNamed(GetRoutes.login);
                                    Get.to(SigninPage());
                                  },
                                  child: const Text("SignIn"))
                            ],
                          )
                        ])),
                        //

                        //color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
            // )
          }))
        ],

        // child:child
      ),
    );
  }
}
