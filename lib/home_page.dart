import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tenders/myconsts.dart';
import 'package:tenders/more_page.dart';
import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late Map<String, dynamic> posts;
  var data;
  var isLoad = false; // Условие процесса загрузки данных
  var dataEmpty = true; // Условие наличия данных
  // Получаем список тендеров по url
  _Post() async {
    final url = Uri.https('tenders.guru', 'api/pl/tenders', {'page': '1'});
    setState(() {
      isLoad = true;
    });

    var response;
    try {
      response = await http.get(url, headers: {'Accept': 'application/json'});
    } catch (error) {
      setState(() {
        isLoad = false;
      });
      return;
    };
    setState(() {
      if (response.statusCode == 200) {
        posts = jsonDecode(response.body);
        data = posts['data']; // Берем только сами тендеры
        dataEmpty = data.length == 0;
      }
      ;
      isLoad = false;
    });
  }

  @override
  void initState() {
    super.initState();
    HttpOverrides.global = MyHttpOverrides();
    _Post();
  }

  //}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBack,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: secondColor,
          title: Text(
            projectTitle,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
        body: isLoad
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: secondColor,
                ),
              )
            : dataEmpty
                ? Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No data',
                            style: TextStyle(color: secondColor, fontSize: 20),
                          ),
                          IconButton(
                              color: Colors.black26,
                              onPressed: () {
                                _Post();
                              },
                              icon: Icon(Icons.refresh))
                        ]),
                  )
                : ListView.builder(
                    itemCount: data != null ? data.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: secondColor,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    MorePage(data[index]['id'])));
                          },
                          title: Text(
                            data[index]['title'],
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(
                              getCategory(data[index]['category']),
                              color: getColorCategory(data[index]['category']),
                            ),
                          ],
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: Colors.white24,
                          ),
                        ),
                      );
                    })
    );
  }
}
