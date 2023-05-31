import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

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


    final gpsInitStatus = await Future.wait([
      _checkGpsStatus(),
      _isPermisssionGranted()
    ]);

    
    add(GpsAndPermissionEvent(
      isGpsEnable: gpsInitStatus[0],
       isGpsPermission: gpsInitStatus[1]));
    
    
  }


   Future<bool> _isPermisssionGranted() async {
    
    final isGranted = await Permission.location.isGranted;
    return isGranted;

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


  //para pedirle acceso al gps

  Future<void> askGpsAccess() async {
     
     final status = await Permission.location.request();

     switch (status) {
       case PermissionStatus.granted:
          add(GpsAndPermissionEvent(isGpsEnable: state.isGpsEnable, isGpsPermission: true));
         break;

       case PermissionStatus.denied:
       case PermissionStatus.restricted:
       case PermissionStatus.limited:
       case PermissionStatus.permanentlyDenied:
           add(GpsAndPermissionEvent(isGpsEnable: state.isGpsEnable, isGpsPermission: false));
        openAppSettings();
     }

  }

 

  //se llama cuando el bloc ya no se utilizara

  @override
  Future<void> close() {
    gpsSubcription?.cancel();
    return super.close();
  }
}
