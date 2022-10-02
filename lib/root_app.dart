import 'package:e_learning/pages/account_page.dart';
import 'package:e_learning/pages/course_page.dart';
import 'package:e_learning/pages/explorer_page.dart';
import 'package:e_learning/pages/home_page.dart';
import 'package:e_learning/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children: [
        HomePage(),
        CoursePage(),
        ExplorerPage(),
        AccountPage(),
      ],
    );
  }


  Widget getFooter(){
    List items = [
      "assets/images/home_icon.svg",
      "assets/images/play_icon.svg",
      "assets/images/rocket_icon.svg",
      "assets/images/user_icon.svg"
    ];
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 100,
      decoration: BoxDecoration(
        color: textWhite,
        boxShadow: [BoxShadow(
          color: textBlack.withOpacity(0.12),
          blurRadius: 30,
          offset: Offset(0, -10)
        )]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index){
            return InkWell(
              onTap: (){
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  SvgPicture.asset(items[index],height: 17.5,
                    color: pageIndex == index ? primary:secondary,),
                  SizedBox(height: 15,),
                  pageIndex == index ? AnimatedContainer(duration: Duration(microseconds: 500),
                    child: Container(
                      height: 5,
                      width: 20,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(100)
                      ),
                    ),
                  ) : Container()
                ],
              ),
            );
          })

        ),
      ),
    );
  }
}
