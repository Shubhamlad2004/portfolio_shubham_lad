import 'package:flutter/material.dart';
import '/widgets/navbar.dart';



class HomePage extends StatelessWidget {
  return Scaffold(
    body: SingleChildScrollView( // So it scrolls vertically
      child: Column(
        children: [
          Navbar(),       // From navbar.dart
        ]
      )
    )
  );
}
