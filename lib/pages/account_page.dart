import 'package:e_learning/datas/account_menu_json.dart';
import 'package:e_learning/theme/colors.dart';
import 'package:e_learning/theme/padding.dart';
import 'package:e_learning/widgets/custom_button_box.dart';
import 'package:e_learning/widgets/custom_heading.dart';
import 'package:e_learning/widgets/custom_place_holder.dart';
import 'package:e_learning/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
    List items = AccountMenuJson[2]['categories'];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          children: [
            SizedBox(height: spacer,),
            CustomHeading(title: "Account", subTitle: "student", color: secondary),
            SizedBox(height: spacer,),
            CustomTitle(title: "Support",extend: false,),
            SizedBox(height: spacer,),
            Column(
              children: List.generate(items.length, (index) {
                return CustomPlaceHolder(title: items[index]['title']);
              })
            ),
            SizedBox(height: spacer,),
            CustomButtonBox(title: "Sign Out",)
          ],
        ),
      ),
    );
  }
}
