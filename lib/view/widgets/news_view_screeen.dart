import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../controller/homescreen_controller.dart';

class NewsViewScreen extends StatelessWidget {
  const NewsViewScreen(
      {super.key,
        required this.title,
        required this.description,
        this.date,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.primary, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                const TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString()}")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 40 / 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ),
              Text(
                "$description",
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Text(
                  "$content",
                  style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Provider.of<HomeScreenController>(context, listen: false)
                      .launchURL(url);
                },
                child: const Text(
                  "Click here to read more",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}