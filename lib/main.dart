import 'package:flutter/material.dart';
import 'package:map_bloc/screen/gps_access_screen.dart';

void main() => runApp(const MappApp());

class MappApp extends StatelessWidget {
  const MappApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:  GpsAccessScreen()
    );
  }
}