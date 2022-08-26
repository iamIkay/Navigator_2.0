import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: MediaQuery.of(context).size.height * 0.15,
                  bottom: 20.0),
              child: Image.asset("assets/contact.png", fit: BoxFit.cover)),
          const NavBar(),
        ],
      ),
    );
  }
}
