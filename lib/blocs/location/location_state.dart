part of 'location_bloc.dart';

 class LocationState extends Equatable {

  //seguir users
  final bool seguirUsers;
  //ultimo localizacion conocida
  final LatLng? latLngPosition;
  //historia de las ultimas ubicaciones
  final List<LatLng> myLocationHistory;

  const LocationState({
     this.seguirUsers=false,
     this.latLngPosition,
     myLocationHistory
     }): myLocationHistory = myLocationHistory ?? const [];


     LocationState copyWith({
       bool? seguirUsers,
       LatLng? latLngPosition,
       List<LatLng>? myLocationHistory,
     }) =>LocationState(
        seguirUsers: seguirUsers ?? this.seguirUsers,
        latLngPosition: latLngPosition ?? this.latLngPosition,
        myLocationHistory: myLocationHistory  ?? this.myLocationHistory
     );
  
  @override
  List<Object?> get props => [seguirUsers, latLngPosition, myLocationHistory];
}

