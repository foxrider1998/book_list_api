import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/model.dart';

Future<BooksApiModel> fetchBookApi() async {
  var url = Uri.parse('https://api.itbook.store/1.0/new');
  var response =
      await http.post(url, body: {'name': 'doodle', 'color': 'blue'});

  final jsonBookList = jsonDecode(response.body);
  var bookList = BooksApiModel.fromJson(jsonBookList);

  return (bookList);
}
