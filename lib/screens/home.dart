import 'package:flutter/material.dart';
import 'package:hcie_app_ui/data/tempdata.dart';
import '../config/appcolors.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size DEVSIZE = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryCol,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text("Home Page"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.person_outline), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings), onPressed: () {})
        ],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            height: DEVSIZE.height / 4,
            color: primaryCol,
            child: HEADERCONTENT(),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: buttonData.length,
                    itemBuilder: (context, index) => MiddleButton(
                      data: buttonData[index],
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Twitter Feeds")),
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}

class HEADERCONTENT extends StatefulWidget {
  @override
  _HEADERCONTENTState createState() => _HEADERCONTENTState();
}

class _HEADERCONTENTState extends State<HEADERCONTENT> {
  PageController _pageController;
  int _currentPage = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(viewportFraction: 0.8, initialPage: _currentPage);
  }

  Widget _buildDot() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(color: blueColor),
                    )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[_buildDot(), _buildDot(), _buildDot()],
            ),
          ),
        ],
      ),
    );
  }
}

//MiddleButton
class MiddleButton extends StatelessWidget {
  Map<String, dynamic> data;
  MiddleButton({this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              data["title"],
            ),
            Icon(
              data["iconData"],
              color: data["color"],
              size: 35,
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
