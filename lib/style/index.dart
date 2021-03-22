import 'package:flutter/material.dart';

class Styles {
  Styles(this.context);

  BuildContext context;

  double px (double num) {
    return num * MediaQuery.of(this.context).size.width / 375;
  }
}

