import 'package:flutter/material.dart';
import 'package:flutter_widget_aplication/config/screens/screen.dart';

class ProgressScreen extends StatelessWidget {

  static const name = '';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicator'),
      ),
      body: _ProgressView(),
    );
    
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.white,),

          SizedBox(height: 20,),
          Text('Circular indicator controlado'),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }
}
class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //emision de valores de 0.0 a 1.0 
      //Estaremos emitiendo valores cada 300 milisegundos 
      stream: Stream.periodic(const Duration(milliseconds: 300),(value){
        return (value * 2)/100;
      // Dejara de tomar valores  cuando el value sea < 200 
      }).takeWhile((value) => value < 200),
      builder: (context, snapshot) {

        final ProgressIndicator = snapshot.data ?? 0;

        return   Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(strokeWidth: ProgressIndicator, backgroundColor: Colors.black54,),
            SizedBox(width: 20,),
            Expanded(
              child: LinearProgressIndicator(value: ProgressIndicator,))
          ],
        ),
      );
      },
    );
  }
}