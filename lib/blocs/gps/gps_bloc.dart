import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {

 StreamSubscription? gpsSubcription;

  GpsBloc() : super(const GpsState(isGpsEnable: false, isGpsPermission: false)) {

    on<GpsAndPermissionEvent>((event, emit) {
      emit(state.copyWith(
        isGpsEnable: event.isGpsEnable,
        isGpsPermission: event.isGpsPermission
        ));
   });

    _init();

  }

  //INICIALIZAR EL STRING DE INFORMACION (SABER SI EL GPS ESTA ACTIVO O NO LISTENER)
  Future<void> _init() async{
    //estara escuchando el gps y verifico el estado de los privilegios
    final isEnable = await _checkGpsStatus();
    add(GpsAndPermissionEvent(
      isGpsEnable: isEnable,
       isGpsPermission: state.isGpsPermission));
    
    
  }

  Future<bool> _checkGpsStatus() async{
    //para saber si el permiso del gps esta habilitado
     final isEnable = await Geolocator.isLocationServiceEnabled();

    gpsSubcription = Geolocator.getServiceStatusStream().listen((event) {
      //1 si esta habilitado 0 si no esta
      final isEnable = (event.index==1) ? true : false;
       add(GpsAndPermissionEvent(
       isGpsEnable: isEnable,
       isGpsPermission: state.isGpsPermission));

     });
     return isEnable;
  }

  //se llama cuando el bloc ya no se utilizara

  @override
  Future<void> close() {
    gpsSubcription?.cancel();
    return super.close();
  }
}
