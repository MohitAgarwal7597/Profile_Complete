import 'package:flutter/material.dart';

import 'screens/gender_screen.dart';
import 'screens/height_screen.dart';
import 'screens/profile.dart';
import 'screens/weight_screen.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Completion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      initialRoute: '/gender',
      routes: {
        '/gender': (context) => const GenderScreen(),
        '/weight': (context) => const WeightScreen(),
        '/height': (context) => const HeightScreen(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
