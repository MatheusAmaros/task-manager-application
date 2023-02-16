import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';
import 'package:task_manager/styles/font.dart';

class Importance extends StatefulWidget {
  const Importance({super.key});

  @override
  State<Importance> createState() => _ImportanceState();
}

class _ImportanceState extends State<Importance> {
  ValueNotifier<String> importance = ValueNotifier<String>("Muito Importante");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: Text(
            'Nível de Importância:',
            style: textTitle,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: importance,
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        importance.value = "Muito Importante";
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: importance.value == "Muito Importante"
                                ? Color.fromARGB(255, 253, 147, 140)
                                : Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25)),
                            boxShadow: importance.value != "Muito Importante"
                                ? []
                                : [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 201, 201, 201),
                                        spreadRadius: 2,
                                        blurRadius: 10)
                                  ]),
                        child: Center(
                            child: Text(
                          'Muito Importante',
                          style: textImportance,
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        importance.value = "Pouco Importante";
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: importance.value == "Pouco Importante"
                                ? Color.fromARGB(255, 255, 230, 0)
                                : Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            boxShadow: importance.value != "Pouco Importante"
                                ? []
                                : [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 201, 201, 201),
                                        spreadRadius: 2,
                                        blurRadius: 10)
                                  ]),
                        child: Center(
                            child: Text(
                          'Pouco Importante',
                          style: textImportance,
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        importance.value = "Irrelevante";
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: importance.value == "Irrelevante"
                                ? Color.fromARGB(255, 163, 255, 140)
                                : Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            boxShadow: importance.value != "Irrelevante"
                                ? []
                                : [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 201, 201, 201),
                                        spreadRadius: 2,
                                        blurRadius: 10)
                                  ]),
                        child: Center(
                            child: Text(
                          'Irrelevante',
                          style: textImportance,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
