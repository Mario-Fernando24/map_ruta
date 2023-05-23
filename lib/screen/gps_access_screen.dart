import 'package:flutter/material.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       body: Center(
        child: _aceessButton()
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