import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreenController with ChangeNotifier {
  late NewsModel newsModel;
  bool isLoading = false;


  fetchData() async {
    isLoading = true;
    // notifyListeners();
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=27c6448a90324601a9dce87868f2e278");
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {}; // map for storing response body
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }

  // functions to launch url
  Future<void> launchURL(String url) async {
    final Uri url1 = Uri.parse(url);
    try {
      if (!await launchUrl(url1,mode: LaunchMode.inAppWebView)) {
        await launchUrl(url1,mode: LaunchMode.inAppWebView);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
    notifyListeners();
  }


  //to share the news

  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
    notifyListeners();
  }





}