import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:task_manager/styles/font.dart';
import 'package:task_manager/view/importance.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  void showModalImportanceTask() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const NewTask()),
    // );
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ),
            Container(height: 50.h, child: Importance()),
          ],
        );
      },
    );
  }

  var formatter = DateFormat('dd/MM/yyyy');
  ValueNotifier<String?> dateString = ValueNotifier(null);
  ValueNotifier<String> title = ValueNotifier('');
  ValueNotifier<String> description = ValueNotifier('');
  int? beginHour = 0;
  int? beginMinute = 0;
  int? endHour = 0;
  int? endMinute = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      height: MediaQuery.of(context).size.height * 1,
      child: Form(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Nome:',
              style: textTitle,
            ),
            ValueListenableBuilder(
              valueListenable: title,
              builder: (context, value, child) {
                return TextFormField(
                  onChanged: (value) {
                    title.value = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Insira o nome da da tarefa',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      fillColor: Colors.white70),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Text(
                'Descrição:',
                style: textTitle,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: description,
              builder: (context, value, child) {
                return TextFormField(
                  onChanged: (value) {
                    description.value = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Insira a descrição da tarefa',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      fillColor: Colors.white70),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Text(
                    'Horário da Tarefa:',
                    style: textTitle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15.w,
                        height: 8.h,
                        child: ListWheelScrollView(
                          itemExtent: 50,
                          onSelectedItemChanged: (value) {
                            beginHour = value;
                          },
                          children: List.generate(24, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${index.toString().padLeft(2, '0')}',
                                  style: textTitle,
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                      Text(':'),
                      SizedBox(
                        width: 15.w,
                        height: 8.h,
                        child: ListWheelScrollView(
                          itemExtent: 50,
                          onSelectedItemChanged: (value) {
                            beginMinute = value;
                          },
                          children: List.generate(60, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${index.toString().padLeft(2, '0')}',
                                  style: textTitle,
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                        child: Center(
                          child: Text(
                            'Até',
                            style: textBody,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                        height: 8.h,
                        child: ListWheelScrollView(
                          itemExtent: 50,
                          onSelectedItemChanged: (value) {
                            endHour = value;
                          },
                          children: List.generate(24, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${index.toString().padLeft(2, '0')}',
                                  style: textTitle,
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                      Text(':'),
                      SizedBox(
                        width: 15.w,
                        height: 8.h,
                        child: ListWheelScrollView(
                          itemExtent: 50,
                          onSelectedItemChanged: (value) {
                            endMinute = value;
                          },
                          children: List.generate(60, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${index.toString().padLeft(2, '0')}',
                                  style: textTitle,
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          if (title.value == '' || description.value == '') {
                            return AlertDialog(
                              scrollable: true,
                              title: Text('Atenção!'),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Todos os campos devem ser preenchidos'),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                )
                              ],
                            );
                          } else if (beginHour == endHour &&
                              beginMinute == endMinute) {
                            return AlertDialog(
                              scrollable: true,
                              title: Text('Atenção!'),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'O tempo de ínicio e fim devem ser diferentes!'),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                )
                              ],
                            );
                          }
                          return AlertDialog(
                            scrollable: true,
                            title: Text('Atenção!'),
                            content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(title.value),
                                    Text(description.value),
                                    Text(beginHour.toString() +
                                        ':' +
                                        beginMinute.toString()),
                                  ],
                                )),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              )
                            ],
                          );
                        });
                  },
                  child: CircleAvatar(
                    minRadius: 7.w,
                    child: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
