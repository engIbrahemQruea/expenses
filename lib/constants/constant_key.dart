import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/expenses_model.dart';

const kUuid = Uuid();

const kCategoryIcons = {
  Category.Work: Icons.work,
  Category.Food: Icons.lunch_dining,
  Category.Water: Icons.water_drop,
};
