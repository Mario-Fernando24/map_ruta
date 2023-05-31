
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/blocs/blocs.dart';
import 'package:map_bloc/screen/loading.dart';

void main() {
  runApp( 
    //observe cuando exista algun cambio de gps en la app
    MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => GpsBloc() ),
      BlocProvider(create: (context) => LocationBloc() )
      ],
      child: const MappApp(),
    )
  );
}

class MappApp extends StatelessWidget {
  const MappApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:  Loading()
    );
  }
}