import 'package:flutter/material.dart';
import 'package:read_more_text/read_more_text.dart';
import '../style/theme.dart';
import 'Login.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AboutUs'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 30,),
              Container(
                  height: 150,
                  child: Center(child: Image.asset('assets/images/forgot.png',))),
              SizedBox(height: 20,),
              Center(child: Text('FAQs',style: style().large,)),
              SizedBox(width: 10,),


              Container(
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.all(10),

                  child: Container(

                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.shade100,
                              Colors.blue.shade200,
                              Colors.blue.shade300,
                              Colors.blue.shade400,
                            ]
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q. What is wellness warrior?',
                            style: style().small,
                          ),
                          SizedBox(height: 20),
                          ReadMoreText(
                            'Wellness warrior  is an interactive meditation and wellness  app designed to help you improve your mental well-being through guided meditations and mindfulness exercises.',
                            numLines: 1,
                            readMoreText: 'Read more',
                            readLessText: 'Read less',
                            readMoreIconColor: Colors.black,
                            style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                          ),

                          ElevatedButton(onPressed: (){

                          }, child: Text('By Top Mentor',style: TextStyle(color: Colors.black),)),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.all(10),

                  child: Container(

                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.shade100,
                              Colors.blue.shade200,
                              Colors.blue.shade300,
                              Colors.blue.shade400,
                            ]
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q. What kind of benefits does the app provide for the user?',
                            style: style().small,
                          ),
                          SizedBox(height: 20),
                          ReadMoreText(
                            'We offer a variety of guided meditations for different goals, including stress relief, sleep improvement, focus enhancement, and more.',
                            numLines: 1,
                            readMoreText: 'Read more',
                            readLessText: 'Read less',
                            readMoreIconColor: Colors.black,
                            style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                          ),

                          ElevatedButton(onPressed: (){

                          }, child: Text('By Top Mentor',style: TextStyle(color: Colors.black),)),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.all(10),

                  child: Container(

                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.shade100,
                              Colors.blue.shade200,
                              Colors.blue.shade300,
                              Colors.blue.shade400,
                            ]
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q. Do I need any prior meditation experience?',
                            style: style().small,
                          ),
                          SizedBox(height: 20),
                          ReadMoreText(
                            'No prior experience is necessary. Our app is designed to be beginner-friendly and guides you through each meditation session.',
                            numLines: 1,
                            readMoreText: 'Read more',
                            readLessText: 'Read less',
                            readMoreIconColor: Colors.black,
                            style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                          ),

                          ElevatedButton(onPressed: (){

                          }, child: Text('By Top Mentor',style: TextStyle(color: Colors.black),)),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.all(10),

                  child: Container(

                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.shade100,
                              Colors.blue.shade200,
                              Colors.blue.shade300,
                              Colors.blue.shade400,
                            ]
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q. Do I need any prior meditation experience?',
                            style: style().small,
                          ),
                          SizedBox(height: 20),
                          ReadMoreText(
                            'No prior experience is necessary. Our app is designed to be beginner-friendly and guides you through each meditation session.',
                            numLines: 1,
                            readMoreText: 'Read more',
                            readLessText: 'Read less',
                            readMoreIconColor: Colors.black,
                            style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                          ),

                          ElevatedButton(onPressed: (){

                          }, child: Text('By Top Mentor',style: TextStyle(color: Colors.black),)),


                        ],
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
}
