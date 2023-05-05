import 'package:flutter/material.dart';
import 'hive_helper.dart';
import 'food_item.dart'; // Make sure you have this import

enum FoodType { meal, snack, drink }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  runApp(CalorieTrackerApp());
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Calorie Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Calorie Tracker App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
              child: Text('Start Tracking Calories'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserInfoPage()),
              ),
              child: Text('Enter User Information'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              ),
              child: Text('History'),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Center(
        child: Text('Display history here'),
      ),
    );
  }
}


class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String? gender;
  String? goal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (cm)'),
            ),
            DropdownButtonFormField<String>(
              value: gender,
              onChanged: (String? newValue) {
                setState(() {
                  gender = newValue!;
                });
              },
              decoration: InputDecoration(labelText: 'Gender'),
              items: <String>['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButtonFormField<String>(
              value: goal,
              onChanged: (String? newValue) {
                setState(() {
                  goal = newValue!;
                });
              },
              decoration: InputDecoration(labelText: 'Goal'),
              items: <String>['Lose weight', 'Maintain weight', 'Gain weight'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save user information and navigate back
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}



class CalorieTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class Food {
  final String name;
  final int calories;
  final String category;

  Food({required this.name, required this.calories, required this.category});
}

class FoodDatabase {
  static List<Food> foods = [
    Food(name: 'Grilled chicken breast', calories: 165, category: 'meal'),
    Food(name: 'Beef burger', calories: 354,category: 'meal'),
    Food(name: 'Veggie burger', calories: 124, category: 'meal'),
    Food(name: 'Caesar salad', calories: 163, category: 'meal'),
    Food(name: 'Margherita pizza', calories: 250, category: 'meal'),
    Food(name: 'Spaghetti & meatball', calories: 410, category: 'meal'),
    Food(name: 'Fish and chips', calories: 800, category: 'meal'),
    Food(name: 'Chicken stir-fry', calories: 250, category: 'meal'),
    Food(name: 'Tuna sandwich', calories: 290, category: 'meal'),
    Food(name: 'PB and jam sandwich', calories: 360, category: 'meal'),
    Food(name: 'Grilled cheese sandwich', calories: 440, category: 'meal'),
    Food(name: 'Cheese omelet', calories: 310, category: 'meal'),
    Food(name: 'Baked salmon', calories: 206, category: 'meal'),
    Food(name: 'Beef chili', calories: 275, category: 'meal'),
    Food(name: 'Chicken quesadilla', calories: 330, category: 'meal'),
    Food(name: 'Sushi roll ', calories: 255, category: 'meal'),
    Food(name: 'Pad Thai', calories: 350, category: 'meal'),
    Food(name: 'Fried rice', calories: 400, category: 'meal'),
    Food(name: 'Chicken Alfredo', calories: 540, category: 'meal'),
    Food(name: 'Beef stir-fry', calories: 400, category: 'meal'),
    Food(name: 'Chicken fajitas', calories: 420, category: 'meal'),
    Food(name: 'Grilled steak', calories: 250, category: 'meal'),
    Food(name: 'Lentil soup', calories: 200, category: 'meal'),
    Food(name: 'Turkey sandwich', calories: 320, category: 'meal'),
    Food(name: 'Vegetable stir-fry', calories: 200, category: 'meal'),
    Food(name: 'Grilled shrimp', calories: 100, category: 'meal'),
    Food(name: 'Beef stroganoff', calories: 400, category: 'meal'),
    Food(name: 'Roasted chicken breast', calories: 165, category: 'meal'),
    Food(name: 'Falafel wrap', calories: 350, category: 'meal'),
    Food(name: 'Chicken noodle soup', calories: 100, category: 'meal'),
    Food(name: 'Caesar salad with shrimp', calories: 225, category: 'meal'),
    Food(name: 'Veggie stir-fry with tofu', calories: 250, category: 'meal'),
    Food(name: 'Lasagna', calories: 400, category: 'meal'),
    Food(name: 'Beef and broccoli', calories: 300, category: 'meal'),
    Food(name: 'Grilled pork chop', calories: 200, category: 'meal'),
    Food(name: 'Mushroom risotto', calories: 450, category: 'meal'),
    Food(name: 'Grilled cheeseburger', calories: 500, category: 'meal'),
    Food(name: 'Broiled swordfish', calories: 146, category: 'meal'),
    Food(name: 'Greek salad', calories: 200, category: 'meal'),
    Food(name: 'Vegetable lasagna', calories: 350, category: 'meal'),
    Food(name: 'Grilled vegetables ', calories: 150, category: 'meal'),
    Food(name: 'Tofu stir-fry with vegetables', calories: 200, category: 'meal'),
    Food(name: 'Chicken tikka masala', calories: 350, category: 'meal'),
    Food(name: 'Shrimp scampi', calories: 300, category: 'meal'),
    Food(name: 'Lentil salad', calories: 250, category: 'meal'),
    Food(name: 'Turkey chili', calories: 225, category: 'meal'),
    Food(name: 'Grilled eggplant Parmesan', calories: 280, category: 'meal'),
    Food(name: 'Baked chicken thigh', calories: 160, category: 'meal'),
    Food(name: 'Black bean soup', calories: 150, category: 'meal'),
    Food(name: 'Beef and bean burrito', calories: 400, category: 'meal'),
    Food(name: 'Vegetable soup', calories: 100, category: 'meal'),
    Food(name: 'Yogurt', calories: 100, category: 'snack'),
    Food(name: 'Apple', calories: 95, category: 'snack'),
    Food(name: 'Orange Juice', calories: 110, category: 'drink'),
    Food(name: 'Milk', calories: 150, category: 'drink'),
    Food(name: 'Apple', calories: 95, category: 'snack'),
    Food(name: 'Banana', calories: 105, category: 'snack'),
    Food(name: 'Orange', calories: 62, category: 'snack'),
    Food(name: 'Pear', calories: 57, category: 'snack'),
    Food(name: 'Grapes', calories: 69, category: 'snack'),
    Food(name: 'Strawberries', calories: 49, category: 'snack'),
    Food(name: 'Blueberries', calories: 84, category: 'snack'),
    Food(name: 'Raspberries', calories: 65, category: 'snack'),
    Food(name: 'Pineapple', calories: 82, category: 'snack'),
    Food(name: 'Watermelon', calories: 46, category: 'snack'),
    Food(name: 'Cantaloupe', calories: 56, category: 'snack'),
    Food(name: 'Honeydew melon', calories: 64, category: 'snack'),
    Food(name: 'Dried apricots', calories: 212, category: 'snack'),
    Food(name: 'Dried cranberries', calories: 123, category: 'snack'),
    Food(name: 'Dried mango', calories: 107, category: 'snack'),
    Food(name: 'Raisins', calories: 85, category: 'snack'),
    Food(name: 'Almonds', calories: 164, category: 'snack'),
    Food(name: 'Peanuts', calories: 176, category: 'snack'),
    Food(name: 'Cashews', calories: 155, category: 'snack'),
    Food(name: 'Pistachios', calories: 159, category: 'snack'),
    Food(name: 'Walnuts', calories: 185, category: 'snack'),
    Food(name: 'Pecans', calories: 196, category: 'snack'),
    Food(name: 'Hummus', calories: 25, category: 'snack'),
    Food(name: 'Pita chips', calories: 130, category: 'snack'),
    Food(name: 'Trail mix', calories: 200, category: 'snack'),
    Food(name: 'Granola', calories: 120, category: 'snack'),
    Food(name: 'Cheese and crackers', calories: 200, category: 'snack'),
    Food(name: 'Vegetable sticks with dip', calories: 100, category: 'snack'),
    Food(name: 'Popcorn', calories: 30, category: 'snack'),
    Food(name: 'Rice cakes', calories: 35, category: 'snack'),
    Food(name: 'Hard boiled eggs', calories: 78, category: 'snack'),
    Food(name: 'Beef jerky', calories: 80, category: 'snack'),
    Food(name: 'Turkey jerky', calories: 70, category: 'snack'),
    Food(name: 'String cheese', calories: 80, category: 'snack'),
    Food(name: 'Protein bar', calories: 200, category: 'snack'),
    Food(name: 'Energy balls', calories: 120, category: 'snack'),
    Food(name: 'Smoothie', calories: 150, category: 'snack'),
    Food(name: 'Protein shake', calories: 130, category: 'snack'),
    Food(name: 'Fruit and nut bars', calories: 200, category: 'snack'),
    Food(name: 'Rice crackers', calories: 110, category: 'snack'),
    Food(name: 'Edamame', calories: 150, category: 'snack'),
    Food(name: 'Popcorn chicken', calories: 140, category: 'snack'),
    Food(name: 'Pork rinds', calories: 80, category: 'snack'),
    Food(name: 'Sweet potato fries', calories: 140, category: 'snack'),
    Food(name: 'Kale chips', calories: 60, category: 'snack'),
    Food(name: 'Beef sticks', calories: 100, category: 'snack'),
    Food(name: 'Turkey sticks', calories: 60, category: 'snack'),
    Food(name: 'Mini quesadillas', calories: 180, category: 'snack'),
    Food(name: 'Guacamole', calories: 25, category: 'snack'),
    Food(name: 'Salsa', calories: 10, category: 'snack'),
    Food(name: 'Water', calories: 0, category: 'drink'),
    Food(name: 'Black coffee', calories: 2, category: 'drink'),
    Food(name: 'Green tea', calories: 0, category: 'drink'),
    Food(name: 'Herbal tea', calories: 0, category: 'drink'),
    Food(name: 'Iced tea', calories: 90, category: 'drink'),
    Food(name: 'Orange juice', calories: 112, category: 'drink'),
    Food(name: 'Apple juice', calories: 114, category: 'drink'),
    Food(name: 'Cranberry juice', calories: 137, category: 'drink'),
    Food(name: 'Grapefruit juice', calories: 96, category: 'drink'),
    Food(name: 'Tomato juice', calories: 41, category: 'drink'),
    Food(name: 'Pineapple juice', calories: 132, category: 'drink'),
    Food(name: 'Ginger ale', calories: 90, category: 'drink'),
    Food(name: 'Soda (cola)', calories: 140, category: 'drink'),
    Food(name: 'Soda (lemon-lime)', calories: 140, category: 'drink'),
    Food(name: 'Soda (orange)', calories: 150, category: 'drink'),
    Food(name: 'Sports drink', calories: 80, category: 'drink'),
    Food(name: 'Coconut water', calories: 45, category: 'drink'),
    Food(name: 'Almond milk', calories: 60, category: 'drink'),
    Food(name: 'Soy milk', calories: 80, category: 'drink'),
    Food(name: 'Cow milk', calories: 102, category: 'drink'),
    Food(name: 'Chocolate milk', calories: 200, category: 'drink')

  ];
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodItem> _foodItems = [];
  int _totalCalories = 0;

  @override
  void initState() {
    super.initState();
    _fetchFoodItems();
  }

  void _fetchFoodItems() async {
    final items = HiveHelper.foodItemsBox.values.toList();
    setState(() {
      _foodItems = items;
      _totalCalories = items.fold(0, (sum, item) => sum + item.calories);
    });
  }

  void _addFoodItem(String foodItem, int calories) async {
    final item = FoodItem(name: foodItem, calories: calories);
    await HiveHelper.foodItemsBox.add(item);
    setState(() {
      _foodItems.add(item);
      _totalCalories += calories;
    });
  }

  void _deleteFoodItem(int index) async {
    final item = _foodItems[index];
    await HiveHelper.foodItemsBox.delete(item.key); // Corrected this line
    setState(() {
      _foodItems.removeAt(index);
      _totalCalories -= item.calories;
    });
  }
  ElevatedButton saveButton() {
    return ElevatedButton(
      onPressed: () async {
        await HiveHelper.saveFoodItems();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Food items saved for today"),
          ),
        );
      },
      child: Text('Save'),
    );
  }

  ElevatedButton recallButton() {
    return ElevatedButton(
      onPressed: () async {
        List<FoodItem> savedFoodItems = await HiveHelper.loadFoodItems();
        setState(() {
          _foodItems = savedFoodItems;
          _totalCalories = savedFoodItems.fold(0, (sum, item) => sum + item.calories);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Food items recalled for today"),
          ),
        );
      },
      child: Text('Recall'),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              await HiveHelper.saveFoodItems(); // Call the save method
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Food items saved"),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _foodItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_foodItems[index].key.toString()),
            background: Container(
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _deleteFoodItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Food item deleted"),
                ),
              );
            },
            child: ListTile(
              title: Text(_foodItems[index].name),
              trailing: Text('${_foodItems[index].calories} kcal'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddFoodItemDialog(context, _addFoodItem),
        tooltip: 'Add food item',
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            saveButton(),
            recallButton(),
            Text(
              'Total Calories: $_totalCalories kcal',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),

    );
  }


  void _showAddFoodItemDialog(BuildContext context, Function(String, int) onAddFoodItem) {
    TextEditingController caloriesController = TextEditingController();
    String selectedCategory = 'meal';

    showDialog(
      context: context,
      builder: (context) {
        Food? selectedFood;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Add Food Item'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedCategory = 'meal';
                          });
                        },
                        child: Text('Meal'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              selectedCategory == 'meal' ? Colors.blue : Colors
                                  .grey),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedCategory = 'snack';
                          });
                        },
                        child: Text('Snack'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              selectedCategory == 'snack' ? Colors.blue : Colors
                                  .grey),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedCategory = 'drink';
                          });
                        },
                        child: Text('Drink'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              selectedCategory == 'drink' ? Colors.blue : Colors
                                  .grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 8.0),
                          child: DropdownButtonFormField<Food>(
                            items: FoodDatabase.foods
                                .where((food) =>
                            food.category == selectedCategory)
                                .map((food) {
                              return DropdownMenuItem<Food>(
                                child: Text(food.name),
                                value: food,
                              );
                            }).toList(),
                            hint: Text('Select Food Item'),
                            onChanged: (Food? newValue) {
                              setState(() {
                                selectedFood = newValue;
                                if (newValue != null) {
                                  caloriesController.text =
                                      newValue.calories.toString();
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: caloriesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Calories'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (selectedFood != null) {
                      int calories = int.tryParse(caloriesController.text) ?? 0;
                      onAddFoodItem(selectedFood!.name, calories); // Call the passed callback
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add'),
                ),

              ],
            );
          },
        );
      },
    );
  }
}