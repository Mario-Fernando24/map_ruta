import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/blocs/blocs.dart';

class BtnSeguirUsers extends StatelessWidget {
  const BtnSeguirUsers({super.key});

  @override
  Widget build(BuildContext context) {

    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return IconButton(
                  icon: Icon(state.seguirUbicacionUsers ? Icons.directions_run_rounded: Icons.hail_rounded, color: Colors.black,),
                  onPressed: (){
                 
                      mapBloc.add(OnStartSeguirUsersEvent());
                    
                  },
                );
          },
        ),
      ),
    );
  }
}