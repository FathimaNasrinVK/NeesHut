import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/news_model.dart';


class CategoryController with ChangeNotifier {
  List<String> categoryList = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];
  String category = "business";

  onTap({required int index}) {
    // category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  late NewsModel newsModel;
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=27c6448a90324601a9dce87868f2e278");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
