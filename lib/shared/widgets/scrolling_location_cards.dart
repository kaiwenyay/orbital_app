import 'package:flutter/material.dart';
import 'package:orbital_app/models/my_location.dart';
import 'package:orbital_app/screens/base_view.dart';
import 'package:orbital_app/view_models/base_view_model.dart';
import 'package:orbital_app/view_models/widgets/scrolling_location_cards_view_model.dart';
import 'location_card.dart';

class ScrollingLocationCards extends StatelessWidget {
  const ScrollingLocationCards({
    Key key,
  }) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return BaseView<ScrollingLocationCardsViewModel>(
  //     onModelReady: (model) => model.getNearbyLocations(),
  //     builder: (context, model, child) =>  model.isBusy() == true
  //       ? CircularProgressIndicator(
  //         valueColor: AlwaysStoppedAnimation(Colors.white),
  //       )
  //       : Container(
  //         height: 200,
  //         child: ListView(
  //           scrollDirection: Axis.horizontal,
  //           children: model.locations
  //               .map((location) =>
  //               LocationCard(
  //                   location: location,
  //                   onCardTapped: () =>
  //                       model.navigate(
  //                           'location', arguments: location)))
  //               .toList()
  //               ),
  //             )
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return BaseView<ScrollingLocationCardsViewModel>(
        onModelReady: (model) => model.getNearbyLocations(),
        builder: (context, model, child) =>  FutureBuilder(
            future: model.locations,
            builder:(BuildContext context, AsyncSnapshot<List<MyLocation>> snapshot) {
              if (snapshot.connectionState != ConnectionState.done || !snapshot.hasData) {
                print(snapshot);
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                );
              }
              return Container(
                height: 200,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data
                        .map((location) =>
                        LocationCard(
                            location: location,
                            onCardTapped: () =>
                                model.navigate(
                                    'location', arguments: location)))
                        .toList()
                ),
              );
            }
        )
    );
  }
}