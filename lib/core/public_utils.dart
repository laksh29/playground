import 'package:flutter/foundation.dart';

void debugCheck(
  String statement, {
  bool logInRelease = false,
}) {
  if (kDebugMode || logInRelease) {
    // ignore: avoid_print
    print("debug hero : $statement");
  }
}
