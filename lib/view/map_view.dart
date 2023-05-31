import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_bloc/blocs/blocs.dart';

class MapView extends StatelessWidget {

  final LatLng intialLocation;

  const MapView({super.key, required this.intialLocation});

  @override
  Widget build(BuildContext context) {

    final mapBloc = BlocProvider.of<MapBloc>(context);

     final CameraPosition initialCameraPosition = CameraPosition(
                target: intialLocation!,
                zoom: 15);

     final size= MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        compassEnabled: false,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        onMapCreated: ( controller ) => mapBloc.add(OnMapInitialzedEvent(controller)),
        )
     );
  }
}