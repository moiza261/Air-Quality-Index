import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Location2 extends StatefulWidget {
  const Location2({Key? key}) : super(key: key);

  @override
  State<Location2> createState() => _Location2State();
}

class _Location2State extends State<Location2> {
  late double lat;
  late double long;
  String token = 'ca79ef38e45ec5e57d30209c6406357f9783fb09';
  late String url = 'https://api.waqi.info/feed/geo:$lat;$long/?token=$token';

  var postJson = [];
  fetchData() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      print(response.body);
      setState(() {
        postJson = jsonData;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                fetchData();
              });
            },
            child: Text('Click')),
      ),
    );
  }
}
