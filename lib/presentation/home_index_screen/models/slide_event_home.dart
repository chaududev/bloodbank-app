import 'package:flutter/material.dart';

class ModelEventSlide {
  ModelEventSlide(
      {Key? key,
      this.time,
      this.title,
      this.type,
      required this.path,
      this.description,
      this.content});
  String? time;
  String? title;
  String? type;
  String path;
  String? content;
  String? description;
}
