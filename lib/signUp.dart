import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


//for advanced search, if i want to pass many arguments from one route to another name route, i need to define one class to store the
//advanced search criteria i wanted to pass

//first we should make a function to fetch the length of the data
Future<int> fetchLength(String url) async{
  int totalRecords;
  var response = await http.get(url);

  if (response.statusCode == 200) {
    String data = response.body;
    totalRecords = jsonDecode(data)['result']['total'];
  } else {
    print('Response statusCode: ${response.statusCode}');
    throw Exception('Failed to fetch data');
  }

  return totalRecords;
}

String convert(String filter){
  String filStrUpper = filter.toUpperCase();
  List<String> filStr = filStrUpper.split(' ');

  String filteredStr = filStr.join("%20");

  return filteredStr;
}

Future<List<String>> fetchSchoolBasedOnLevel(String level) async{
  // List<String> li = level.split(' ');
  // for( var i in li){
  //   print(i);
  // }
  // String hello = li.join("%20");
  // print(hello);
  var url;
  if(level == null){
    url = 'https://data.gov.sg/api/action/datastore_search?resource_id=ede26d32-01af-4228-b1ed-f05c45a1d8ee&fields=school_name';
  }
  else{
    String levelUpper = convert(level);
    url = 'https://data.gov.sg/api/action/datastore_search?resource_id=ede26d32-01af-4228-b1ed-f05c45a1d8ee&fields=school_name&filters=%7B%22mainlevel_code%22%3A%22${levelUpper}%22%7D';
  }

  var response = await http.get(url);
  int length = await fetchLength(url);

  if (response.statusCode == 200) {
    var schools = jsonDecode(response.body)['result']['records'];
    // print(schools);
    List<String> schoolName = [];
    for (var i in schools){
      schoolName.add(i['school_name']);
    }
    return schoolName;
  } else {
    print('Response statusCode: ${response.statusCode}');
    throw Exception('Failed to fetch data');
  }
}

class SignUpScreen extends StatefulWidget {
  final String text;
  SignUpScreen({Key key, this.text}) :super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    String test = ModalRoute.of(context).settings.arguments;
    Future<List<String>> listOfSchool = fetchSchoolBasedOnLevel(test);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(test),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: FutureBuilder<List<String>>(
              future: listOfSchool,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Expanded(
                    child:ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(8),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(snapshot.data[index]),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            )
          ),
        ],
      ),
    );
  }
}

// class SignUpScreen extends StatelessWidget{
//   final String text;
//   SignUpScreen({Key key, this.text}) : super(key : key);
//
//   @override
//   Widget build(BuildContext context){
//     final String test = ModalRoute.of(context).settings.arguments;
//     Future<List<String>> listOfSchool = fetchSchoolBasedOnLevel(test);
//
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text('Screen signup'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           color: Colors.blue,
//           child: Text(test),
//           onPressed: (){
//
//           },
//         ),
//       ),
//     );
//   }
// }