import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_bloc/themes/uber.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  GoogleMapController? _mapController;

  MapBloc() : super( MapState()) {
    on<OnMapInitialzedEvent>(_onInitMap);
  }


  void _onInitMap(OnMapInitialzedEvent event, Emitter<MapState> emit){
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(uberMapThe));
    emit(state.copyWith(isMapInitialized: true));

  }
}
