import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task_manager/styles/font.dart';

import 'package:sizer/sizer.dart';

class CardTask extends StatefulWidget {
  const CardTask({super.key});

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
  ValueNotifier<bool> done = ValueNotifier<bool>(false);
  Color? importance;
  void teste() {
    if (done.value == false) {
      importance = Colors.amber;
      return;
    } else {
      importance = Color.fromARGB(255, 0, 0, 0);
      return;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teste();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.83,
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
            height: MediaQuery.of(context).size.height * 0.147,
            decoration: BoxDecoration(
                color: importance,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9),
                    bottomLeft: Radius.circular(9))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            'limpar a casad dsd sadasdsad sdasdasd',
                            style: textTitle,
                          ),
                        ),
                        Text(
                          '14:00 - 15:00',
                          style: textTime,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            'limpar a casadddddd ddddddddddddd dddddddddddddd',
                            overflow: TextOverflow.ellipsis,
                            style: textBody,
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: done,
                          builder: (context, value, child) {
                            return Checkbox(
                              value: done.value,
                              onChanged: (value) {
                                done.value = !done.value;
                              },
                              activeColor: Colors.green,
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
