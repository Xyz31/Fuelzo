import 'package:flutter/material.dart';
import 'package:team_project1/widgets/drawer_menu.dart';
import 'package:team_project1/widgets/googlemaps.dart';
import 'package:team_project1/widgets/home_appbar.dart';
import 'package:team_project1/widgets/service_cards.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    // check for device is mobile
    final width = MediaQuery.of(context).size.width;
    // final isMobile = MediaQuery.of(context).size.width > 700 ? false : true;
    return Scaffold(
      backgroundColor: Colors.grey[250],
      extendBody: true,
      appBar: width < 800
          ? AppBar(
              backgroundColor: Colors.black12,
              iconTheme: const IconThemeData(color: Colors.blue),
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'FUELZO',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ))
          : PreferredSize(
              preferredSize: Size(width, 70), child: const HomeAppbar()),
      drawer: const DrawerMenu(),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: const Column(
          children: [
            CustomGoogleMap(),
            ServiceCards(),
          ],
        ),
      ),
    );
  }
}
