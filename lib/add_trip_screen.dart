import 'package:flutter/material.dart';
import 'Route_page.dart';
import 'checkout_page.dart';
import 'constants.dart';
import 'display/title.dart';

import 'seat_page.dart';
import 'trip_pageview.dart';

class AddTRIPScreen extends StatefulWidget {
  static const String id = 'add_trip_screen';
  @override
  _AddTRIPScreenState createState() => _AddTRIPScreenState();
}

class _AddTRIPScreenState extends State<AddTRIPScreen> {
  PageController _pageController;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  int currentIndex = 0;

  bool show = true;

  onChangeFunction(int index) {
    setState(() {
      currentIndex = index;
    });
    if (currentIndex == 1) {
      show = false;
      return;
    } else {
      show = true;
    }
  }

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                BuildHead(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Align(
                    alignment: Alignment(-0.9, 0),
                    child: HeadTitle(title: 'Add Trip')),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    // padding: EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06),
                        buildTab(context),
                        Expanded(
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: onChangeFunction,
                            children: <Widget>[
                              RoutePage(),
                              TRIPPageView(),
                              SeatPage(),
                              CheckOutPage(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: show
          ? Padding(
              padding: const EdgeInsets.only(right: 30.0, bottom: 5.0),
              child: FloatingActionButton(
                child: Icon(
                  Icons.chevron_right_outlined,
                  size: 35.0,
                  color: kMainColor,
                ),
                onPressed: () => nextFunction(),
                tooltip: 'Add new tasks',
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                backgroundColor: kFloatingButton,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  Widget buildTab(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
                nextFunction();
              },
              child: GestureDetector(
                child: MyTab(
                  positionIndex: 0,
                  currentIndex: currentIndex,
                  text: 'Route',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
                nextFunction();

                if (currentIndex == 1) {
                  show = false;
                  return;
                } else {
                  show = true;
                }
              },
              child: MyTab(
                positionIndex: 1,
                currentIndex: currentIndex,
                text: 'Train',
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
                nextFunction();

                if (currentIndex == 1) {
                  show = false;
                  return;
                } else {
                  show = true;
                }
              },
              child: MyTab(
                positionIndex: 2,
                currentIndex: currentIndex,
                text: 'Seat',
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
                if (currentIndex == 1) {
                  show = false;
                  return;
                } else {
                  show = true;
                }
              },
              child: MyTab(
                positionIndex: 3,
                currentIndex: currentIndex,
                text: 'Checkout',
              ),
            ),
          ],
        ),
        Divider(color: kTextColor, thickness: 0.3),
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final int positionIndex, currentIndex;

  MyTab(
      {Key key,
      @required this.positionIndex,
      @required this.currentIndex,
      @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 16.0,
            color: positionIndex == currentIndex ? kFloatingButton : kTextColor,
            fontWeight: positionIndex == currentIndex
                ? FontWeight.w800
                : FontWeight.w300,
          ),
        ),
        positionIndex == currentIndex
            ? Transform.translate(
                offset: Offset(0.0, 10.0),
                child: Container(
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: kFloatingButton,
                  ),
                ),
              )
            : Container(
                height: 6,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.transparent,
                ),
              ),
      ],
    );
  }
}

class BuildHead extends StatelessWidget {
  const BuildHead({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
            color: kMainColor,
            iconSize: 30.0,
          ),
          Spacer(),
          Card(
            //color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(13.0),
                bottomRight: Radius.circular(12.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                'assets/Woman.jpeg',
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.14,
                fit: BoxFit.cover,
                //color: Color(0xFF0C382E),
                filterQuality: FilterQuality.medium,
                colorBlendMode: BlendMode.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
