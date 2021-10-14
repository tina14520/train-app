import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../constants.dart';
import 'display/train_curve.dart';

class SeatPage extends StatefulWidget {
  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  final Widget svgTrainImage = SvgPicture.asset(
    'assets/train1.svg',
    height: 20,
    width: 25,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(200.0, 800.0),
                      topRight: Radius.elliptical(200, 800.0)),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: kTextColor.withOpacity(0.2),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        svgTrainImage,
                        SizedBox(height: 6),
                        Text(
                          'May 19',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '8:35 AM',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 30.0),
                        // Text(
                        //   'Economy Class',
                        //   style: TextStyle(color: kFloatingButton),
                        // ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: [
                                  for (var i = 0; i < 2; i++)
                                    buildNumSeat(
                                        firstcolor: Colors.transparent,
                                        firstborder:
                                            kTextColor.withOpacity(0.4),
                                        secColor: Colors.transparent,
                                        secborder: kFloatingButton),
                                  buildNumSeat(
                                      firstcolor: kFloatingButton,
                                      firstborder: kTextColor.withOpacity(0.4),
                                      secColor: Colors.transparent,
                                      secborder: kTextColor.withOpacity(0.4)),
                                  for (var i = 0; i < 6; i++)
                                    buildNumSeat(
                                        firstcolor: Colors.transparent,
                                        firstborder:
                                            kTextColor.withOpacity(0.4),
                                        secColor: Colors.transparent,
                                        secborder: kFloatingButton),
                                ],
                              ),
                              Column(
                                children: [
                                  for (var i = 0; i < 9; i++)
                                    buildNumSeat(
                                        firstcolor: Colors.transparent,
                                        firstborder: kFloatingButton,
                                        secColor: Colors.transparent,
                                        secborder: kTextColor.withOpacity(0.4)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Text(
                  'ATBRA',
                  style: kCountryAbText,
                ),
                Text('KHAR', style: kCountryName),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                CustomPaint(
                  painter: TrainCurved(bodyColor: kFloatingButton, width: 0.2),
                  child: Container(
                    //height: 0.0,
                    width: 48.0,
                    child: Icon(
                      Entypo.arrow_bold_left,
                      color: kFloatingButton,
                    ),
                  ),
                ),
                Text(
                  '1hr 35m',
                  style: kTripDateDisplay,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'KHAR',
                  style: kCountryAbText,
                ),
                Text('KHAR', style: kCountryName),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'TRIP No',
                  style: kTripDate,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'K876',
                    style: kTripDateDisplay,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text('19 A', style: kCountryAbText),
                Text('Seat', style: kCountryName),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNumSeat(
      {Color firstcolor, Color firstborder, Color secColor, Color secborder}) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
          width: 25.0,
          height: 30.0,
          padding: EdgeInsets.symmetric(vertical: 6.5),
          decoration: BoxDecoration(
            color: firstcolor,
            border: Border.all(
              width: 1,
              color: firstborder,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(7),
              bottom: Radius.circular(6),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
          // height: 20.0,
          width: 25.0,
          height: 30.0,
          padding: EdgeInsets.symmetric(vertical: 6.5),
          decoration: BoxDecoration(
            color: secColor,
            border: Border.all(
              width: 1,
              color: secborder,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(7),
              bottom: Radius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
