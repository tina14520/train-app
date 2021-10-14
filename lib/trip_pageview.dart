import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'display/train_curve.dart';

class TRIPPageView extends StatefulWidget {
  @override
  _TRIPPageViewState createState() => _TRIPPageViewState();
}

class _TRIPPageViewState extends State<TRIPPageView> {
  final Widget svgTrainImage = Image.asset(
    "assets/trian.png",
    height: 25,
    width: 25,
  );

  @override
  Widget build(BuildContext context) {
    bool changeCardColor = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 70.0,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              tripDays(day: 'TUE', dayNum: '16', isclick: false),
              tripDays(day: 'WED', dayNum: '17', isclick: false),
              tripDays(day: 'THU', dayNum: '18', isclick: false),
              tripDays(day: 'FRI', dayNum: '19', isclick: true),
              tripDays(day: 'SAT', dayNum: '20', isclick: false),
              tripDays(day: 'Sun', dayNum: '21', isclick: false),
              tripDays(day: 'MON', dayNum: '22', isclick: false),
              tripDays(day: 'TUE', dayNum: '23', isclick: false),
              tripDays(day: 'WED', dayNum: '24', isclick: false),
              tripDays(day: 'THU', dayNum: '25', isclick: false),
              tripDays(day: 'FRI', dayNum: '26', isclick: false),
              tripDays(day: 'SAT', dayNum: '27', isclick: false),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Padding(
          padding: EdgeInsets.only(left: 25.0, bottom: 10.0),
          child: Text(
            '2 Jackson Train is available ATBRA to KHAR.',
            style: TextStyle(color: Colors.white),
          ),
        ),
        // SizedBox(height: 10.0),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              GestureDetector(
                  onTap: () => changeCardColor = !changeCardColor,
                  child: card(svgTrainImage, changeCardColor)),
              GestureDetector(
                  onTap: () => changeCardColor = !changeCardColor,
                  child: card(svgTrainImage, changeCardColor)),
            ],
          ),
        ),
      ],
    );
  }

  // bool changeCardColor = false;

  Card card(Widget svgTrainImage, bool changeCardColor) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      color: changeCardColor == true ? kTextColor : kMainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Colors.white, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'MADANI',
                        style: changeCardColor == true
                            ? kCardMainText
                            : kCardMainText2,
                      ),
                      Text(
                        'KART',
                        style: changeCardColor == true
                            ? kCardSubText
                            : kCardSubTextWhite,
                      ),
                      SizedBox(height: 28.0),
                      Text(
                        'DATE',
                        style: kCardSub2,
                      ),
                      Text(
                        'MAY 19',
                        style: changeCardColor == true
                            ? kCardSubText
                            : kCardSubTextWhite,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    svgTrainImage,
                    SizedBox(height: 20.0),
                    CustomPaint(
                      painter: TrainCurved(
                          bodyColor: changeCardColor == true
                              ? kMainColor
                              : Colors.white,
                          width: 0.4),
                      child: Container(
                        //height: 0.0,
                        width: 48.0,
                        child: SvgPicture.asset(
                          'assets/train1.svg',
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                    Text(
                      '1h 35m, 8:35 AM',
                      style: kCardSub2,
                    ),
                  ],
                ),
                //Spacer(),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'ATBRA',
                        style: changeCardColor == true
                            ? kCardMainText
                            : kCardMainText2,
                      ),
                      Text(
                        'KHAR',
                        style: changeCardColor == true
                            ? kCardSubText
                            : kCardSubTextWhite,
                      ),
                      SizedBox(height: 28.0),
                      Text(
                        'TRIP No',
                        style: kCardSub2,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'K876',
                          style: changeCardColor == true
                              ? kCardSubText
                              : kCardSubTextWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Divider(
              color: kTextColor,
              thickness: 0.4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    cardPadding(
                        left: 0.0,
                        color: kTextColor,
                        icon: Ionicons.logo_apple,
                        iconColor: Colors.white),
                    cardPadding(
                        left: 20.0,
                        color: kMainColor,
                        icon: Ionicons.ios_color_filter,
                        iconColor: Colors.red),
                    cardPadding(
                        left: 40.0,
                        color: kTextColor,
                        icon: Ionicons.md_megaphone,
                        iconColor: Colors.white),
                  ],
                ),
                Spacer(),
                Text('Ticket Price', style: kTextStyle),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 3.0),
                  child: Text('\$',
                      style: changeCardColor == true
                          ? kCardMainText
                          : kCardMainText2),
                ),
                Text('170.00',
                    style: changeCardColor == true
                        ? kCardMainText
                        : kCardMainText2),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding cardPadding(
      {double left, Color color, IconData icon, Color iconColor}) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
            bottom: Radius.circular(20),
          ),
        ),
        child: Icon(icon, size: 17.0, color: iconColor),
      ),
    );
  }

  Widget tripDays(
      {@required String day, @required String dayNum, bool isclick}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      // height: 20.0,
      width: 50.0,
      padding: EdgeInsets.symmetric(vertical: 6.5),
      decoration: BoxDecoration(
        color: kMainColor,
        border: Border.all(
          width: isclick ? 0 : 1,
          color: kTextColor.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
          bottom: Radius.circular(10),
        ),
        boxShadow: isclick
            ? [
                BoxShadow(
                  color: kMainColor.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Text(day, style: isclick ? kScrollTabClicked : kScrollTabText),
          Text(
            dayNum,
            style: isclick ? kScrollTabClicked : kScrollTabText2,
            textScaleFactor: 1.8,
          ),
        ],
      ),
    );
  }
}
