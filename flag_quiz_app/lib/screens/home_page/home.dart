import 'package:flag_quiz_app/screens/game_page/game.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bayrak Tahmin Oyunu!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[

            const Text("Quiz'e Hoşgeldiniz",style: TextStyle(fontSize: 25),),
            SizedBox(height:70,
                width:200,child: ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const GamePage())), child: const Text("Başla",style: TextStyle(fontSize: 25),)))
          ],
        ),
      ),

    );
  }
}
