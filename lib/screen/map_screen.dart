import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/blocs/blocs.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final locationBloc =BlocProvider.of<LocationBloc>(context);
    // locationBloc.getCurrentPosition();
      locationBloc.starSeguimientoUsers();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       body: Center(
        child: Text('MapScreen'),
       ),
    );
  }
}