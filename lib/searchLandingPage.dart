import 'package:flutter/material.dart';

class SearchLandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: CurvePainter(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 30.0, top: 25.0),
                  child: Text(
                    "SchoolFinder",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 38.0, top: 10.0),
                  child: Text(
                    "Start Your Searching Here!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Image(
                              image: AssetImage('images/searchLandingPage.jpg'),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: new EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.22,
                            right: 40.0,
                            left: 40.0),
                        child: new Container(
                          height: 230.0,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Color(0x8CFFFFFF),
                            elevation: 8.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  width: 250.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.white,
                                  ),
                                  child: TextField(
                                    onTap:()=>print('i am clicked!'),
                                    decoration: InputDecoration(
                                      fillColor: Colors.black,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0),)
                                      ),
                                      hintText: 'Enter a search term...',
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 50.0,
                                  child: RaisedButton(
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            color: Colors.blue,
                                        )
                                    ),
                                    child: Text(
                                        "Advanced Search",
                                        style: TextStyle(fontSize: 18)
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/advancedSearch');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xFF897CFF);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.21);
    path.quadraticBezierTo(
        size.width*0.15, size.height*0.178, size.width*0.38, size.height * 0.2217);
    path.quadraticBezierTo(
        size.width*0.5814, size.height*0.23698, size.width*0.6315, size.height * 0.1971);
    path.quadraticBezierTo(
        size.width*0.6917, size.height*0.1518, size.width*0.8301, size.height * 0.113);
    path.quadraticBezierTo(
        size.width*0.9801, size.height*0.079, size.width, size.height * 0.083);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);



    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}