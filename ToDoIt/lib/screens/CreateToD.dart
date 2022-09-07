// ignore_for_file: prefer_const_constructors

import 'package:app/constants.dart';
import 'package:app/smartWidgets/smartWidgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:intl/intl.dart';

class CreateToDo extends StatefulWidget {
  final String Headingtext;
  final String TtileValue;
  final String DescriptionValue;
  const CreateToDo(
      {Key? key,
      required this.Headingtext,
      this.TtileValue = "",
      this.DescriptionValue = ""})
      : super(key: key);

  @override
  State<CreateToDo> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDo> {
  Widget _TitleField() {
    return TextFormField(
      maxLength: 40,
      initialValue: widget.TtileValue,
      cursorColor: shockingPink,
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Required";
        }
      },
      decoration: const InputDecoration(
        hintText: "Enter task title",
        hintStyle: TextStyle(
          color: Color.fromARGB(204, 158, 158, 158),
        ),
        labelText: "Title",
        labelStyle: TextStyle(color: shockingPink),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: shockingPink),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: shockingPink),
        ),
      ),
    );
  }

  Widget _DescriptionField() {
    return TextFormField(
      focusNode: FocusNode(canRequestFocus: false),
      maxLength: 250,
      initialValue: widget.DescriptionValue,
      cursorColor: shockingPink,
      decoration: const InputDecoration(
        hintText: "Enter short description of your task",
        hintStyle: TextStyle(
          color: Color.fromARGB(204, 158, 158, 158),
        ),
        labelText: "Desciption",
        labelStyle: TextStyle(
          color: shockingPink,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: shockingPink),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: shockingPink),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: showPopUpDialog,
        child: Scaffold(
          body: Stack(
            children: [
              const StackedShape(check: 0),
              Center(
                child: Container(
                  height: screen.height * 0.7,
                  width: screen.width * 0.87,
                  decoration: const BoxDecoration(
                    color: CustomTileColor,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 00),
                        color: ShadowColor,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Back Button
                            const CustomBackbutton(),

                            //const SizedBox(width: 30),
                            // Title
                            Text(
                              widget.Headingtext,
                              style: const TextStyle(
                                fontSize: 20,
                                color: shockingPink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(width: 30),
                          ],
                        ),

                        const SizedBox(height: 60),

                        // Title Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Title Field
                            _TitleField(),

                            const SizedBox(height: 30),

                            // Description Field
                            _DescriptionField(),

                            const SizedBox(height: 20),

                            // Initial Date Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    showDatePicker(
                                        context: context,
                                        initialDate: now,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100));
                                  },
                                  child: myButton(
                                    text: "Set Starting Date",
                                    buttonColor: GreyTextColor,
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () async {
                                    showDatePicker(
                                        context: context,
                                        initialDate: now,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100));
                                  },
                                  child: myButton(
                                    text: "Set Ending Date",
                                    buttonColor: GreyTextColor,
                                  ),
                                ),
                                // Container(
                                //   width: 140,
                                //   height: 30,
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       color: ScaffoldBgColor,
                                //       width: 1,
                                //     ),
                                //   ),
                                //   child: Align(child: Text("Required")),
                                // ),
                              ],
                            ),

                            const SizedBox(height: 50),
                            // Create/ Edit Button
                            Align(
                              child: GestureDetector(
                                onTap: () {},
                                child: myButton(
                                  text: widget.Headingtext[0] == "A"
                                      ? "Create Task"
                                      : "Update Task",
                                  buttonColor: shockingPink,
                                  TextSize: 15,
                                  horizontalPadding: 60,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showPopUpDialog() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Are you sure that you wanna exit this screen?"),
        actions: [
          // Yes
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(true);
            },
            child: const myButton(
              text: "Yes",
              buttonColor: Colors.green,
            ),
          ),

          // No

          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: const myButton(
              text: "No",
              buttonColor: Colors.red,
            ),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }
}

String _TextValidator(String value) {
  return value.isEmpty ? "Title is Required" : "";
}
