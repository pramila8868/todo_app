import 'package:flutter/material.dart';

//import 'package:todo_app1/home_page.dart';
class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //width: 500,
          // height: 600,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent.shade400, Colors.purpleAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter),
          ),
        ),
        Positioned(
          top: -18,
          left: -47,
          child: Opacity(
            opacity: 0.7,
            child: Image.asset("assets/Image/fullcircle.png",
                width: MediaQuery.of(context).size.width * 0.5),
          ),
        ),
        // SizedBox(width: 50,),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //            children:[   Image.asset("assets/Image/listimage.png"),]
        // ),
        Positioned(
          top: 0,
          left: 90,
          child: Image.asset(
            "assets/Image/listimage.png",
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        //Positioned(
        // top: 0,
        // child:
        Positioned(
          top: 50,
          left: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "To",
                style: TextStyle(
                  fontSize: 27,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Do",
                style: TextStyle(
                  fontSize: 27,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Me",
                style: TextStyle(fontSize: 27),
              )
            ],

            //),
          ),
        ),

        // Image.asset("assets/Image/listimage.png"),

        Positioned(
          bottom: -18,
          left: -60,
          child: Opacity(
            opacity: 0.7,
            child: Image.asset("assets/Image/fullcircle.png",
                width: MediaQuery.of(context).size.width * 0.5),
          ),
        ),
        Positioned(
          top: 200,
          right: -60,
          //left: -60,
          child: Opacity(
            opacity: 0.7,
            child: Image.asset("assets/Image/fullcircle.png",
                width: MediaQuery.of(context).size.width * 0.5),
          ),
        ),
      ],
    );
  }
}
