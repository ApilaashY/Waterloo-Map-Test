import 'package:flutter/material.dart';
import 'package:waterloo_test_map/main.dart';

Route controller(RouteSettings settings) {
  switch (settings.name) {
    case "Home":
      return MaterialPageRoute(builder: (context) => Home());
  }
  throw "Unknown Page";
}
