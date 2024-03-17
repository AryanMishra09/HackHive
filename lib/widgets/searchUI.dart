import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black38.withOpacity(0.5), //color of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        //controller: searchController,
        onChanged: (value) {
          setState(() {

          });
        },
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black45),
          prefixIcon: Icon(Icons.search, color: Colors.black),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              //searchController.clear();
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}

