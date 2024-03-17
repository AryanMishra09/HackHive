import 'package:flutter/material.dart';

import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:hackhive/MainCode/AboutUs.dart';
import 'package:hackhive/MainCode/Home.dart';
import 'package:hackhive/MainCode/UserBooKSlot/UserBookingHistory.dart';
import 'package:hackhive/main.dart';
import 'package:hackhive/widgets/bottomBar.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    title: 'Home',
  ),
  TabItem(
    icon: Icons.account_circle,
    title: 'About',
  ),
  TabItem(
    icon: Icons.history,
    title: 'History',
  ),


];

class HomeOption extends StatefulWidget {
  const HomeOption({super.key});

  @override
  State<HomeOption> createState() => _HomeOptionState();
}

class _HomeOptionState extends State<HomeOption> {

  int pageIndex = 0;
  double height = 25;
  Color colorSelect =Colors.white;
  Color color = Colors.black;
  Color color2 = Colors.black;
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {

    final pages = [

      Home(),
      AboutUs(),
      UserBookingHistory()

    ];

    return Scaffold(
      backgroundColor: const Color(0xfffcf5f4),

      body: pages[pageIndex],
      bottomNavigationBar: Container(

        child:  BottomBarInspiredInside(

          padTop: 5,
          padbottom: 5,
          sizeInside: 50,
          items: items,
          backgroundColor: bgColor,
          elevation: 25,
          color: Colors.black,
          colorSelected: Colors.white,
          indexSelected: pageIndex,
          onTap: (int index) => setState(() {
            pageIndex = index;
          }),
          chipStyle:const ChipStyle(convexBridge: true),
          itemStyle: ItemStyle.circle,
          animated: true,
          duration: Duration(milliseconds: 500),

        ),
      ),

      // floatingActionButton: DraggableFab(
      //
      //   child: FloatingActionButton(
      //     onPressed: () async {
      //       //Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewContainer(url: 'https://web.mitsgwalior.in/'),));
      //       final encodedUrl = Uri.encodeFull('https://web.mitsgwalior.in/');
      //       await launch(encodedUrl);
      //     },
      //     child: Image.asset('assets/images/mlogo.png',height: 30,width: 50,),
      //     focusColor: Colors.red.shade100,
      //     backgroundColor: Colors.red.shade100,
      //     elevation: 50,
      //     autofocus: true,
      //
      //   ),
      // ),

    );
  }
}
