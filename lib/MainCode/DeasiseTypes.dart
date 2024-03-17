// import 'package:flutter/material.dart';
//
// class DiseaseType extends StatefulWidget {
//   const DiseaseType({super.key});
//
//   @override
//   State<DiseaseType> createState() => _DiseaseTypeState();
// }
//
// class _DiseaseTypeState extends State<DiseaseType> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Disease Types'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Card(
//               elevation: 1,
//               margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
//
//               child: Container(
//                 width: double.maxFinite,
//
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.blue.shade50,
//                           Colors.blue.shade50,
//                           Colors.blue.shade100,
//                           Colors.blue.shade200,
//                         ]
//                     )
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'mentor.name',
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Text(
//                         'Description:-',
//                         style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       Text(
//                         'Profession : ${mentor.profession}',
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         'Qualification : ${mentor.qualification}',
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         'Charges PH : ${mentor.charges.toString()}',
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//
//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ElevatedButton(onPressed: (){
//
//                           }, child: Text('View More',style: TextStyle(color: Colors.black),)),
//                           ElevatedButton(onPressed: (){
//
//                           }, child: Text('Book Now',style: TextStyle(color: Colors.black),)),
//                         ],
//                       ),
//
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
