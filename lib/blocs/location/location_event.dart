part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

//recobir una nueva ubicacion

class GetNewLocation extends LocationEvent {
  
  final LatLng newLocation;
  const GetNewLocation(this.newLocation);

}

