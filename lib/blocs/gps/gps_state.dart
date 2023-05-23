part of 'gps_bloc.dart';

 class GpsState extends Equatable {
  
  final bool isGpsEnable;
  final bool isGpsPermission;

  const GpsState({
   required this.isGpsEnable,
   required this.isGpsPermission
  });
  
  
  @override
  List<Object> get props => [
    isGpsEnable,isGpsPermission
  ];
}

// class GpsInitial extends GpsState {}
