import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Color Theme",
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.amber,
      ),
      home: MainApp(),
    ));

class MainApp extends StatefulWidget {
  MainApp({this.namaLengkap});

  final String namaLengkap;

  @override
  LoginScreen createState() => LoginScreen();
}

class LoginScreen extends State<MainApp> {
  String namaLengkapAnda;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Masuk",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 110, left: 18),
              child: Text(
                "Color Theme",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 48),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Aplikasi yang menampilkan gambar sesuai warna. Credit unsplash.com for images",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child: TextFormField(
                onChanged: (String value) {
                  setState(() {
                    namaLengkapAnda = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Nama",
                  hintText: "Masukan nama Anda",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListColorScreen(
                        namaLengkap: namaLengkapAnda,
                      );
                    }));
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.amber)),
            )
          ],
        ));
  }
}

class ListColorScreen extends StatelessWidget {
  final String namaLengkap;
  final List<int> colorList = [1, 2, 3, 4];

  ListColorScreen({this.namaLengkap});

  Widget BlockOfColor(dynamic clr, String title) {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18, top: 8),
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(5),
          color: clr),
      child: Center(
        child: Text(
          "${title}",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.white),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 24, left: 18, right: 18),
                child: Text(
                  "Selamat datang ${namaLengkap}!",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PreviewImage(
                      colorSelect: "cyan",
                    );
                  }));
                },
                child: BlockOfColor(Colors.cyan, "Cyan"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PreviewImage(
                      colorSelect: "amber",
                    );
                  }));
                },
                child: BlockOfColor(Colors.amber, "Amber"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PreviewImage(
                      colorSelect: "red",
                    );
                  }));
                },
                child: BlockOfColor(Colors.red, "Red"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PreviewImage(
                      colorSelect: "pink",
                    );
                  }));
                },
                child: BlockOfColor(Colors.pink, "Pink"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PreviewImage(
                      colorSelect: "green",
                    );
                  }));
                },
                child: BlockOfColor(Colors.green, "Green"),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class PreviewImage extends StatelessWidget {
  String colorSelect;
  PreviewImage({this.colorSelect});

  final List<String> pictureList = ["1", "2", "3", "4", "5"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        backgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: ListView(
          children: pictureList.map((number) {
            return Image.network(
                "https://pianlaksanateknologi.com/test/img/${colorSelect}/${colorSelect}${number}.jpg");
          }).toList(),
        ),
      ),
    );
  }
}

// class MainApp extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title: "Color Theme",
//     theme: ThemeData(
//       backgroundColor: Colors.white,
//       primarySwatch: Colors.amber,
//     ),
//     home: SafeArea(
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 "Masuk",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Container(
//                   margin: const EdgeInsets.only(top: 110, left: 18),
//                   child: Text(
//                     "Color Theme",
//                     style: TextStyle(
//                         fontFamily: "Poppins",
//                         fontWeight: FontWeight.bold,
//                         fontSize: 48),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 18),
//                   child: Text(
//                     "Aplikasi yang menampilkan gambar sesuai warna.",
//                     style: TextStyle(
//                         fontFamily: "Poppins",
//                         fontWeight: FontWeight.normal,
//                         fontSize: 18),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 36,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 18),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       labelText: "Nama",
//                       hintText: "Masukan nama Anda",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 18),
//                   child: ElevatedButton(
//                       onPressed: () {},
//                       child: Text(
//                         "Masuk",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       style: ElevatedButton.styleFrom(primary: Colors.amber)),
//                 )
//               ],
//             ))),
//   );
// }
// }

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Color Theme',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
