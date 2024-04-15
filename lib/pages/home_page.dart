// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final double size = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Container(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  // color: Colors.green,
                  height: 80,
                  width: size,
                  child: Stack(
                    children: [

                      CustomPaint(
                      size: Size(size, 80),
                      painter: MyCustomPainter(),
                    ),
                    
                    //icon center
                    Center(
                      heightFactor: 0.8,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 30,),
                      ),
                    ),

                    //BUTTON
                    Container(
                      height: 80,
                      width: size,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround ,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.home)),

                          IconButton(onPressed: (){}, icon: Icon(Icons.restaurant_menu_outlined)),

                          SizedBox(width: size*0.2),

                          IconButton(onPressed: (){}, icon: Icon(Icons.bookmark)),

                          IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
                        ],
                      ),
                    )

                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class MyCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    //tạo paint
    Paint paint = new Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.white;
  
  //tạo điểm đầu
  Path path = Path();
  path.moveTo(0, 20);


  //triển khai bezier
  path.quadraticBezierTo(size.width*0.2, 0, size.width*0.35, 0);
  path.quadraticBezierTo(size.width*0.4, 0, size.width*0.4, 20);
  path.arcToPoint(Offset(size.width*0.6, 20),clockwise: false, radius: Radius.circular(20));
  path.quadraticBezierTo(size.width*0.6, 0, size.width*0.65, 0);
  path.quadraticBezierTo(size.width*0.8, 0, size.width, 20);
  path.lineTo(size.width, size.height);
  path.lineTo(0, size.height);

  // vẽ
  // canvas.drawShadow(path, Colors.green,5, true);

  canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}