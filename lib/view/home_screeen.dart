import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:newsapp/view/widgets/news_card.dart';
import 'package:provider/provider.dart';
import '../controller/homescreen_controller.dart';

class Home extends StatelessWidget {

  void fetchData(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          elevation: 0,
          title: Row(
            children: [
              const Text(
                "News Hut",
              ),
                SizedBox(width: 10,),
                Image.asset("assets/images/hut.png",width: 16,)
            ],
          ),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20,
              fontWeight: FontWeight.w600),
          actions: [
            PopupMenuButton(

              itemBuilder: (context) {
                return [
                   PopupMenuItem(
                      child: Row(
                        children: [
                          Image.asset("assets/icons/brightness-and-contrast.png",width: 25,),

                          Text("   Theme",style: TextStyle(color: AppColor.primary),),
                        ],
                      )),
                   PopupMenuItem(child: Text("Privacy and Policy",style: TextStyle(color: AppColor.primary)),),
                   PopupMenuItem(child: Text("About",style: TextStyle(color: AppColor.primary)),)
                ];
              },
            )
          ],
        ),
        body: Consumer<HomeScreenController>(builder: (context, provider, child) {
          return provider.isLoading == true
              ? Center(
              child: LottieBuilder.asset(
                "assets/animations/newsloading.json",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ))
              : Padding(
            padding: const EdgeInsets.all(10),
            child:
            GridView.builder(
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
          );
        }));
  }
}



