import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviezoone/data/data.dart';
import 'package:moviezoone/services/authFunctions.dart';
import 'package:moviezoone/widgets/trendingMoviesScroll.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({@required this.authFunctions});
  final AuthFunctions authFunctions;
  @override
  _HomeScreenState createState() => _HomeScreenState();
  //method to logOut User

}

class _HomeScreenState extends State<HomeScreen> {
  //declaring of pageController Scroll
  PageController _pageController;

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    //initializing of the page controller class inside the initState so it can build as the app is been run,
    _pageController = new PageController(initialPage: 0, viewportFraction: 0.8);
  }

  //method to logOut User
  Future<void> _signOutUser() {
    try {
      _auth.signOut();
    } catch (e) {
      print('Something went wrong :$e');
    }
    return null;
  }

  //this method builds the Bottom Sheet
  Widget bottomSheetBuild(BuildContext context) {
    return Container(
      color: Color(0xFF141414),
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            //   topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            _bottomSheetContent(Icon(Icons.exit_to_app), 'Logout', () {
              _signOutUser();
              Navigator.pop(context);
            }),
            _bottomSheetContent(Icon(Icons.timelapse), 'Recommended', () {})
          ],
        ),
      ),
    );
  }

  //this method builds the listTile for the Bottom sheet
  _bottomSheetContent(Icon icon, String name, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: onTap,
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
                  autofocus: false,
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
                              context: context, builder: bottomSheetBuild);
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
