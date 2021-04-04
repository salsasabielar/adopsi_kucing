//kode utama Aplikasi tampilan awal
import 'package:adopsi_kucing/entryCustomer.dart';
import 'package:adopsi_kucing/model/customer.dart';
import 'package:flutter/material.dart';
import 'home.dart'; //package letak folder Anda

void main() {
  Customer customer;
  runApp(MaterialApp(
    //mendefinisikan route
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/customer': (context) => EntryFormCustomer(customer),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Item',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(),
    );
  }
}
