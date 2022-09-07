import 'package:app/constants.dart';
import 'package:app/screens/DataFile.dart';
import 'package:app/smartWidgets/smartWidgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: showPopUpDialog,
          child: Stack(
            children: [
              SizedBox(
                height: screen.height,
                width: screen.width,
                child: StackedShape(
                  name: personName,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screen.height * 0.3, left: 10, right: 10),
                child: Container(
                  // height: screen.height - 0.22,
                  //color: Colors.amber,
                  child: listData.isNotEmpty
                      ? ListView.builder(
                          itemCount: listData.length,
                          itemBuilder: (context, index) => MyListTile(
                            MainText: listData[index]['title'],
                            SubText: listData[index]['detail'],
                            startingDate: listData[index]['SD'],
                            endingDate: listData[index]['ED'],
                          ),
                        )
                      : SizedBox(
                          width: screen.width,
                          child: const Center(
                            child: Text(
                              "No Tasks to display",
                              style: TextStyle(
                                color: shockingPink,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
        content: const Text("Are you sure that you wanna exit?"),
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
