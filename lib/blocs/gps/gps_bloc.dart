import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
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
       print('*******************************************************');
       print('${isEnable}');
       print('*******************************************************');
    
  }

  Future<bool> _checkGpsStatus() async{
    //para saber si el permiso del gps esta habilitado
     final isEnable = await Geolocator.isLocationServiceEnabled();

     Geolocator.getServiceStatusStream().listen((event) {
      //1 si esta habilitado 0 si no esta
      final isEnable = (event.index==1) ? true : false;
      print('=====>${isEnable}');

     });
     return isEnable;
  }

  //se llama cuando el bloc ya no se utilizara

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
