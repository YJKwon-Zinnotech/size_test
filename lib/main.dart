import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1920,
        minWidth: 1080,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.autoScale(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyWidget(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('A LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOONG TEXT', style: TextStyle(fontSize: 34),),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}

class MyWidgetState extends State<MyWidget> {
  // variable to hold the
  // value of coordinate x.
  double posx = 0;

  // variable to hold the
  // value of coordinate y.
  double posy = 0;
  String Txt  = "Tap Here To Start!";

  // Method to find the coordinates and
  // setstate method that will set the value to
  // variable posx and posy.
  void onTapDown(BuildContext context, TapDownDetails details) {
    // creating instance of renderbox
    final RenderBox box = context.findRenderObject()as RenderBox;
    // find the coordinate
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    setState(() {
      posx = localOffset.dx;
      posy = localOffset.dy;
      // this string contain the x and y coordinates.
      Txt  ='Tapped\nX:$posx \nY:$posy';
    });
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector that will detect the ontap
    return GestureDetector(
      onTapDown: (TapDownDetails details) => onTapDown(context, details),
      child: Stack(fit: StackFit.expand, children: <Widget>[
        Container(color: Colors.white),
        Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png'),
        Positioned(
          // show the coordinates.
          child: Text(Txt),
          left: posx,
          top: posy,
        )
      ]),
    );
  }
}
