import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(LocationState()) {
    on<GetNewLocation>((event, emit) {
       emit(state.copyWith(
        latLngPosition: event.newLocation,
        myLocationHistory: [...state.myLocationHistory, event.newLocation]
       ));
    });

    on<OnStarSeguirUsers>((event, emit){
       emit(state.copyWith(
          seguirUsers: true
       ));
    });

    on<OnStopSeguirUsers>((event, emit){
       emit(state.copyWith(
        seguirUsers: false
       ));
    });

    
  }

  Future getCurrentPosition()async{
     final position =  await Geolocator.getCurrentPosition();
     print('Position ===> ${position}');
    add(GetNewLocation(LatLng(position.latitude, position.longitude)));

  }
   
  //para empezarle darle seguimiento al usuario
  void starSeguimientoUsers() {

    add(OnStarSeguirUsers());
     
     //escuchar cualquier cambio de la ubicacion
    positionStream = Geolocator.getPositionStream().listen((event) { 
        final positionn =event;

        print('listen seguimiento de la posición actual ==>  ${positionn}');
        add(GetNewLocation(LatLng(positionn.latitude, positionn.longitude)));
     });
  }


  void clearSeguimiento(){

    print('SE CANCELO LA SUBCRIPCIÓN');
    positionStream?.cancel();
    add(OnStopSeguirUsers());

  }

  @override
  Future<void> close() {
    clearSeguimiento();
    // TODO: implement close
    return super.close();
  }

}
