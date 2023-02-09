import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task_manager/styles/font.dart';
import 'package:task_manager/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> indexPage = ValueNotifier(0);
  PageController _pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.white,
        title: Text(
          '27/02/2022',
          style: textAppBar,
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color.fromARGB(255, 163, 33, 238)),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          indexPage.value = 0;
                          _pageController.animateToPage(0,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceOut);
                        },
                        child: ValueListenableBuilder(
                          valueListenable: indexPage,
                          builder: (context, value, child) {
                            return Stack(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  height: indexPage.value == 0
                                      ? MediaQuery.of(context).size.height *
                                          0.05
                                      : 0,
                                  width: indexPage.value == 0
                                      ? MediaQuery.of(context).size.height *
                                          0.16
                                      : 0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 13),
                                    child: Text(
                                      "Manhã",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          indexPage.value = 1;
                          _pageController.animateToPage(1,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceOut);
                        },
                        child: ValueListenableBuilder(
                          valueListenable: indexPage,
                          builder: (context, value, child) {
                            return Stack(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  height: indexPage.value == 1
                                      ? MediaQuery.of(context).size.height *
                                          0.05
                                      : 0,
                                  width: indexPage.value == 1
                                      ? MediaQuery.of(context).size.height *
                                          0.16
                                      : 0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 13),
                                    child: Text(
                                      "Tarde",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          indexPage.value = 2;
                          _pageController.animateToPage(2,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceOut);
                        },
                        child: ValueListenableBuilder(
                          valueListenable: indexPage,
                          builder: (context, value, child) {
                            return Stack(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  height: indexPage.value == 2
                                      ? MediaQuery.of(context).size.height *
                                          0.05
                                      : 0,
                                  width: indexPage.value == 2
                                      ? MediaQuery.of(context).size.height *
                                          0.16
                                      : 0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 13),
                                    child: Text(
                                      "Noite",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
              child: PageView(
                controller: _pageController,
                children: [
                  Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [CardTask()],
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 17, 17, 17),
                  ),
                  Container(
                    color: Color.fromARGB(255, 55, 0, 255),
                  )
                ],
                onPageChanged: (value) {
                  indexPage.value = value;
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
