
import 'package:e_learning/datas/category_json.dart';
import 'package:e_learning/datas/courses_json.dart';
import 'package:e_learning/datas/user_profile.dart';
import 'package:e_learning/theme/colors.dart';
import 'package:e_learning/theme/padding.dart';
import 'package:e_learning/widgets/clipper.dart';
import 'package:e_learning/widgets/custom_button_box.dart';
import 'package:e_learning/widgets/custom_categories_button.dart';
import 'package:e_learning/widgets/custom_category_card.dart';
import 'package:e_learning/widgets/custom_course_card.dart';
import 'package:e_learning/widgets/custom_heading.dart';
import 'package:e_learning/widgets/custom_promotion_card.dart';
import 'package:e_learning/widgets/custom_search_field.dart';
import 'package:e_learning/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(preferredSize: Size.fromHeight(0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      ),
      body: getBody(),
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                  width: size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: secondary
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: appPadding, right: appPadding),
                child: Column(
                  children: [
                    SizedBox(height: spacer+24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomHeading(
                            title: "Hi, Syafiqah",
                            subTitle: "Let's start learning",
                            color: textWhite),
                        Container(
                          height: spacer,
                          width: spacer,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset("assets/images/user_profile.jpg"),
                          ),
                        )
                      ],
                    ),
                    
                    SizedBox(height: spacer,),
                    
                    CustomSearchField(
                      hintField: "Try 'Web Design'",
                      backgroundColor: background,
                    ),

                    SizedBox(height: spacer-30,)
                    // CustomCategoryCard(),

                  ],
                ),
              )
            ],
          ),
          SizedBox(height: spacer,),
          CustomPromotionCard(),
          SizedBox(height: spacer,),
          Padding(
            padding: const EdgeInsets.only(left: appPadding,right: appPadding),
            child: CustomTitle(title: "Feature Course"),
          ),
          SizedBox(height: smallSpacer,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: appPadding,
                  top: 10,
                  bottom: 30
              ),
              child: Wrap(
                spacing: 10,
                children: List.generate(CoursesJson.length, (index){
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomCourseCardExpand(
                      thumbNail: CoursesJson[index]['image'],
                      videoAmount: CoursesJson[index]['video'],
                      title: CoursesJson[index]['title'],
                      userProfile: CoursesJson[index]['user_profile'],
                      userName: CoursesJson[index]['user_name'],
                      price: CoursesJson[index]['price'],
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: spacer-30,),
          Padding(
            padding: const EdgeInsets.only(left: appPadding,right: appPadding),
            child: CustomTitle(title: "Categories"),
          ),
          SizedBox(height: smallSpacer,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(CategoryJson.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: CustomCategoriesButton(title: CategoryJson[index]['title']),
                      );
                    }),
                  ),
                  Row(
                    children: List.generate(CategoryJson2.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: CustomCategoriesButton(title: CategoryJson2[index]['title']),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacer,),
          Padding(
            padding: const EdgeInsets.only(left: appPadding,right: appPadding),
            child: CustomTitle(title: "Design Course"),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: appPadding,
                  top: 10,
                  bottom: 30
              ),
              child: Wrap(
                spacing: 10,
                children: List.generate(CoursesJson.length, (index){
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomCourseCardExpand(
                      thumbNail: CoursesJson[index]['image'],
                      videoAmount: CoursesJson[index]['video'],
                      title: CoursesJson[index]['title'],
                      userProfile: CoursesJson[index]['user_profile'],
                      userName: CoursesJson[index]['user_name'],
                      price: CoursesJson[index]['price'],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
