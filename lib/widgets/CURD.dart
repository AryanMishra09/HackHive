import 'package:flutter/material.dart';
import 'package:hackhive/widgets/Models.dart';
 import 'dart:convert';
import 'package:http/http.dart' as http;

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  List<Product> users = [];

  @override
  void initState() {
    super.initState();
    fatchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ListView.builder(itemCount: users.length,
          itemBuilder: (context, index) {

        final user = users[index];

        return ListTile(
          leading: Text(user.id.toString()),
          onTap: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => CreateProduct(),));
          },
          title: Text(user.name),
          subtitle: Text('Rs. ${user.price.toString()}'),
          trailing: Icon(Icons.add),
        );
          }
      ),
    );
  }

  Future<void> fatchData() async {
    final url = 'https://dummyjson.com/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if(response.statusCode == 200){
      print(response.statusCode);
      final result = json.decode(response.body);
      final finalResult = result['products'] as List<dynamic>;

      setState(() {
        users = finalResult.map((e) {
          return Product(name: e['title'], price: e['price'], id: e['id']);
        }).toList();
      });

      //print(result);
      //print(finalResult);
      print(finalResult[0]['id']);
    }else{
      print(response.statusCode);
    }
  }
}

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CreatePro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Container(

      ),
    );
  }

  Future<void> CreatePro() async{
    final url = 'https://servu-be.onrender.com/api/user/login/';
    final uri = Uri.parse(url);
    final body = {
      'email' : 'sak@gmail.com',
      'password':'123456'
    };
    final header = {
      'content-type' : 'application/json'
    };
    final response = await http.post(uri,body: jsonEncode(body),headers:  header);

    if(response.statusCode ==200){

      final result = json.decode(response.body);

      print(result);
      print(result['_id']);

      // String rawCookie = response.headers['set-cookie']!;
      // int index = rawCookie.indexOf(';');
      // String refreshToken =
      // (index == -1) ? rawCookie : rawCookie.substring(0, index);
      // int idx = refreshToken.indexOf("=");
      // final myToken = refreshToken.substring(idx + 1).trim();
      // print(myToken);


    }else{
      print(response.statusCode);
    }

  }
}

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdatePro(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Container(

      ),
    );
  }

  Future<void> UpdatePro(int id) async{
    final url = 'https://dummyjson.com/products/${id}';
    final uri = Uri.parse(url);
    final body = {
      'title': 'Apple16pro',
      'price' : 200
    };
    final header = {
      'content-type' : 'application/json'
    };
    final response =  await  http.put(uri,body: jsonEncode(body),headers: header);

    if(response.statusCode == 200){
      print(response.statusCode);
      print(response.body);
    }else{
      print(response.statusCode);
      print(response.body);
    }

  }
}

class DeleteProduct extends StatefulWidget {
  const DeleteProduct({super.key});

  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DeletePro(1);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> DeletePro(int id) async{
    final url = 'https://dummyjson.com/products/${id}';
    final uri = Uri.parse(url);

    final response =  await  http.delete(uri);

    if(response.statusCode == 200){
      print(response.statusCode);
      print(response.body);
    }else{
      print(response.statusCode);
      print(response.body);
    }

  }
}


