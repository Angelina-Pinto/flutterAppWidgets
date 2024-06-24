import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class InfiniteScrollScreen extends StatefulWidget {
  
  static const name = '';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  
  List<int> imagesId = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); 
    scrollController.addListener((){
      //metodo para determinar que estoy al final
      //scrollController.position.pixels
      //maximo scroll que se le puede dar 
      //espacio antes de que llegue al final 
     if((scrollController.position.pixels +500)>= scrollController.position.maxScrollExtent){
        loadNextPage();
     }

    });
  }

  @override
  void dispose(){
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }
  
  void moveScrollToBottom(){
    if(scrollController.position.pixels +100 <= scrollController.position.devicePixelRatio) return;
    scrollController.animateTo(

      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn);
  }

  Future<void> onRefresh() async{
    isLoading = true;
    setState(() {
      
    });
    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted)return;
    isLoading = false;
    final lasId = imagesId.last;
    
    imagesId.clear();
    imagesId.add(lasId + 1);
    addFiveImages();
    setState(() { });
    
  }


  void addFiveImages(){
    // con esto se cual es el ultimo 
    final lastId = imagesId.last;

//esto es equivalente a la lina de la lista 
    // imagesId.add(lastId + 1);
    // imagesId.add(lastId + 2);
    // imagesId.add(lastId + 3);
    // imagesId.add(lastId + 4);
    // imagesId.add(lastId + 5);
    //barro elementos de imagesId y necesito insertar 5 mas 
    imagesId.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
      );
      

  }
  Future loadNextPage() async {
    // si es false no hace nada 
    
    if(isLoading) return; 
    // si no esta cargando pondremos el loadin en true
    //para que redibuje vamos a llamar al setState 
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2 ));
    addFiveImages();
    isLoading = false;

    //TODO Revisar si esta montado el componente / widget 
    if(!isMounted) return;
    setState(() {});
    //TODO MOVER SCROLL 
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Infinite Scroll'),
        ),
        body: RefreshIndicator(
          onRefresh: onRefresh, 
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesId.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesId[index]}/500/300'));
            },
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          //si isLoading esta en true muestra el widget refresh_rounded
          child: isLoading
          ? SpinPerfect(
            infinite: true,
            child: Icon(Icons.refresh_rounded)
            )
            : const Icon(Icons.arrow_back_ios_new_outlined)
          ),
      ),
    );
  }
}