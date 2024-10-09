import 'package:flutter/material.dart';

class FoodController extends ChangeNotifier {
  static FoodController instance = FoodController.internal();
  FoodController.internal();
  factory FoodController() => instance;
}
