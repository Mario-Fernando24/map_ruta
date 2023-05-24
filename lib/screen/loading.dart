import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/blocs/blocs.dart';
import 'package:map_bloc/screen/gps_access_screen.dart';
import 'package:map_bloc/screen/map_screen.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state){
          return state.isAllGranted 
          ? const MapScreen()
          : const GpsAccessScreen();
        },
       )
    );
  }
}