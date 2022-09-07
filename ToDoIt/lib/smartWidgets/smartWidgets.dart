import 'package:app/constants.dart';
import 'package:app/screens/CreateToD.dart';
import 'package:app/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class ContainerData extends StatelessWidget {
  const ContainerData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Custom Add Button
class Botton extends StatelessWidget {
  final IconData icon;
  final String text;
  const Botton({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      // width: 70,
      decoration: const BoxDecoration(
        color: Color.fromARGB(47, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 7),
          Icon(
            icon,
            size: 23,
            color: ThemeWhiteColor,
          ),
          const SizedBox(width: 7),
          Text(
            text,
            style: const TextStyle(fontSize: 15, color: ThemeWhiteColor),
          ),
          const SizedBox(width: 22),
        ],
      ),
    );
  }
}

// Custom Stacked Shape
class StackedShape extends StatelessWidget {
  final int check;
  final String name;
  const StackedShape({Key? key, this.check = 1, this.name = "Person Name"})
      : super(key: key);

  Widget _addTaskButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateToDo(
              Headingtext: "Add Task",
            ),
          ),
        );
      },
      child: const Botton(text: "Add Task", icon: Icons.add),
    );
  }

  Widget _displayCurrentDateAndCorrespondingDay() {
    return Positioned(
      left: 10,
      bottom: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        color: shockingPink,
        child: Text(
          getCurrentDate(),
          style: const TextStyle(
            fontSize: 15,
            color: ThemeWhiteColor,
            wordSpacing: 2,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  Widget _displayPersonName(Size screen) {
    return Container(
      height: 65,
      width: screen.width,
      padding: const EdgeInsets.only(top: 20, left: 14, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: ThemeWhiteColor,
        ),
      ),

      // Person Name Text Widget
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 19,
          color: ThemeWhiteColor,
          fontWeight: FontWeight.w500,
          wordSpacing: 2,
          letterSpacing: 1.8,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _displayAppMonogram() {
    return const Text(
      "ToDoIt",
      style: TextStyle(
        color: ThemeWhiteColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.8,
      ),
    );
  }

  Widget _customShape(
      {required double containerHeight,
      required double containerWidth,
      required bool showContainer,
      required double topMargin,
      required Color containerColor,
      required int clipperCheck}) {
    return ClipPath(
      clipper: MainTriangleClipper(check: clipperCheck),
      child: Container(
        margin: EdgeInsets.only(top: topMargin),
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          color: containerColor,
        ),
        child: showContainer ? const ContainerData() : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    double containerHeight = screen.height * 0.6;
    double containerWidth = screen.width;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          //Code for Shadow of Red Shape Use
          _customShape(
            containerHeight: containerHeight - 20,
            containerWidth: containerWidth,
            showContainer: false,
            topMargin: 30,
            containerColor: const Color.fromARGB(41, 90, 90, 90),
            clipperCheck: 1,
          ),

          // Code for Main Red Shape topping the Shadow
          _customShape(
            containerHeight: containerHeight,
            containerWidth: containerWidth,
            showContainer: true,
            topMargin: 0,
            containerColor: shockingPink,
            clipperCheck: 0,
          ),

          // Displaying the content in the shape if the user wants
          check == 1
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),

                  // A similar shape inscribing the red shape
                  child: ClipPath(
                    clipper: const MainTriangleClipper(),
                    child: SizedBox(
                      height: containerHeight - 40,
                      width: containerWidth - 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Costum Add Task Button
                              _addTaskButton(context),

                              // Three-Dotted Button
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: const Icon(
                              //     FontAwesomeIcons.ellipsisVertical,
                              //     size: 26,
                              //     color: ThemeWhiteColor,
                              //   ),
                              // ),

                              // App Name/Logo
                              _displayAppMonogram(),
                            ],
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            height: 76,
                            child: Stack(
                              children: [
                                // Person Name Widget Container
                                _displayPersonName(screen),
                                const SizedBox(height: 5),

                                // Positioned Container used to display Current Date
                                _displayCurrentDateAndCorrespondingDay(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

// Custom List Tile
class MyListTile extends StatefulWidget {
  final String MainText, SubText;
  final String startingDate, endingDate;

  const MyListTile({
    Key? key,
    this.MainText = "Task Name",
    this.SubText = "Task Description",
    this.startingDate = "../../....",
    this.endingDate = "../../....",
  }) : super(key: key);

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  Widget _editButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateToDo(
              Headingtext: "Edit",
              TtileValue: widget.MainText,
              DescriptionValue: widget.SubText,
            ),
          ),
        );
      },
      child: const myButton(
        text: "Edit",
        buttonColor: Colors.green,
      ),
    );
  }

  Widget _deleteButton() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content:
                const Text("Are you sure that you wanna delete this task?"),
            actions: [
              // Yes
              GestureDetector(
                onTap: () {},
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
      },
      child: const myButton(
        text: "Delete",
        buttonColor: Colors.red,
      ),
    );
  }

  Widget _showDates(Size screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
              height: 1, width: screen.width * 0.86, color: shockingPinkLight),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 8),
            child: SizedBox(
              width: screen.width,
              child: Text(
                "From: " +
                    widget.startingDate +
                    "   till: " +
                    widget.endingDate,
                style: const TextStyle(
                  color: GreyTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
              height: 1, width: screen.width * 0.86, color: shockingPinkLight),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return ExpansionTileCard(
      //initiallyExpanded: true,
      initialPadding: const EdgeInsets.all(15),
      duration: const Duration(milliseconds: 200),
      finalPadding: const EdgeInsets.all(5),
      trailing: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: shockingPink,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      initialElevation: 5,
      elevation: 10,
      title: Text(
        widget.MainText,
        style: const TextStyle(
          color: shockingPink,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: screen.width,
            child: Text(
              widget.SubText,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: GreyTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        _showDates(screen),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Delete Button here
              _deleteButton(),
              const SizedBox(width: 20),
              // Edit Button here
              _editButton(),
            ],
          ),
        ),
      ],
    );
  }
}

// Back Button
class CustomBackbutton extends StatelessWidget {
  const CustomBackbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Are you sure that you wanna quit this screen?"),
          actions: [
            // Yes
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
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
      ),
      // Popping back to previous screenA

      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            color: Color.fromARGB(48, 244, 67, 54),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Icon(
          Icons.arrow_back,
          size: 18,
          color: shockingPink,
        ),
      ),
    );
  }
}

// Custom Triangle Clipper
class MainTriangleClipper extends CustomClipper<Path> {
  final int check;
  const MainTriangleClipper({this.check = 0});
  @override
  Path getClip(
    Size size,
  ) {
    // creatuing a path
    Path path = Path();
    if (check == 0) {
      path.lineTo(0, 0);
      path.lineTo(0, size.height * 0.6);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    } else {
      path.lineTo(14, 14);
      path.lineTo(0 + 2, size.height * 0.6 + 4);
      path.lineTo(size.width - 2, size.height - 4);
      path.lineTo(size.width - 2, 0 - 4);
    }

    // returning the customized path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

// Edit/Delete Button
class myButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final double TextSize;
  final double horizontalPadding;
  const myButton(
      {Key? key,
      this.TextSize = 10,
      required this.text,
      this.horizontalPadding = 20,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: ThemeWhiteColor,
          fontSize: TextSize,
        ),
      ),
    );
  }
}

// Getting current Date
String getCurrentDate() {
  DateTime now = DateTime.now();
  // Day and Time
  return now.day.toString() +
      "-" +
      now.month.toString() +
      "-" +
      now.year.toString() +
      " | " +
      getDateName(now.weekday);
}

//

// Converting day to NameDay
String getDateName(int num) {
  if (num == 1) {
    return "Mon";
  } else if (num == 2) {
    return "Tues";
  } else if (num == 3) {
    return "Wed";
  } else if (num == 4) {
    return "Thurs";
  } else if (num == 5) {
    return "Fri";
  } else if (num == 6) {
    return "Sat";
  } else {
    return "Sun";
  }
}

// For WordCount
double countWords(String str) {
  double count = 0;
  for (int i = 0; i < str.length; i++) {
    if (str[i] == " ") {
      count++;
    }
  }
  return count;
}
