part of 'gps_bloc.dart';

 class GpsState extends Equatable {
  
  final bool isGpsEnable;
  final bool isGpsPermission;

  const GpsState({
   required this.isGpsEnable,
   required this.isGpsPermission
  });

  GpsState copyWith({
    bool? isGpsEnable,
    bool? isGpsPermission
  }) => GpsState(
    isGpsEnable: isGpsEnable ?? this.isGpsEnable,
    isGpsPermission: isGpsPermission ?? this.isGpsPermission
   );
  
  
  @override
  List<Object> get props => [
    isGpsEnable,isGpsPermission
  ];

  @override
  String toString() => '{isGpsEnable : $isGpsEnable, isGpsPermission : $isGpsPermission}';
}

// class GpsInitial extends GpsState {}
