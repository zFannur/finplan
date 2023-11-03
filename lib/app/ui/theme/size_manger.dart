import 'package:flutter/material.dart';

Size? _size;

Size _screenSize(BuildContext context) {
  _size ??= MediaQuery.of(context).size;
  return _size!;
}

double screenHeightDividedBy(BuildContext context, {double dividedBy = 1}) {
  assert(dividedBy > 0, "Division by zero or negative number isn't allowed");
  return _screenSize(context).longestSide / dividedBy;
}

double screenWidthDividedBy(BuildContext context, {double dividedBy = 1}) {
  assert(dividedBy > 0, "Division by zero or negative number isn't allowed");
  return _screenSize(context).shortestSide / dividedBy;
}
