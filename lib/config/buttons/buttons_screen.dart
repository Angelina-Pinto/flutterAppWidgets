import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body:const _buttonsView(),
      floatingActionButton: FloatingActionButton( 
        onPressed: (){
          //Regresando a pantalla anterior 
          Navigator.of(context).pop();
          //otra forma de regresar a pantalla
          context.pop();
        },
        child: const Icon(Icons.arrow_back),),
    );
  }
}

class _buttonsView extends StatelessWidget {
  const _buttonsView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){}, 
            child: const Text('Elevated')),

            const ElevatedButton(onPressed: null,child: Text('Disable')),

             ElevatedButton.icon(
              onPressed: (){}, 
              label: const Text('texot'),
              icon: const Icon(Icons.access_alarm_outlined),
              ),

              FilledButton(
                onPressed: (){}, 
                child: const Text('Filled')),

              FilledButton.icon(
                onPressed: (){}, 
                icon:const Icon(Icons.access_alarms),
                label: const Text('Filled'),),

              OutlinedButton(
                onPressed: (){}, 
                child:  const Text('outlined')),
              const customButton(),
              
              IconButton(onPressed: (){}, 
                icon: const Icon(Icons.access_time_sharp)),

              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.account_circle_outlined),
                style: const ButtonStyle(
                  // backgroundColor: MaterialStatePropertyAll(),
                  // iconColor: MaterialStatePropertyAll
                ),
                )
        ],
      ),
      
    );
    
  }
}
class customButton extends StatelessWidget {
  const customButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return  ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
      
        color: Colors.blue,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            //le da dimensiones al boton
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('hola mundo',
            style:TextStyle(color: Colors.black), ),
          ),
        ),
      ),
    );
  }
} 