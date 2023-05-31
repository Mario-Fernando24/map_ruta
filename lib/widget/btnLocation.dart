import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/blocs/blocs.dart';
import 'package:map_bloc/ui/custom_snackbar.dart';

class BtnLocationCurrent extends StatelessWidget {
  const BtnLocationCurrent({super.key});

  @override
  Widget build(BuildContext context) {

    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(Icons.my_location_outlined, color: Colors.black,),
          onPressed: (){
               final userLocation = locationBloc.state.latLngPosition;
             if(userLocation==null) {
                final snackbare =   CustomSnackBar(message: 'No hay ubicación actual');
                ScaffoldMessenger.of(context).showSnackBar(snackbare);
                return ;
            }
             mapBloc.moveCamera(userLocation);
          },
        ),
      ),
    );
  }
}