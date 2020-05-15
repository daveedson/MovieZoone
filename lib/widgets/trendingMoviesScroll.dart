import 'package:flutter/material.dart';
import 'package:moviezoone/data/data.dart';
import 'package:moviezoone/models/recentmovies.dart';

class RecentMoviesScrollView extends StatelessWidget {
  
  final PageController pageController;
  final List<RecentMovies> recentMovies;

  RecentMoviesScrollView({this.pageController,this.recentMovies});

  
  //this method builds the widget for the scrollable images deployed to the screen
  _buildTrendingMovies(BuildContext context, int index) {
      RecentMovies recentmovie = recentMovies[index];
      
      return AnimatedBuilder(//this widget controls animantion for the movies..
              animation: pageController,
              builder: (BuildContext context, Widget widget ){
                double value = 1;
                if(pageController.position.haveDimensions){
                  value = pageController.page - index;
                  value = (1-(value.abs()*0.25)).clamp(0.0, 1.0);

                }
                return Center(
                    child: SizedBox(
                      height: Curves.easeInOut.transform(value)*440,
                      child: widget,
                    ),
                );
              },
              child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  //height: 440.0,
                  width: 300.0,
                  image: AssetImage(recentmovie.imageUrl),
                  fit: BoxFit.cover,
                ),
        )
        ),
      );
      

  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440.0,
      child: PageView.builder(
        controller: pageController,
        itemCount: recentMovies.length,
        itemBuilder: (BuildContext context,int index){
          return _buildTrendingMovies(context, index);
                  },
                )
              );
            }
          


           
}