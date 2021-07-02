import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Color Theme",
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.amber,
      ),
      home: MainApp(creator: "Alfian Ananda Putra",),
    ));

class MainApp extends StatefulWidget {
  final String creator;

  MainApp({this.creator});

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
        body: SingleChildScrollView(
          child: Column(
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
                  "Aplikasi yang menampilkan gambar sesuai warna, dibuat oleh: ${widget.creator}. Credit unsplash.com for images",
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
          ),
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
