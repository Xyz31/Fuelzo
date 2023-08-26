import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceCards extends StatefulWidget {
  const ServiceCards({super.key});

  @override
  State<ServiceCards> createState() => _ServiceCardsState();
}

class _ServiceCardsState extends State<ServiceCards> {
  Color cardColor = Colors.transparent;
  List<String> services = [
    'Fuel Stations',
    'Puncture Shops',
    'Grocery Shops',
    'Medical Shops',
    'Tours And Travellers',
    'Stationary  shops ',
    'Electronics Shops',
    'Restaurants Hotels'
  ];

  List<bool> isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> images = [
    'Assets/Images/fuel.jpeg',
    'Assets/Images/punture.png',
    'Assets/Images/grocery.jpg',
    'Assets/Images/medical.png',
    'Assets/Images/travels.jpeg',
    'Assets/Images/stationary.jpg',
    'Assets/Images/electric.jpeg',
    'Assets/Images/restaurant.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.06,
        left: MediaQuery.of(context).size.width / 15,
        right: MediaQuery.of(context).size.width / 15,
      ),
      child: width < 800
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: width / 10, right: width / 10),
                child: Column(
                  // alignment: WrapAlignment.end,
                  children: List.generate(
                    services.length,
                    (index) => InkWell(
                      onTap: () {
                        // Add the onTap logic here
                      },
                      borderRadius: BorderRadius.circular(20),
                      onHover: (value) {
                        setState(() {
                          value = isHovering[index];
                          cardColor =
                              value ? Colors.yellow : Colors.transparent;
                        });
                      },
                      hoverColor: Colors.amber,
                      focusColor: Colors.transparent,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              width: width * 0.7,
                              height: height / 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      images[index],
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 10),
                                      blurRadius: 20,
                                      spreadRadius: 5,
                                      color: Colors.grey.withOpacity(0.3),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 50,
                              ),
                              child: Text(
                                services[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                color: Colors.grey[260],
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Add the onTap logic here
                      },
                      radius: 40,
                      borderRadius: BorderRadius.circular(20),
                      onHover: (value) {
                        setState(() {
                          value = isHovering[index];
                          cardColor =
                              value ? Colors.yellow : Colors.transparent;
                        });
                      },
                      hoverColor: Colors.amber,
                      focusColor: Colors.transparent,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 4.5,
                              width: MediaQuery.of(context).size.width / 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      images[index],
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 10),
                                      blurRadius: 30,
                                      spreadRadius: 17,
                                      color: Colors.grey.withOpacity(0.3),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                services[index],
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
