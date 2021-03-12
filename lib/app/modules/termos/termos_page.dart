import 'package:flutter/material.dart';
import 'package:iomedicamentos/app/modules/termos/termos.dart';

class TermosPage extends StatefulWidget {
  @override
  _TermosPageState createState() => _TermosPageState();
}

class _TermosPageState extends State<TermosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Text(termos, textAlign: TextAlign.justify),
          ),
        ),
      ),
    );
  }
}
