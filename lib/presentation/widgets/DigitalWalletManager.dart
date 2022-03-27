import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:crypto_wallet_manager/presentation/widgets/decrypt/code_scanner.dart';
import 'package:flutter/material.dart';

import 'encrypt/generate_barcode.dart';
import 'home/Home.dart';

class DigitalWalletManager extends StatefulWidget {
  @override
  State createState() => _DigitalWalletManager();
}

class _DigitalWalletManager extends State<DigitalWalletManager> {
  int _selectedState = 0;
  final _pages = [BarCodeScanner(), GenerateBarcode()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        routes: {
          "/home": (_) => Home(),
          "/decrypt": (_) => BarCodeScanner(),
          "/encrypt": (_) => GenerateBarcode(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
            drawer: Drawer(
              backgroundColor: Colors.black,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[],
              ),
            ),
            body: _pages[_selectedState],
            backgroundColor: Colors.white,
            bottomNavigationBar: ConvexAppBar(
                backgroundColor: Colors.black,
                items: const [
                  TabItem(icon: Icons.qr_code, title: ''),
                  TabItem(icon: Icons.add, title: ''),
                ],
                initialActiveIndex: _selectedState,
                onTap: (int index) {
                  setState(() {
                    _selectedState = index;
                  });
                })));
  }
}
