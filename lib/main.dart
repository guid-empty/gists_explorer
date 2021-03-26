import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gists_explorer/src/app.dart';
import 'package:gists_explorer/src/services/gists_api.dart';

void main(List<String> arguments) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

final api = GistsApi();
