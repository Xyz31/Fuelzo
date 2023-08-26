import 'package:flutter/material.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({super.key});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width / 4,
                  ),
                  const Text(
                    'FUELZO',
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(width: screenSize.width / 15),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[0] = true : _isHovering[0] = false;
                      });
                    },
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: _isHovering[0] ? Colors.cyan : Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[0],
                          child: Container(
                            height: 3,
                            width: 20,
                            //color: Colors.blue,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.red, Colors.cyan])),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 15),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[1] = true : _isHovering[1] = false;
                      });
                    },
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Log out',
                          style: TextStyle(
                              color: _isHovering[1] ? Colors.cyan : Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[1],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: const Color(0xFF051441),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 15),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[2] = true : _isHovering[2] = false;
                      });
                    },
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Log In',
                          style: TextStyle(
                              color: _isHovering[2] ? Colors.cyan : Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[2],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: const Color(0xFF051441),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 15),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[3] = true : _isHovering[3] = false;
                      });
                    },
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              color: _isHovering[3] ? Colors.cyan : Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[3],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: const Color(0xFF051441),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              ElevatedButton(onPressed: () {}, child: const Text('Education')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {}, child: const Text('Skills')),
        ),

        //Update Profile
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                profileUpdated = true;
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const About()));
              },
              child: const Text('Update Profile')),
        ),

        //Log out
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
              onPressed: () async {
                await _logOut(context);
              },
              child: const Text('Log out')),
        ),

        //Delete Account
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () async {
              final instance = DeleteUser();
              instance._deleteUser(context);
            },
            child: const Text('Delete Account'),
          ),
        )
      ],
    );
  }
}


*/