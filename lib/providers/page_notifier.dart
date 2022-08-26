import 'package:flutter/material.dart';
import '../enums.dart';

class PageNotifier extends ChangeNotifier {
  PageName? _pageName = PageName.home;
  bool _unknownPath = false;

  get pageName => _pageName;
  get isUnknown => _unknownPath;

  changePage({required PageName? page, required bool unknown}) {
    _pageName = page;
    _unknownPath = unknown;
    notifyListeners();
  }
}
