import 'package:flutter/material.dart';
import 'package:flutter_widget_aplication/config/screens/screen.dart';

class UiControlsScreen extends StatelessWidget {

  static const name = '';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}


enum Transportation {car,plane,boat,submarine }

class _UiControlsViewState extends State<_UiControlsView> {

    Transportation selectedTransportation = Transportation.car;
    bool isDeveloper = true;
    bool wantsBreakfast = false;
    bool wantsLunch = false; 
    bool wantsDinner = false; 
    


  @override
  Widget build(BuildContext context) {
    return ListView(
      physics:const ClampingScrollPhysics(),
      children: [

        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
          value: isDeveloper, 
          onChanged: (value) => setState(() {
            if(isDeveloper== true){
              print('is developer true');
            }
            isDeveloper =! isDeveloper;
          }),
        ),


        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle:  Text('$selectedTransportation'),
          children: [
              RadioListTile(
                title: const Text('By car'),
                subtitle: const Text('Viajar por carro'),
                value: Transportation.car,
                groupValue: selectedTransportation, 
                onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.car;
                }
                )
          ),
              RadioListTile(
                title: const Text('By plane'),
                subtitle: const Text('Viajar por avion'),
                value: Transportation.plane,
                groupValue: selectedTransportation, 
                onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.plane;
                }
                )
          ),
              RadioListTile(
                title: const Text('By boat'),
                subtitle: const Text('Viajar por bote'),
                value: Transportation.boat,
                groupValue: selectedTransportation, 
                onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.boat;
                }
              )
              )
          ],
        ),

        CheckboxListTile(
          title: const Text('desayuno?'),
          value: wantsBreakfast,
           onChanged: (value) => setState(() {
              wantsBreakfast  =! wantsBreakfast;
           })
           ),
           CheckboxListTile(
          title: const Text('almuerzo?'),
          value: wantsLunch,
           onChanged: (value) => setState(() {
              wantsLunch  =! wantsLunch;
           })
           ),
           CheckboxListTile(
          title: const Text('cena?'),
          value: wantsDinner,
           onChanged: (value) => setState(() {
              wantsDinner  =! wantsDinner;
           })
           )
      ],
    );
  }
}