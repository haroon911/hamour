import 'package:flutter/material.dart';

import 'graph_model.dart';

class BarGraphModel {
  String lable;
  Color color;
  List<GraphModel> graph;

  BarGraphModel(
      {required this.lable, required this.color, required this.graph});
}
