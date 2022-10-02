import 'package:e_learning/datas/courses_json.dart';
import 'package:e_learning/theme/padding.dart';
import 'package:e_learning/widgets/custom_heading.dart';
import 'package:e_learning/widgets/custom_my_courses_card.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: getBody(),
    );
  }


  Widget getBody(){
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          children: [
            SizedBox(height: spacer,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomHeading(title: "My Course", subTitle: "Let's continue shall we?", color: textBlack),
                Text("${MyCoursesJson.length} Course", style: TextStyle(
                  fontSize: 15,
                  color: secondary,
                ),),
              ],
            ),
            SizedBox(height: spacer,),
            Column(
              children: List.generate(MyCoursesJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: CustomMyCoursesCard(image: MyCoursesJson[0]['image'], title: MyCoursesJson[0]['title'], instructor: MyCoursesJson[0]['user_name'], videoAmount: MyCoursesJson[0]['video'],percentage: MyCoursesJson[0]['percentage'],),
                );
              })


            ),

          ],
        ),
      ),
    );
  }
}
