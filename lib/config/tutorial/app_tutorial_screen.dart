import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({required this.title, required this.caption, required this.imageUrl});
}

//una lista de tipo SlideInfo
final slides = <SlideInfo>[
  SlideInfo(title: 'Busca la comida', caption: 'Commodo ipsum nisi Lorem tempor dolore laborum amet eu culpa sunt. Minim exercitation incididunt do dolore amet in dolor. Et tempor cillum aute est sit aute elit reprehenderit elit fugiat.', imageUrl: 'assets/images/1.png'),
  SlideInfo(title: 'Busca la comida', caption: 'Nulla ad fugiat culpa laboris consequat ullamco elit sunt dolore in ut sint sunt nulla. Fugiat aliqua dolor nostrud dolor aliquip aute enim dolore ut. Incididunt occaecat ut duis velit ipsum adipisicing ad non. Laborum est veniam pariatur duis aliquip excepteur deserunt occaecat magna nisi nulla commodo.', imageUrl: 'assets/images/2.png'),
  SlideInfo(title: 'Busca la comida', caption: 'captiEsse sit incididunt commodo voluptate laboris. Id dolor irure et duis qui est anim magna qui do dolor. Tempor laborum sunt aliqua sit voluptate anim enim dolor eu excepteur. Mollit minim irure nulla quis. Deserunt amet eu nisi sit deserunt ad id ex reprehenderit duis ad ut magna adipisicing. Cillum reprehenderit veniam irure consequat amet cillum ea amet sint nulla irure adipisicing aute ea.on', imageUrl: 'assets/images/3.png'),
  
];




class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  
 
  final PageController pageviewController = PageController();
  //variable para saber en que pantalla estamos 
  bool endReach = false;

   @override
   void initState(){
      super.initState();

      pageviewController.addListener((){
        //page es igual a pageviexConroller y si no tenemos valor estamos en la cero 
        final page = pageviewController.page ?? 0;
        print('${pageviewController.page}');
        print('end reach');
        print(endReach);
        //si endReach es false y 3 - 1.5  = 2.5  page:0.00297 >= 3
       
        if( !endReach && page >= (slides.length - 1.5) ){
          setState(() {
            endReach = true;
          });
        }
        
      });
    
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slidesData) => _Slide(
              title: slidesData.title, 
              caption: slidesData.caption, 
              imageUrl: slidesData.imageUrl
              )
              ).toList()
          ),
          
         
          Positioned(
            right: 20,
            top: 30,
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text('Salir'),
              
              ),
              ),
              //si ya se llego mostremos positioned de lo contrario sizeBox 
              endReach ?
              Positioned(
                bottom: 30,
                right: 30,
                child: FilledButton(
                  
                  onPressed:() => context.pop(), 
                  child: Text('Comenzar'))):SizedBox()

        ],
      ),
    );
  }
}
class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;
  
  const _Slide({required this.title,
   required this.caption, 
   required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captioStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Image(image: AssetImage(imageUrl),),
              const SizedBox(height: 20,),
              Text(title, style: titleStyle ,),
              const SizedBox(height: 10,),
              Text(caption, style: captioStyle,)

          ]
        ),
      ),
      
    );
  }
}