import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/news_model.dart';

class SearchScreenController with ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async {
    isLoading = true;


    final url = Uri.parse("https://newsapi.org/v2/everything?q=$searchText&language=en&sortBy=popularity&apiKey=27c6448a90324601a9dce87868f2e278");

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(decodedData);
      } else {
        print("Api failed");
        // handle the failure case as needed
      }
    } catch (e) {
      print("Error: $e");
      // handle the error case as needed
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}