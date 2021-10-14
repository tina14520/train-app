import 'package:flutter/material.dart';
import 'train_curve.dart';
import '../constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../detail-screen.dart';
import 'package:flutter_svg/svg.dart';

class Trip extends StatefulWidget {
  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 40.0),
      child: Column(
        children: <Widget>[
          for (DisplayTrip displayTrip in Trips)
            GestureDetector(
              child: fullTripList(displayTrip),
              onTap: () {
                Navigator.pushNamed(context, DetailScreen.id);
              },
            ),
        ],
      ),
    );
  }

  // for (DisplayTrip displayTrip in Trips)
  //           fullTripList(displayTrip)

  // Widget _checkLastItem() {
  //   if () {

  //   }
  // }

  Widget fullTripList(DisplayTrip displayTrip) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    displayTrip.startCountryAb,
                    style: kCountryAbText,
                  ),
                  Text(
                    displayTrip.startCountryName,
                    style: kCountryName,
                  ),
                  SizedBox(height: 28.0),
                  Text(
                    'DATE',
                    style: kTripDate,
                  ),
                  Text(
                    displayTrip.TripDate,
                    style: kTripDateDisplay,
                  ),
                ],
              ),
            ),
            // SizedBox(width: 6.0),
            Column(
              children: <Widget>[
                CustomPaint(
                  painter: TrainCurved(bodyColor: kFloatingButton, width: 0.2),
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
                  displayTrip.TripTime,
                  style: kTripDateDisplay,
                ),
              ],
            ),
            //Spacer(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    displayTrip.destinationAb,
                    style: kCountryAbText,
                  ),
                  Text(
                    displayTrip.destinationName,
                    style: kCountryName,
                  ),
                  SizedBox(height: 28.0),
                  Text(
                    'TRIP No',
                    style: kTripDate,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      displayTrip.TripNumber,
                      style: kTripDateDisplay,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Divider(
          color: kFloatingButton,
          thickness: 0.2,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
      ],
    );
  }
}

final List<DisplayTrip> Trips = [
  DisplayTrip(
      startCountryAb: 'KHAR',
      startCountryName: 'ATBA',
      destinationAb: 'KHAR',
      destinationName: 'ATBRA',
      TripDate: 'May 19, 8:35 AM',
      TripTime: '1hr 35m',
      TripNumber: 'KB76'),
  DisplayTrip(
      startCountryAb: 'MADANI',
      startCountryName: 'ALBORT',
      destinationAb: 'MADANI',
      destinationName: 'ALBORT',
      TripDate: 'May 23, 2:15 PM',
      TripTime: '1hr 35m',
      TripNumber: 'BH07'),
  DisplayTrip(
      startCountryAb: 'KHAR',
      startCountryName: 'HALFA',
      destinationAb: 'KHAR',
      destinationName: 'HALFA',
      TripDate: 'May 29, 13:00 AM',
      TripTime: '1hr 15m',
      TripNumber: 'AJ06'),
  DisplayTrip(
      startCountryAb: 'MADANI',
      startCountryName: 'HALFA',
      destinationAb: 'MADANI',
      destinationName: 'HALFA',
      TripDate: 'May 29, 13:00 AM',
      TripTime: '1hr 15m',
      TripNumber: 'AJ06'),
];

class DisplayTrip {
  final String startCountryAb;
  final String startCountryName;
  final String destinationAb;
  final String destinationName;
  final String TripDate;
  final String TripNumber;
  final String TripTime;

  DisplayTrip(
      {@required this.startCountryAb,
      @required this.startCountryName,
      @required this.destinationAb,
      @required this.destinationName,
      @required this.TripDate,
      @required this.TripTime,
      @required this.TripNumber});
}
