import 'package:flutter/material.dart';
import 'package:flutter_web_navigator_2o0/pages/services.dart';
import '../enums.dart';
import '../pages/about.dart';
import '../pages/contact.dart';
import '../pages/home.dart';
import '../pages/pagenotfound.dart';
import '../providers/page_notifier.dart';
import 'routes.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  final PageNotifier notifier;

  AppRouterDelegate({required this.notifier});

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          if (notifier.isUnknown) const MaterialPage(child: PageNotFound()),
          if (!notifier.isUnknown) const MaterialPage(child: HomePage()),
          if (notifier.pageName == PageName.home)
            const MaterialPage(child: HomePage()),
          if (notifier.pageName == PageName.about)
            const MaterialPage(child: AboutPage()),
          if (notifier.pageName == PageName.contact)
            const MaterialPage(child: ContactPage()),
          if (notifier.pageName == PageName.services)
            const MaterialPage(child: ServicesPage()),
        ],
        onPopPage: (route, result) => route.didPop(result));
  }

//currentConfiguration is called whenever there might be a change in route
//It checks for the current page or route and return a new route information
//This is what populates our browser history
  @override
  AppRoute? get currentConfiguration {
    if (notifier.isUnknown) {
      return AppRoute.unknown();
    }

    if (notifier.pageName == PageName.home) {
      return AppRoute.home();
    }

    if (notifier.pageName == PageName.about) {
      return AppRoute.about();
    }

    if (notifier.pageName == PageName.contact) {
      return AppRoute.contact();
    }

    if (notifier.pageName == PageName.services) {
      return AppRoute.services();
    }

    return AppRoute.unknown();
  }

//This is called whenever the system detects a new route is passed
//It checks the current route through the configuration and uses that to update the notifier
  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    if (configuration.isUnknown) {
      _updateRoute(page: null, isUnknown: true);
    }

    if (configuration.isAbout) {
      _updateRoute(page: PageName.about);
    }

    if (configuration.isContact) {
      _updateRoute(page: PageName.contact);
    }

    if (configuration.isServices) {
      _updateRoute(page: PageName.services);
    }

    if (configuration.isHome) {
      _updateRoute(page: PageName.home);
    }
  }

  _updateRoute({PageName? page, bool isUnknown = false}) {
    notifier.changePage(page: page, unknown: isUnknown);
  }
}
