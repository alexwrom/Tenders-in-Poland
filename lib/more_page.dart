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
                        Card(
                          color: secondColor,
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Category:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child:
                                    Icon(getCategory(posts['category']),
                                        color: getColorCategory(posts['category'])),
                                )
                              ],
                            ),
                          ),
                        ), // Category
                        Card(color: secondColor,
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Title:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '${posts['title']}',
                                    style:
                                        TextStyle(fontSize: 20, color: textColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ), // Title
                        Card(color: secondColor,
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Description:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '${posts['description']}',
                                    style:
                                        TextStyle(fontSize: 20, color: textColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ), // Description
                        Card(color: secondColor,
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Deadline date:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '${posts['deadline_date']}',
                                    style:
                                        TextStyle(fontSize: 20, color: textColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ), // Deadline date
                        Card(color: secondColor,
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Awarded value:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '€ ${posts['awarded_value_eur']}',
                                    style:
                                        TextStyle(fontSize: 20, color: textColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ), // Awarded value
                      ],
                    ),
                  ),
                ),
    );
  }
}
