import 'dart:collection';

import 'package:flag_quiz_app/screens/end_page/end.dart';
import 'package:flag_quiz_app/veritaban_darts/flags_dao.dart';
import 'package:flutter/material.dart';

import '../../veritaban_darts/flag_models.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Flags> questions = [];
  List<Flags> wrongChoices = [];
  late Flags correctChoice;
  var allChoices = HashSet<Flags>();

  int questionTimer = 0;
  int correctTimer = 0;
  int wrongTimer = 0;

  String flagPhoto = "placeholder.png";
  String choiceA = "";
  String choiceB = "";
  String choiceC = "";
  String choiceD = "";

  @override
  void initState() {
    super.initState();
    takeQuest();
  }

  Future<void> takeQuest() async {
    questions = await FlagDAO().randomFlag5Show();
    loadQuest();
  }

  Future<void> loadQuest() async {
    correctChoice = questions[questionTimer];
    flagPhoto = correctChoice.flag_photo!;
    wrongChoices = await FlagDAO().randomWrongFlag3Show(correctChoice.flag_id!);

    allChoices.clear();
    allChoices.add(correctChoice);
    allChoices.add(wrongChoices[0]);
    allChoices.add(wrongChoices[1]);
    allChoices.add(wrongChoices[2]);
    //hashset will create automaticly random order on wrong choices

    choiceA = allChoices.elementAt(0).flag_name!;
    choiceB = allChoices.elementAt(1).flag_name!;
    choiceC = allChoices.elementAt(2).flag_name!;
    choiceD = allChoices.elementAt(3).flag_name!;

    setState(() {});
  }

  void questTimerControl() {
    questionTimer = questionTimer + 1;
    if (questionTimer != 5) {
      loadQuest();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => EndPage(
                    correctNum: correctTimer,
                  )));
    }
  }

  void correctControl(String correctStr) {
    if (correctChoice.flag_name == correctStr) {
      correctTimer++;
    } else {
      wrongTimer++;
    }
  }

  @override
  Widget build(BuildContext context) {
    var ekranolc = MediaQuery.of(context).size;
    var ekrangen = ekranolc.width;
    var ekranyuk = ekranolc.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //DOĞRU YANLIŞ KISMI

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Correct:$correctTimer ",
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  "Wrong:$wrongTimer",
                  style: const TextStyle(fontSize: 25),
                )
              ],
            ),

            questionTimer != 5
                ? Text(
                    "${questionTimer + 1}.Question",
                    style: const TextStyle(fontSize: 40),
                  )
                : const Text(
                    "5.Soru",
                    style: TextStyle(fontSize: 40),
                  ),
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset("flags/$flagPhoto"),
            ),

            SizedBox(
              width: ekrangen * 0.7,
              height: ekranyuk * 0.08,
              child: ElevatedButton(
                  onPressed: () {
                    correctControl(choiceA);
                    questTimerControl();
                  },
                  child: Text(choiceA)),
            ),
            SizedBox(
              width: ekrangen * 0.7,
              height: ekranyuk * 0.08,
              child: ElevatedButton(
                  onPressed: () {
                    correctControl(choiceB);
                    questTimerControl();
                  },
                  child: Text(choiceB)),
            ),
            SizedBox(
              width: ekrangen * 0.7,
              height: ekranyuk * 0.08,
              child: ElevatedButton(
                  onPressed: () {
                    correctControl(choiceC);
                    questTimerControl();
                  },
                  child: Text(choiceC)),
            ),
            SizedBox(
              width: ekrangen * 0.7,
              height: ekranyuk * 0.08,
              child: ElevatedButton(
                  onPressed: () {
                    correctControl(choiceD);
                    questTimerControl();
                  },
                  child: Text(choiceD)),
            )
          ],
        ),
      ),
    );
  }
}
