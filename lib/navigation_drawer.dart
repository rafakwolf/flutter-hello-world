import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
              title: const Text('Item 1'),
              onTap: () async {
                Navigator.of(context).pop();
                var url = "https://rafaelwolf.dev.br";
                var urllaunchable = await canLaunchUrlString(
                    url); //canLaunch is from url_launcher package
                if (urllaunchable) {
                  await launchUrlString(
                      url); //launch is from url_launcher package to launch URL
                } else {
                  print("URL can't be launched.");
                }
              }),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.of(context).pop();
              // Update the state of the app.
              Navigator.pushNamed(context, "/second");
            },
          ),
        ],
      ),
    );
  }
}
