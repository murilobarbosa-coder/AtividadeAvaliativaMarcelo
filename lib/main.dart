import 'package:flutter/material.dart';
import 'app/views/splash_page.dart';

void main() {
  runApp(const LeadFlowApp());
}

class LeadFlowApp extends StatelessWidget {
  const LeadFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'LeadFlow',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}