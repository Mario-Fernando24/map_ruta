import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnable
            ? const _enableGPS()
            : const _aceessButton();
          },
        )
       ),
    );
  }
}

class _aceessButton extends StatelessWidget {
  const _aceessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso al GPS'),
        MaterialButton(
          child: Text('Solicitar Acceso', style: TextStyle(color: Colors.white)),
          color: Colors.black,
          shape: const StadiumBorder(),
          elevation: 0,
          splashColor: Colors.transparent,
          onPressed: (){

          }
        )
      ],
    );
  }
}

class _enableGPS extends StatelessWidget {
  const _enableGPS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Debes habilitar el gps', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300));
  }
}