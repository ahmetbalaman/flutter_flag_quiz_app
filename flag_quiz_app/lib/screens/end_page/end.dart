import 'package:flutter/material.dart';

class EndPage extends StatelessWidget {
  int correctNum;
  EndPage({required this.correctNum});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bayrak Tahmin Oyunu!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[

            Text("$correctNum Doğru , ${5-correctNum} yanlış",style: TextStyle(fontSize: 25),),
             Text("%${correctNum*20} Başarı Oranı ",style: TextStyle(fontSize: 25,color: Colors.pink),),
            SizedBox(height:70,
                width:200,child: ElevatedButton(onPressed: ()=>Navigator.pop(context), child: const Text("Tekrar Dene!",style: TextStyle(fontSize: 25),)))
          ],
        ),
      ),

    );
  }
}
