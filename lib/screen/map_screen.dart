import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/blocs/blocs.dart';
import 'package:map_bloc/view/view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  late LocationBloc locationBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     locationBloc =BlocProvider.of<LocationBloc>(context);
    // locationBloc.getCurrentPosition();
      locationBloc.starSeguimientoUsers();
  }

  @override
  void dispose() {
    locationBloc.clearSeguimiento();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state){
            if(state.latLngPosition==null){
               return  const Center(child: Text('Espere por favor...'));
            }else{
              
              return SingleChildScrollView(
                child: Stack(
                  children: [
                      MapView(intialLocation: state.latLngPosition!),
                  ],
                ),
              );
            }
           
        },
      ),
    );
  }
}