import 'package:designidea/testController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final C = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          C.isSize.value = !C.isSize.value;
        },
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.red,
        child: Column(children: [
          Obx( 
            () => AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: C.isSize.value ? Get.height * 0.3 : Get.height,
              child: FittedBox(
                alignment: Alignment.topCenter,
                fit: BoxFit.fitHeight,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.yellow,
                      height: Get.height,
                      width: Get.width,
                    ),
                    Positioned(
                        right: 10,
                        bottom: 100,
                        child: IconButton(
                            onPressed: () {
                              C.isSize.value = !C.isSize.value;
                            },
                            icon: Icon(Icons.comment)))
                  ],
                ),
              ),
            ),
          ),
          Flexible(
              child: Obx(
            () => AnimatedContainer(
                duration: Duration(milliseconds: 200),
                color: Colors.black,
                height: C.isSize.value ? Get.height * 0.70 : 0,
                width: Get.width),
          ))
        ]),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   final C = Get.put(TestController());
//   @override
//   Widget build(BuildContext context) {
//     // final hvertransform = Matrix4.identity()..scale(0, 0, 0);
//     // final transform = C.isSize.value ? hvertransform : Matrix4.identity();
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           C.isSize.value = !C.isSize.value;
//         },
//       ),
//       body: Column(
//         children: [
//           Obx(
//             () => TweenAnimationBuilder<double>(
//                 duration: Duration(milliseconds: 200),
//                 tween: Tween<double>(
//                     end: C.isSize.value ? 0.25 : 1,
//                     begin: C.isSize.value ? 1 : 0.25),
//                 builder: (context, anm, child) {
//                   return Column(
//                     children: [
//                       AnimatedContainer(
//                         duration: Duration(milliseconds: 200),
//                         transform: Matrix4.identity()..scale(anm, anm),
//                         height: Get.height,
//                         width: Get.width,
//                         color: Colors.yellow,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                                 right: 10,
//                                 bottom: 100,
//                                 child: IconButton(
//                                     onPressed: () {
//                                       C.isSize.value = !C.isSize.value;
//                                     },
//                                     icon: Icon(Icons.comment)))
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//           ),
//           Expanded(
//               child: Container(
//             width: Get.width,
//             color: Colors.black,
//             child: Column(
//               children: [],
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
