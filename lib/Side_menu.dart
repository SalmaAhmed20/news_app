import 'package:flutter/material.dart';

class Side_Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        backgroundColor: Color.fromARGB(255, 57, 165, 82),
      ),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 140,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 57, 165, 82),
                ),
                child: Center(
                  child: Text(
                    'News App!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 10, left: 10),
              leading: Icon(
                Icons.view_list_rounded,
                size: 35,
                color: Colors.black,
              ),
              title: Align(
                child: new Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                alignment: Alignment(-1.2, 0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(
                Icons.settings,
                size: 35,
                color: Colors.black,
              ),
              title: Align(
                child: new Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                alignment: Alignment(-1.2, 0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
