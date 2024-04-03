import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../controller/homescreen_controller.dart';
import 'news_view_screeen.dart';


class NewsCard extends StatelessWidget {
  const NewsCard(
      {super.key,
        required this.title,
        required this.description,
        required this.date,
        required this.imageUrl,
        required this.content,
        required this.sourceName,
        required this.url});

  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String content;
  final String sourceName;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
         GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsViewScreen(
                      title: title,
                      description: description,
                      imageUrl: imageUrl,
                      date: date,
                      content: content,
                      sourceName: sourceName,
                      url: url,
                    ),
                  ));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString() ?? ""}"),
                    IconButton(
                        onPressed: () {
                          String newsToShare = "$title \n \n $description \n \n $url";
                          Provider.of<HomeScreenController>(context, listen: false).shareText(textToShare: newsToShare);
                        },
                        icon: const Icon(Icons.share))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}