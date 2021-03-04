import 'package:flutter/material.dart';
import 'direct_select/direct_select_container.dart';
import 'direct_select/direct_select_item.dart';
import 'direct_select/direct_select_list.dart';


class AdvancedSearchScreen extends StatefulWidget {
  @override
  _AdvancedSearchScreenState createState() => _AdvancedSearchScreenState();
}

List<String> _subjects = [
  "Addtional Math",
  "Science",
  "Chemistry",
  "Biology",
  "Chinese",
  "English",
  "Computer Science",
  "Robotics",
  "Advanced Math",
  "Physics",
  "Ancient Greek",
  "Philosophy",
  "Artificial Intelligence",
  "Data Science",
  "General Studies"
];

class _AdvancedSearchScreenState extends State<AdvancedSearchScreen> {
  List<String> _ccaCategories = ["All Categories", "Club and societies", "Physical sports", "Uniformed groups", "Visual and performing arts"];

  List<String> _CCAs = [
    "Aero-Modelling",
    "Art and Crafts",
    "Audio Visual Aid",
    "Biological Science",
    "Chinese Chess"
  ];


  List<String> _points = ["1.0", "2.0", "3.0", "4.0", "5.0", "6.0", "7.0"];

  int selectedCcas = 0;
  int selectedPortionCounts = 0;
  int selectedPortionSize = 0;

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
            'Advanced Search',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
          ),
        ),
      ),
      key: scaffoldKey,
      body: DirectSelectContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 20.0),
                Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    alignment: AlignmentDirectional.centerStart,
                    margin: EdgeInsets.only(left: 4),
                    child: Column(
                      children: <Widget>[
                        Text("Education Level",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold))
                      ],
                    )),

                SizedBox(height: 20.0),
                _getFoodContainsRow(),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Selector(data: _subjects, label: "Subject Combination?"),
                      SizedBox(height: 20.0),
                      Selector(
                          data: _ccaCategories, label: "Curriculum Activities by Category and Name"),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Container(
                          decoration: _getShadowDecoration(),
                          child: Card(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                          child: DirectSelectList<String>(
                                              values: _CCAs,
                                              onUserTappedListener: () {
                                                _showScaffold();
                                              },
                                              defaultItemIndex: selectedCcas,
                                              itemBuilder: (String value) =>
                                                  getDropDownMenuItem(value),
                                              focusedItemDecoration: _getDslDecoration(),
                                              onItemSelectedListener: (item, index, context) {
                                                setState(() {
                                                  selectedCcas = index;
                                                });
                                              }),
                                          padding: EdgeInsets.only(left: 22))),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: _getDropdownIcon(),
                                  )
                                ],
                              )),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                          margin: EdgeInsets.only(left: 4),
                          alignment: AlignmentDirectional.centerStart,
                          child: Text("Cut Off Points")),
                      Row(children: <Widget>[
                        Expanded(
                            flex: 8,
                            child: Container(
                              decoration: _getShadowDecoration(),
                              child: Card(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                          child: Padding(
                                              child: DirectSelectList<String>(
                                                  values: _points,
                                                  defaultItemIndex:
                                                  selectedPortionSize,
                                                  itemBuilder: (String value) =>
                                                      getDropDownMenuItem(value),
                                                  focusedItemDecoration:
                                                  _getDslDecoration(),
                                                  onItemSelectedListener:
                                                      (item, index, context) {
                                                    setState(() {
                                                      selectedPortionSize = index;
                                                    });
                                                  }),
                                              padding: EdgeInsets.only(left: 12))),
                                      Padding(
                                        padding: EdgeInsets.only(right: 8),
                                        child: _getDropdownIcon(),
                                      )
                                    ],
                                  )),
                            )),
                      ]),
                      Row(children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                              child: const Text('Search',
                                  style: TextStyle(color: Colors.blueAccent)),
                              onPressed: () {},
                            ))
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showScaffold() {
    final snackBar = SnackBar(content: Text('Hold and drag instead of tap'));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Colors.blueAccent,
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }
}

class Selector extends StatelessWidget {
  final buttonPadding = const EdgeInsets.fromLTRB(0, 8, 0, 0);

  final List<String> data;
  final String label;

  Selector({@required this.data, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: AlignmentDirectional.centerStart,
            margin: EdgeInsets.only(left: 4),
            child: Text(label)),
        Padding(
          padding: buttonPadding,
          child: Container(
            decoration: _getShadowDecoration(),
            child: Card(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                            child: DirectSelectList<String>(
                              values: data,
                              defaultItemIndex: 0,
                              itemBuilder: (String value) =>
                                  getDropDownMenuItem(value),
                              focusedItemDecoration: _getDslDecoration(),
                            ),
                            padding: EdgeInsets.only(left: 12))),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: _getDropdownIcon(),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Colors.blueAccent,
    );
  }
}

Widget _getFoodContainsRow() {
  final cardSize = 80.0;
  final cardColor = Colors.blueGrey[100];
  return Padding(
    padding: EdgeInsets.only(left: 8, right: 8),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
              child: Center(child: Text("226")),
              height: cardSize,
              margin: EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      bottomLeft: const Radius.circular(10.0)))),
        ),
        Expanded(
          child: Container(
              child: Center(child: Text("41")),
              height: cardSize,
              margin: EdgeInsets.only(right: 3),
              decoration: BoxDecoration(color: cardColor)),
        ),
        Expanded(
          child: Container(
              child: Center(child: Text("0")),
              height: cardSize,
              margin: EdgeInsets.only(right: 3),
              decoration: BoxDecoration(color: cardColor)),
        ),
        Expanded(
          child: Container(
              child: Center(child: Text("4.5")),
              height: cardSize,
              decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(10.0),
                      bottomRight: const Radius.circular(10.0)))),
        ),
      ],
    ),
  );
}

//if i want to pass several arguments, instead of declaring one String selected user, i should create one class
//which contain of level, cca and all the other in one class
//then update the class in the setstate function

//when the search button is pressed, pass the selectedSearch criteria to the nameroute and in the named route,
//access it using the build context function
// String selectedUser;
// List<String> users = ['primary', 'secondary', 'junior college', 'hello4'];
//
// class AdvancedSearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         title: Text('Advanced Search'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Container(
//             height: 700,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(18),
//             ),
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   child: RaisedButton(
//                     color: Colors.blue,
//                     child: Text('Search'),
//                     onPressed: () {
//                       Navigator.pushNamed(context,
//                           '/signUp',
//                       arguments: selectedUser);
//                     },
//                   ),
//                 ),
//                 Container(
//                   child: DropMenu(),
//                 ),
//                 SizedBox(height: 10.0),
//                 Container(
//                   child: DropMenu(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DropMenu extends StatefulWidget {
//   @override
//   _DropMenuState createState() => _DropMenuState();
// }
//
// class _DropMenuState extends State<DropMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left:15.0),
//       width: 200.0,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         color: Colors.grey,
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           hint: Text('Select Item'),
//           value: selectedUser,
//           onChanged: (String val) {
//             setState(() {
//               selectedUser = val;
//             });
//           },
//           items: users.map((String user) {
//             return DropdownMenuItem<String>(
//               value: user,
//               child: Row(
//                 children: <Widget>[
//                   Text(
//                     user,
//                     style: TextStyle(color: Colors.black),
//                   )
//                 ],
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
