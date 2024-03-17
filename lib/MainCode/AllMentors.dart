import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hackhive/MainCode/Model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'UserBooKSlot/BookSlot.dart';

class AllMentors extends StatefulWidget {
  const AllMentors({super.key});

  @override
  State<AllMentors> createState() => _AllMentorsState();
}

class _AllMentorsState extends State<AllMentors> {
  List<Mentors> mentors = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final url = 'https://hackhive-justcoders.onrender.com/api/user/getMentorList';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final finalResult = result['mentor'] as List<dynamic>;

      setState(() {
        mentors = finalResult.map((e) {
          return Mentors(name: e['username'], profession: e['profession'], qualification: e['qualification'], charges: e['chargesph'], id: e['_id'],image: e['imagepath']);
        }).toList();
        _isLoading = false;
      });
    } else {
      print(response.statusCode);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Mentor'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Show progress indicator while loading
          : ListView.builder(
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          final mentor = mentors[index];

          String profession = mentor.profession;
          String formattedProfession = formatStringOnCapital(profession);


          return Container(
            height: 350,
            child: Card(
              elevation: 1,
              margin: EdgeInsets.only(left: 25, right: 25, top: 20,bottom: 10),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade50,
                      Colors.blue.shade100,
                      Colors.blue.shade200,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(

                        children: [
                          Expanded(child: Container(
                              height: 60,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(mentor.image),
                              ))),
                          SizedBox(width: 15,),
                          Expanded(
                            flex: 5,
                            child: Text(
                              mentor.name,
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Profession : ${formattedProfession}\n',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Qualification : ${mentor.qualification}\n',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Charges per Session : ${mentor.charges.toString()}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('View More', style: TextStyle(color: Colors.black)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BookSlot(mentor: mentor.id)),
                              );
                            },
                            child: Text('Book Now', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String formatStringOnCapital(String input) {
    RegExp regex = RegExp(r'(?=[A-Z])'); // Lookahead for capital letters
    List<String> words = input.split(regex);
    return words.join(' '); // Join the words with a space
  }
}
