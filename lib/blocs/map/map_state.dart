part of 'map_bloc.dart';

 class MapState extends Equatable {

  //si el mapa esta inicializado
  final bool isMapInitialized;
  //si la persona quiere seguir la ubicacion del usuario
  final seguirUbicacionUsers;

  MapState({
    this.isMapInitialized = false,
    this.seguirUbicacionUsers = false
    });
  
  MapState copyWith({
    bool? isMapInitialized,
    bool? seguirUbicacionUsers
  })=> MapState(
    //inicializarlos
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    seguirUbicacionUsers: seguirUbicacionUsers ?? seguirUbicacionUsers
  );

    @override
  List<Object> get props => [isMapInitialized,seguirUbicacionUsers];


}

class MapInitial extends MapState {}
