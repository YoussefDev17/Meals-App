import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Data/Dummy_Data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
