import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/pagenotfound.png"),
          const NavBar(),
        ],
      ),
    );
  }
}
