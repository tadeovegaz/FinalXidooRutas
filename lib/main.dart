// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:xidoorutas/pages/anuncios.dart';
import 'package:xidoorutas/pages/comercios.dart';
import 'package:xidoorutas/pages/perfil.dart';
import 'package:xidoorutas/pages/r_cultural.dart';
import 'package:xidoorutas/pages/rutas.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;
  final pantallas = [
    Perfil(),
    Comercios(),
    Rutas(),
    Rcultural(),
    Anuncios(),
  ];
  final items = <Widget>[
    const Icon(Icons.account_circle_rounded, size: 30),
    const Icon(Icons.shopping_basket, size: 30),
    Icon(Icons.directions_bus, size: 30),
    Icon(Icons.museum, size: 30),
    Icon(Icons.message, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800]
        ),
      home: Scaffold(
        extendBody: true,
        body: pantallas[index],
        bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ), 
        child: CurvedNavigationBar(
          key: navigationKey,
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
          buttonBackgroundColor: Colors.amber,
          color: Colors.black87,
          height: 60,
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index)
        ),
        )
      )
    );
    
    
  }
}

