import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'food_item.dart';

class HiveHelper {
  static const String _foodItemsBoxName = 'foodItems';

  static Future<void> init() async {
    await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
    Hive.registerAdapter(FoodItemAdapter());
    await Hive.openBox<FoodItem>(_foodItemsBoxName);
  }

  static Box<FoodItem> get foodItemsBox =>
      Hive.box<FoodItem>(_foodItemsBoxName);

  static String _savedFoodItemsBoxName() {
    DateTime now = DateTime.now();
    String formattedDate = '${now.year}-${now.month}-${now.day}';
    return 'savedFoodItems_$formattedDate';
  }

  static Future<void> saveFoodItems() async {
    final savedBox = await Hive.openBox<FoodItem>(_savedFoodItemsBoxName());
    await savedBox.clear();
    List<FoodItem> newFoodItems = foodItemsBox.values.map((item) => FoodItem(name: item.name, calories: item.calories)).toList();
    await savedBox.addAll(newFoodItems);
  }

  static Future<List<FoodItem>> loadFoodItems() async {
    if (Hive.isBoxOpen(_savedFoodItemsBoxName())) {
      final savedBox = Hive.box<FoodItem>(_savedFoodItemsBoxName());
      return savedBox.values.toList();
    } else {
      return [];
    }
  }
}
