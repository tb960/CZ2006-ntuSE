import 'package:flutter/material.dart';


//if i want to pass several arguments, instead of declaring one String selected user, i should create one class
//which contain of level, cca and all the other in one class
//then update the class in the setstate function

//when the search button is pressed, pass the selectedSearch criteria to the nameroute and in the named route,
//access it using the build context function
String selectedUser;
List<String> users = ['primary', 'secondary', 'junior college', 'hello4'];

class AdvancedSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Advanced Search'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 700,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Search'),
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/signUp',
                      arguments: selectedUser);
                    },
                  ),
                ),
                Container(
                  child: DropMenu(),
                ),
                Container(
                  child: DropMenu(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DropMenu extends StatefulWidget {
  @override
  _DropMenuState createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        hint: Text('Select Item'),
        value: selectedUser,
        onChanged: (String val) {
          setState(() {
            selectedUser = val;
          });
        },
        items: users.map((String user) {
          return DropdownMenuItem<String>(
            value: user,
            child: Row(
              children: <Widget>[
                Text(
                  user,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
