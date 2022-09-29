// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:app_api/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:http/http.dart' as http;

class DetailBook extends StatefulWidget {
  String bookSelected;

  DetailBook({
    super.key,
    required this.bookSelected,
  });

  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
  dynamic bookTitleColor = Colors.blue;
  DetailBookData? bookList;

  fetchBookApi() async {
    var url =
        Uri.parse('https://api.itbook.store/1.0/books/${widget.bookSelected}');
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});

    final jsonBookList = jsonDecode(response.body);
    bookList = DetailBookData.fromJson(jsonBookList);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchBookApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List of books"),
        ),
        body: Center(
          child: Container(
              child: bookList == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            bookList!.title!,
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(children: [
                          Expanded(
                              flex: 1,
                              child: Image.network(
                                bookList!.image!,
                                width: 250,
                              )),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bookList!.authors!,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  bookList!.price!,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.green),
                                ),
                                RatingBarIndicator(
                                  rating: (double.parse(bookList!.rating!)),
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 25.0,
                                  direction: Axis.horizontal,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  bookList!.year!,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  bookList!.isbn10!,
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          )
                        ]),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.blue,
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("buy")),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(bookList!.desc!),
                            Text(bookList!.authors!),
                            Text(bookList!.isbn10!),
                            Text(bookList!.price!),
                            Text(bookList!.language!),
                            Text(bookList!.rating!),
                            Text(bookList!.year!),
                          ],
                        )
                      ],
                    )),
        ));
  }
}
