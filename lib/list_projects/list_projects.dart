import 'package:flutter/cupertino.dart';
import 'package:flutter_challenge/projects/staggered_dual_view/main_steggered_dual_view.dart';
import 'package:flutter_challenge/projects/vinil_animation/home_vinil.dart';

class ListProjects {
  final String title;
  final Widget page;

  static final list_project = [
    ListProjects(
      title: 'Vinil Animation',
      page: HomeVinil(),
    ),
    ListProjects(
      title: 'Steggered Dual View',
      page: MainSteggeredDualView(),
    ),
  ];

  ListProjects({required this.title, required this.page});
}
