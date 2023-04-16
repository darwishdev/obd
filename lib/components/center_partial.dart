import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:obd/theme/constants.dart';

class CenterPartial extends StatefulWidget {
  const CenterPartial({super.key});

  @override
  State<CenterPartial> createState() => _CenterPartialState();
}

class _CenterPartialState extends State<CenterPartial> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _showContent = !_showContent;
          });
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [AppTheme.mainShadow],
                borderRadius: BorderRadius.circular(10),
                gradient: AppTheme.mainGredient),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "center name",
                        ),
                        Row(
                          children: [
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    // SizedBox(
                    //   width: 60,
                    //   child:RoundedBtn(icon: "assets/images/location.svg", text: "" , iconSize: 20,) ,
                    // ),
                    SvgPicture.asset("assets/images/phone.svg",
                        width: 25.0, height: 25.0, color: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset("assets/images/location.svg",
                        width: 25.0, height: 25.0, color: Colors.white),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
