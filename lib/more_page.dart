import 'package:flutter/material.dart';
import 'myconsts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MorePage extends StatefulWidget {
  final String tender_id;

  MorePage(this.tender_id);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  late Map<String, dynamic> posts;
  var isLoad = false; // Условие процесса загрузки данных
  var dataEmpty = true; // Условие наличия данных
  // Получаем подробную информацию по тендеру (Выводил только 5 позиций,т.к. вывод остальных однотипный)
  _Post() async {
    final url = Uri.https('tenders.guru', 'api/pl/tenders/${widget.tender_id}');
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
    }
    ;
    setState(() {
      if (response.statusCode == 200) {
        posts = jsonDecode(response.body);
        dataEmpty = posts.length == 0;
      }
      ;
      isLoad = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _Post();
  }

  Widget _getCard(String name,
      {bool addIcon = false, String addAfterStr = ''}) {
    return Card(
      color: secondColor,
      child: ListTile(
        title: Text(
          '${name[0].toUpperCase() + name.substring(1).replaceAll('_', ' ')}:',
          style: TextStyle(
              fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${posts[name]} ${addAfterStr}',
          style: TextStyle(fontSize: 16, color: textColor),
        ),
        trailing: addIcon
            ? Icon(
                getCategory(
                  posts['category'],
                ),
                color: getColorCategory(posts['category']),
              )
            : null,
      ),
    );
  }

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
            ) // Indicator
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
                ) // No data
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _getCard('category', addIcon: true), // Category
                        _getCard('title'), // Title
                        _getCard('description'), // Description
                        _getCard('deadline_date'), // Deadline date
                        _getCard('awarded_value_eur',
                            addAfterStr: '€'), // Awarded value
                      ],
                    ),
                  ),
                ),
    );
  }
}
