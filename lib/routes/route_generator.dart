import 'package:flutter/material.dart';
import 'package:orbital_app/screens/home/home_view.dart';
import 'package:orbital_app/screens/authenticate/signin_view.dart';
import 'package:orbital_app/screens/authenticate/password_reset_view.dart';
import 'package:orbital_app/screens/authenticate/register_view.dart';
import 'package:orbital_app/screens/drawer/profilepage.dart';
import 'package:orbital_app/screens/home/all_locations_view.dart';
import 'package:orbital_app/screens/home/taken_order_view.dart';
import 'package:orbital_app/screens/home/my_order_view.dart';
import 'package:orbital_app/screens/home/order_details_view.dart';
import 'package:orbital_app/screens/home/location_view.dart';
import 'package:orbital_app/models/my_location.dart';
import 'package:orbital_app/models/order.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case '/':
        page = HomeView();
        break;
      case 'signIn':
        page = SignInView();
        break;
      case 'forgotPassword':
        page = PasswordResetView();
        break;
      case 'createAccount':
        page = RegisterView();
        break;
      case 'profilePage':
        page = ProfilePageView();
        break;
      case 'allLocations':
        page = AllLocationsView();
        break;
      case 'order':
        final args = settings.arguments as Order;
        page = OrderDetailsView(order: args,);
        break;
      case 'takenOrders':
        final args = settings.arguments as Order;
        page = TakenOrderView(order: args,);
        break;
      case 'myOrders':
        final args = settings.arguments as Order;
        page = MyOrderView(order: args,);
        break;
      case 'location':
        final args = settings.arguments as MyLocation;
        page = LocationView(location: args);
        break;
      default:
        page = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
        break;
    }
    return MaterialPageRoute(builder: (_) => page);
  }
}

// Map<String, WidgetBuilder> routeGenerator = {
//   'signIn' : (context) => SignInView(),
//   '/' : (context) => HomeView(),
//   'forgotPassword' : (context) => PasswordResetView(),
//   'createAccount' : (context) => RegisterView(),
//   'profilePage' : (context) => ProfilePageView(),
// };