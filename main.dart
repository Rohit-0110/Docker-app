import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String cmd;
  late String data = "OUTPUT";
  void cgi() async {
    var r = await http.get(
        Uri.http("192.168.0.110", "/cgi-bin/flutterdocker.py", {"x": cmd}));
    data = r.body.toString();
    setState(() {
      // ignore: unnecessary_statements
      data;
      print(data);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Docker-App"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/7/79/Docker_%28container_engine%29_logo.png"),
                width: 400,
                height: 200,
                // decoration: BoxDecoration(
                //  borderRadius: BorderRadius.circular(10),
                //),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  onChanged: (value) {
                    cmd = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Your Command",
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: cgi,
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Container(),
              Container(
                  padding:
                      EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                  width: 1000,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[400],
                  ),
                  child: Center(
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            "$data",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
