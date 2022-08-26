import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../enums.dart';
import '../providers/page_notifier.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<PageNotifier>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 50.0,
      padding: const EdgeInsets.only(right: 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MenuItem(
            page: PageName.home,
            onTap: () {
              if (notifier.pageName != PageName.home) {
                notifier.changePage(page: PageName.home, unknown: false);
              }
            },
          ),
          const SizedBox(width: 20.0),
          MenuItem(
            page: PageName.about,
            onTap: () {
              if (notifier.pageName != PageName.about) {
                notifier.changePage(page: PageName.about, unknown: false);
              }
            },
          ),
          const SizedBox(width: 20.0),
          MenuItem(
              page: PageName.contact,
              onTap: () {
                if (notifier.pageName != PageName.contact) {
                  notifier.changePage(page: PageName.contact, unknown: false);
                }
              }),
          const SizedBox(width: 20.0),
          MenuItem(
              page: PageName.services,
              onTap: () {
                if (notifier.pageName != PageName.services) {
                  notifier.changePage(page: PageName.services, unknown: false);
                }
              }),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final PageName page;
  final VoidCallback onTap;
  const MenuItem({required this.page, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(page.name, style: const TextStyle(fontSize: 18.0)),
    );
  }
}
