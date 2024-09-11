import 'package:flutter/material.dart';
import 'package:waterloo_map_test/main.dart';

Route controller(RouteSettings settings) {
  switch (settings.name) {
    case "Home":
      return new MaterialPageRoute(builder: (context) => Home());
  }
  throw "Unknown Page";
}
