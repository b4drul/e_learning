import 'package:e_learning/datas/category_json.dart';
import 'package:e_learning/theme/colors.dart';
import 'package:e_learning/theme/padding.dart';
import 'package:e_learning/widgets/custom_categories_button.dart';
import 'package:e_learning/widgets/custom_heading.dart';
import 'package:e_learning/widgets/custom_place_holder.dart';
import 'package:e_learning/widgets/custom_search_field.dart';
import 'package:e_learning/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({Key? key}) : super(key: key);

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: getBody(),
    );
  }


  Widget getBody(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: spacer,),
            CustomHeading(title: "Explorer", subTitle: "Seek for your preference", color: secondary),
            SizedBox(height: spacer,),
            CustomSearchField(hintField: "Try Web Design", backgroundColor: textWhite,),
            SizedBox(height: spacer,),
            CustomTitle(title: "Top Search",extend: false,),
            SizedBox(height: smallSpacer,),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: List.generate(CategoryJson.length, (index){
                return Container(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.5),
                        spreadRadius: 0.0,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Text(
                    CategoryJson[index]['title'],
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: smallSpacer,),
            CustomTitle(title: "Categories", extend: false,),
            SizedBox(height: smallSpacer,),
            Column(
              children: List.generate(AllCategories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomPlaceHolder(title: AllCategories[index]['title']),
                );
              })


            ),
          ],
        ),
      ),
    );
  }
}
