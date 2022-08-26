import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/page_notifier.dart';
import 'routes/route_delegate.dart';
import 'routes/routeinfoparser.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouteInformationParser(),
      routerDelegate:
          AppRouteDelegate(notifier: Provider.of<PageNotifier>(context)),
      title: 'Navigator 2.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
