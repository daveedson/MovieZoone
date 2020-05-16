import 'package:flutter/material.dart';
import 'package:moviezoone/data/data.dart';
import 'package:moviezoone/widgets/trendingMoviesScroll.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //decalaring of pageController Scroll
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    //initializing of the page controller class inside the initstate so it can build as the app is been run,
    _pageController = new PageController(initialPage: 0, viewportFraction: 0.8);
  }

  Widget BottomSheetBuild(BuildContext context) {
    return Container(
      color: Color(0xFF141414),
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Theme(
                data:
                    Theme.of(context).copyWith(accentColor: Color(0xffD29393)),
                child: TextField(
                  enabled: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    fillColor: Color(0xffD29393),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(width: 0.5, color: Color(0xffD29393)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Color(0xffD29393),
                      ),
                    ),
                    hintText: 'Search...',
                    prefixIcon: Icon(
                      Icons.search, //adding of icon in the text Field
                      size: 30.0,
                    ),
                    suffixIcon: IconButton(
                      color: Colors.redAccent,
                      icon: Icon(Icons.mic),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 27.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        iconSize: 40.0,
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context, builder: BottomSheetBuild);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text('FRIDAY, MAY 15'),
                  )
                ],
              ),
            ),
            RecentMoviesScrollView(
              //created a new widget in the widget Folder for this widget build..
              pageController: _pageController,
              recentMovies: recentMovies,
            ),
          ],
        ),
      ),
    );
  }
}
