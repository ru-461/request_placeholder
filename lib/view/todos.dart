import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ロガー
final logger = Logger();

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
