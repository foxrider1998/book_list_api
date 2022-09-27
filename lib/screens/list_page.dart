// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:ffi';

import 'package:app_api/model/model.dart';
import 'package:app_api/screens/detail_page.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  dynamic bookTitleColor = Colors.blue;
  BooksApiModel? bookList;
  fetchBookApi() async {
    var url = Uri.parse('https://api.itbook.store/1.0/new');
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final jsonBookList = jsonDecode(response.body);
    bookList = BooksApiModel.fromJson(jsonBookList);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBookApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("List of books"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
            child: bookList == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: bookList!.books!.length,
                    itemBuilder: (context, index) {
                      dynamic currentBook = bookList!.books![index];
                      if (currentBook.subtitle == "") {
                        currentBook.subtitle = "this book has no subtitle";
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                currentBook.image!,
                                height: 100,
                                width: 100,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: bookTitleColor),
                                          overflow: TextOverflow.ellipsis,
                                          "${currentBook.title}",
                                          textAlign: TextAlign.left,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          "${currentBook.subtitle}",
                                        )),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              color: Colors.amber,
                                              child: Text(
                                                textAlign: TextAlign.end,
                                                "${currentBook.price}",
                                              ))
                                        ]),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  )),
      ),
    );
  }
}
