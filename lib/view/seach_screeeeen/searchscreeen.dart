import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/utils/colors.dart';

import 'package:provider/provider.dart';

import '../../controller/search_screeeen-controller.dart';
import '../widgets/news_card.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider = Provider.of<SearchScreenController>(context);
    return Scaffold(

      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 45,
                      width: MediaQuery.sizeOf(context).width * 2 / 3.3,
                      child: TextField(
                        cursorColor: AppColor.primary,
                        controller: textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: AppColor.primary, width: 6)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(

                        onPressed: () {
                          provider.searchData(searchText: textController.text.toLowerCase());
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        style:ElevatedButton.styleFrom(minimumSize: Size(200, 33),backgroundColor: AppColor.primary),

                        child:  Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Provider.of<SearchScreenController>(context).isLoading ==
                      true
                      ? Center(
                      child: LottieBuilder.asset(
                        "assets/animations/Animation - 1702395258490 (2).json",
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                      ))
                      :  GridView.builder(
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),


                    itemBuilder: (context, index) => NewsCard(
                      title: provider.newsModel?.articles?[index].title.toString() ?? "",
                      description: provider.newsModel?.articles?[index].description
                          .toString() ??
                          "",
                      date:
                      provider.newsModel?.articles?[index].publishedAt,
                      imageUrl: provider
                          .newsModel?.articles?[index].urlToImage
                          .toString() ??
                          "",
                      content: provider.newsModel?.articles?[index].content
                          .toString() ??
                          "",
                      sourceName: provider
                          .newsModel?.articles?[index].source?.name
                          .toString() ??
                          "",
                      url: provider.newsModel?.articles?[index].url
                          .toString() ??
                          "",
                    ),

                    itemCount: provider.newsModel?.articles?.length ?? 0,  ),
                )
              ],
            ),
          )),
    );
  }
}