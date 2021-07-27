import 'package:flutter/cupertino.dart';
import 'package:flutter_challenge/vinil_animation/home_vinil.dart';

class ListProjects {
  final String title;
  final Widget page;

  static final list_project = [
    ListProjects(
      title: 'Vinil Animation',
      page: HomeVinil(),
    ),
  ];

  ListProjects({required this.title, required this.page});
}
