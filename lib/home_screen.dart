import "package:flutter/material.dart";
import 'package:quizz_app/exam_info.dart';
import 'package:quizz_app/models/subject.dart';
import 'package:quizz_app/my_drawer.dart';
import 'package:quizz_app/models/app_data.dart';


class HomeScreen extends StatefulWidget {

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  void goTo(Subject subject) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => ExamInfo(subject)));
  }

  List<Color> checkTestResults(String? str) {
    if (str == "" || str == null) {
      return <Color>[
        Colors.grey,
        Colors.black,
      ];
    } else {
      if (str == "passed") {
        return <Color>[
          Colors.grey,
          Colors.green,
        ];
      }
      return <Color>[
        Colors.grey,
        Colors.red,
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (ctx) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(ctx).openDrawer();
            },
            splashRadius: 24,
          );
        }),
        centerTitle: true,
        title: const Text("Quizz App"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        padding: const EdgeInsets.all(16),
        itemCount:subjects.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.white, fontSize: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black,
                        Colors.grey
                      ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        subjects[index].subjName,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.timer,
                            color: Colors.white,
                          ),
                          Text(subjects[index].estimatedTime)
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text("${subjects[index].numberOfQuestions} questions"),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () => goTo(subjects[index]),
          );
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}
