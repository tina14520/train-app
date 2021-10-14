import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';

class TripPage extends StatefulWidget {
  @override
  _TripPageState createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[for (Trip trip in availableTrip) tripDays(trip)],
    );
  }
}

Widget tripDays(Trip trip) {
  return Container(
    height: 20.0,
    width: 20.0,
    padding: EdgeInsets.symmetric(horizontal: 32),
    decoration: BoxDecoration(
      color: kMainColor,
      border: Border.all(
        width: 1,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      ),
    ),
    child: Column(
      children: [
        Text(trip.day, style: kTextStyle),
        Text(trip.dayNum, style: kTextStyle),
      ],
    ),
  );
}

final List<Trip> availableTrip = [
  Trip(day: 'TUE', dayNum: '13'),
  Trip(day: 'WED', dayNum: '14'),
  Trip(day: 'THU', dayNum: '15'),
  Trip(day: 'FRI', dayNum: '16'),
  Trip(day: 'SAT', dayNum: '17'),
  Trip(day: 'SUN', dayNum: '18'),
  Trip(day: 'MON', dayNum: '19'),
];

class Trip {
  final String day;
  final String dayNum;
  Trip({@required this.day, @required this.dayNum});
}
