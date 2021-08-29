import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  bool _folded=true;

  bool getFolded()=>_folded;
  toggleFold(){_folded=!_folded;}

}