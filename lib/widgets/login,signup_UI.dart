import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  @override
  Widget build(BuildContext context) {

    String Gmail='',Pass='',PassCode='';

    return Scaffold(
      appBar: AppBar(
        title: Text(" ", style: TextStyle(color: Colors.black),),
        backgroundColor:     Colors.blue.shade50,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      backgroundColor: Color(0xFFEEEFF9),

      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade50,
                    Colors.blue.shade50,
                    Colors.blue.shade100,
                    Colors.blue.shade200,
                  ]
              )
          ),

          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.verified_user,size: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Poppins',
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          Gmail = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Gmail',
                          hintStyle: TextStyle(color: Colors.black54),
                          suffixText:  '.com',
                          prefixIcon: Icon(Icons.mail_outline,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30,top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          Pass = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.password_sharp,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () async{

                    // try {
                    //   UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    //       email: Gmail,
                    //       password: Pass
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text('Successfully Login')
                    //         ,backgroundColor: Colors.green.shade900,));
                    //
                    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  MainDashboard()));
                    //
                    // } on FirebaseAuthException catch (e) {
                    //   if (e.code == 'user-not-found') {
                    //     print('No user found for that email.');
                    //   } else if (e.code == 'wrong-password') {
                    //     print('Wrong password provided for that user.');
                    //   }
                    // }

                  },
                  child: Container(
                      height: 45,
                      width: 200,
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.white),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40)),

                      child:  Center(child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 15),))
                  ),
                ),
                Icon(Icons.offline_bolt_outlined,size: 30,),
                InkWell(
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Create your college account')
                          ,backgroundColor: Colors.green.shade900,));
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                  },
                  child: Container(
                      height: 45,
                      width: 200,
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.white),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40)),

                      child:  Center(child: Text('Signup',style: TextStyle(color: Colors.white,fontSize: 15),))
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.verified_user),
                        Text('Secure Login',style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Poppins',),),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),




    );
  }
}




class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  String Gmail='',Pass='',CPass='',name='';
  String college='',collegeCity='',devType='',skill='',github='',linkedin='',discord='',description='';
  String dev_Stu = 'Developer';



  // List of items in our dropdown menu
  var items = [
    'Developer',
    'Student',
    'CEO',
    'Scientist',
  ];

  @override
  Widget build(BuildContext context) {


    List<String> _locations = ['Mits Gwalior', 'IIT Bombay', 'IIT Kanpur', 'Mit Madras']; // Option 2
    String _selectedLocation;

    return Scaffold(
      appBar: AppBar(
        title: Text("", style: TextStyle(color: Colors.black),),
        backgroundColor:  Colors.blue.shade50,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      backgroundColor: Color(0xFFEEEFF9),

      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade50,
                    Colors.blue.shade50,
                    Colors.blue.shade100,
                    Colors.blue.shade200,
                    // Color(0x665ac18e),
                    // Color(0x995ac18e),
                    // Color(0xcc5ac18e),
                    // Color(0xff5ac18e),
                  ]
              )
          ),

          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.verified_user,size: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Poppins',
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Row(

                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            '                                                  Already account ?',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30,bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          name = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.verified_user,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          Gmail = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Gmail',
                          hintStyle: TextStyle(color: Colors.black54),
                          suffixText:  '.com',
                          prefixIcon: Icon(Icons.mail_outline,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30,top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          Pass = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.black54),
                            prefixIcon: Icon(Icons.password_sharp,color: Colors.black54,),
                            border: InputBorder.none,
                            filled: false
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30,top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value) {
                          CPass = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.password_sharp,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),




                InkWell(
                  onTap: () async{
                    if(name.isEmpty || Gmail.isEmpty || Pass.isEmpty || CPass.isEmpty || college.isEmpty || collegeCity.isEmpty
                        || devType.isEmpty || dev_Stu.isEmpty || skill.isEmpty || github.isEmpty || linkedin.isEmpty
                        || discord.isEmpty || description.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Required Field')
                            ,backgroundColor: Colors.green.shade900,));
                    }else {

                      // try {
                      //   UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      //     email: Gmail,
                      //     password: Pass,
                      //   );
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text('Successfully Account Create')
                      //         ,backgroundColor: Colors.green.shade900,));
                      //
                      //   databaseReference = FirebaseDatabase.instance.ref().child("user");
                      //   databaseReference2 = FirebaseDatabase.instance.ref().child("user").child(auth.currentUser!.uid).child("Details").child("profileData");
                      //
                      //   Map<String, dynamic> Data = {
                      //     "Uid": auth.currentUser!.uid,
                      //     "gmail": Gmail,
                      //     "password": Pass,
                      //     "name": name,
                      //     "college": college,
                      //     "collegeCity": collegeCity,
                      //     "dev_stu": dev_Stu,
                      //     "devType": devType,
                      //     "skill": skill,
                      //     "github": github,
                      //     "linkedin": linkedin,
                      //     "discord": discord,
                      //     "description": description,
                      //   };
                      //   Map<String, dynamic> pData = {
                      //     "Uid": auth.currentUser!.uid,
                      //     "name": name,
                      //     "college": college,
                      //     "collegeCity": collegeCity,
                      //     "dev_stu": dev_Stu,
                      //     "devType": devType,
                      //     "skill": skill,
                      //     "github": github,
                      //     "linkedin": linkedin,
                      //     "discord": discord,
                      //     "description": description,
                      //   };
                      //
                      //   databaseReference.child(auth.currentUser!.uid).set(Data);
                      //   databaseReference2.child(auth.currentUser!.uid).set(pData);
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text('Successfully Created')
                      //         ,backgroundColor: Colors.green.shade900,));
                      //
                      //   Navigator.pushReplacement(
                      //       context, MaterialPageRoute(builder: (_) =>   Login()));
                      //
                      //   await credential.user?.updateDisplayName(name);
                      // } on FirebaseAuthException catch (e) {
                      //   if (e.code == 'weak-password') {
                      //     print('The password provided is too weak.');
                      //   } else if (e.code == 'email-already-in-use') {
                      //     print('The account already exists for that email.');
                      //   }
                      // } catch (e) {
                      //   print(e);
                      // }

                    }
                  },
                  child: Container(
                      height: 45,
                      width: 200,
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.white),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40)),

                      child:  Center(child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 15),))
                  ),

                ),
                Icon(Icons.offline_bolt_outlined,size: 30,),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                  },
                  child: Container(
                      height: 45,
                      width: 200,
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 100),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.white),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40)),

                      child:  Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 15),))
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

