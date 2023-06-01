import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_bloc/blocs/blocs.dart';
import 'package:map_bloc/themes/uber.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  //relacion de una dependencia ya que necesito acceder a la localizacion en tiemoo real que esta en ese bloc
  final LocationBloc locationBloc;

  GoogleMapController? _mapController;

  MapBloc({
    required this.locationBloc
  }) : super( MapState()) {
    
    on<OnMapInitialzedEvent>(_onInitMap);

    on<OnStopSeguirUsersEvent>((event, emit) => {
          emit(state.copyWith(
            seguirUbicacionUsers: false
          ))
    });

    on<OnStartSeguirUsersEvent>((event, emit) => {
          emit(state.copyWith(
            seguirUbicacionUsers: true
          ))
    });

   
    locationBloc.stream.listen((locationSatate) {
       //si seguir usuario esta en false que no se mueva la camara
       if(!state.seguirUbicacionUsers) return;
       //si las coordenadas que esta enviando es null que no se mueva
       if(locationSatate.latLngPosition==null) return;
        //si no que envie las coordenadas  que esta pasando del bloc location
       moveCamera(locationSatate.latLngPosition!);
    });
  }


  void _onInitMap(OnMapInitialzedEvent event, Emitter<MapState> emit){
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(uberMapThe));
    emit(state.copyWith(isMapInitialized: true));

  }

  void moveCamera(LatLng newLocation){
        final cameraUpdate = CameraUpdate.newLatLng(newLocation);
        _mapController?.animateCamera(cameraUpdate);
  }



}
