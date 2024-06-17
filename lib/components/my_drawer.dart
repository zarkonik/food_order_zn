import "package:flutter/material.dart";
import "package:food_order_zn/components/my_drawer_tile.dart";
import "package:food_order_zn/pages/login_page.dart";
import "package:food_order_zn/pages/settings_page.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          //home list tile
          MyDrawerTile(
              text: "HOME",
              icon: Icons.home,
              onTap: () => Navigator.pop(context)),
          MyDrawerTile(
              text: "SETTINGS",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              }),
          MyDrawerTile(
              text: "Log in",
              icon: Icons.login,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              }),

          const Spacer(),

          MyDrawerTile(text: "Logout", icon: Icons.logout, onTap: () {}),
          //settings list tile

          //logout list tile
        ],
      ),
    );
  }
}
