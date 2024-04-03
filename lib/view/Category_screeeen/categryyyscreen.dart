import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/category_controller.dart';
import '../../utils/colors.dart';
import '../widgets/news_card.dart';


class CategoryScreen extends StatelessWidget {
  void fetchData(BuildContext context) async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Consumer<CategoryController>(
        builder: (context, provider, child) {
      return DefaultTabController(
          length: provider.categoryList.length,
          initialIndex: 0,
          child: Scaffold(
          appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.primary,
          titleTextStyle: const TextStyle(
          color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600),
    title: const Text("Categories"),
        bottom: TabBar(
          labelStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
          unselectedLabelStyle: const TextStyle(
              color: AppColor.primary,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          overlayColor: const MaterialStatePropertyAll(Colors.grey),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.circular(6)),
          isScrollable: true,
          tabs: List.generate(
            provider.categoryList.length,
                (index) => Tab(
              text: provider.categoryList[index].toUpperCase(),
            ),
          ),
          onTap: (value) {
            provider.onTap(index: value);
          },
        ),
      ),
            body: provider.isLoading == true
                ? Center(
                child: LottieBuilder.asset(
                  "assets/animations/newsloading.json",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ))
                : Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),


                itemBuilder: (context, index) => NewsCard(
                  title: provider.newsModel.articles?[index].title.toString() ?? "",
                  description: provider.newsModel.articles?[index].description
                      .toString() ??
                      "",
                  date:
                  provider.newsModel.articles?[index].publishedAt,
                  imageUrl: provider
                      .newsModel.articles?[index].urlToImage
                      .toString() ??
                      "",
                  content: provider.newsModel.articles?[index].content
                      .toString() ??
                      "",
                  sourceName: provider
                      .newsModel.articles?[index].source?.name
                      .toString() ??
                      "",
                  url: provider.newsModel.articles?[index].url
                      .toString() ??
                      "",
                ),

                itemCount: provider.newsModel.articles?.length ?? 0,  ),
            ),
          ),
      );
        },
    );
  }
}
