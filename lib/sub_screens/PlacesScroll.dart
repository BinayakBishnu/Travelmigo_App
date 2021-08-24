import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelmigo_2021/data_sources/places.dart';
import 'package:travelmigo_2021/screens/place_pages/details_page_places.dart';
import 'package:travelmigo_2021/screens/place_pages/show_all_places.dart';

class PlacesScroll extends StatelessWidget {
  // const PlacesScroll({Key? key}) : super(key: key);

  final _abc = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      //* Places list section (side scrolling)
      children: <Widget>[
        //* "Destination" heading + show all option
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Places',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Show All');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllPlaces()),
                  );
                },
                child: Text(
                  'Show All',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 10.0,
        ),

        //* Horizontal gallery
        Container(
          height: 320.0 + _abc + _abc,
          // color: Colors.blue,
          // color: Theme.of(context).primaryColor,

          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                // color: Color.fromRGBO(35, 35, 35, 1.0),
                color: Theme.of(context).shadowColor,
              ),
              BoxShadow(
                color: Theme.of(context).scaffoldBackgroundColor,
                //! INNER SHADOW
                spreadRadius: -25.0,
                blurRadius: 100.0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: ListView.builder(
              //* default is vertical
              //* changing to horizontal...
              scrollDirection: Axis.horizontal,
              itemCount: places.length,
              //? puts max number of iterations
              itemBuilder: (BuildContext context, int index) {
                //? ^^~ to the for loop
                Places place = places[index];
                //? now "place" variable assigned as places[index]
                //? index = 0,1,2....itemCount
                // return Text(places[index].country);

                //! Each card
                return GestureDetector(
                  onTap: () {
                    print('${place.city}');
                    // print('${place.details[0].details_pic}');  //? debugging
                    print(index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlacesDetailsPage(
                          placed: place,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 230.0,
                    // color: Colors.white,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10.0),
                    //   //^^ why no effect??

                    //   // boxShadow: [
                    //   //   BoxShadow(
                    //   //     color: Color.fromRGBO(100, 100, 100, 1.0),
                    //   //     offset: const Offset(
                    //   //       0.0,
                    //   //       5.0,
                    //   //       // 5.0,
                    //   //     ),
                    //   //     blurRadius: 10.0,
                    //   //     spreadRadius: 2.0,
                    //   //   ),
                    //   //   // BoxShadow(
                    //   //   //   color: Colors.white,
                    //   //   //   offset: const Offset(0.0, 0.0),
                    //   //   //   blurRadius: 0.0,
                    //   //   //   spreadRadius: 0.0,
                    //   //   // ), //BoxShadow
                    //   // ], //// boxShadow
                    // ),

                    //! Stacking text part and pic part
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        //! Text part in card
                        Positioned(
                          bottom: 8.0,
                          child: Container(
                            height: 120.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Text(places.details.length),
                                  // Text(place.pic),
                                  Text(
                                    '${place.details.length} places to visit',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                      // letterSpacing: 1.0,
                                    ),
                                  ),

                                  //! seperator
                                  SizedBox(
                                    height: 5.0,
                                  ),

                                  Text(
                                    place.desp,
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //! Pic part
                        Container(
                          height: 195.0,
                          width: 195.0,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),

                          //! Stack to put image text on top of image
                          child: Stack(
                            children: <Widget>[
                              //! Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        offset: const Offset(
                                          0.0,
                                          10.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ],
                                  ),
                                  child: Image(
                                    height: 195.0,
                                    width: 195.0,
                                    image: AssetImage(place.pic),
                                    fit: BoxFit.cover,
                                    //? to stretch image to fit whole 195x195 box
                                  ),
                                ),
                              ),

                              //! bg for text on image
                              Container(
                                decoration: BoxDecoration(
                                  //* gradient
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: [0.3, 0.5],
                                    colors: [
                                      //! GRADIENT COLOURS
                                      Theme.of(context).splashColor,
                                      Color.fromRGBO(0, 0, 0, 0.0),
                                    ],
                                  ),
                                  //* border-radius
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                // color: Colors.teal[200],
                              ),

                              //! Text on image
                              Positioned(
                                left: 15.0,
                                bottom: 15.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //? Column is inside stack not Container or Row/Column
                                  //? So can't use centre align in parent
                                  //? Use position around child (this widget)
                                  children: <Widget>[
                                    //* country
                                    Text(
                                      place.country,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),

                                    //* city + icon
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.compass,
                                          size: 15.0,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 2.0),
                                        Text(
                                          place.city,
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}