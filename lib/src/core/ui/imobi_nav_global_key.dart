import 'package:flutter/material.dart';

class ImobiNavGlobalKey {
  static ImobiNavGlobalKey? _instance;
  final navKey = GlobalKey<NavigatorState>();

  ImobiNavGlobalKey._();
  static ImobiNavGlobalKey get instance => _instance ??= ImobiNavGlobalKey._();
}
