import 'package:flutter/material.dart';
import 'package:macromasterai/Screens/DetailsPage.dart';


class CalorieCalculator extends StatefulWidget {
  const CalorieCalculator({super.key});

  @override
  State<CalorieCalculator> createState() => _CalorieCalculatorState();
}

class _CalorieCalculatorState extends State<CalorieCalculator> {
  double protein = 0.0;
  double carbs = 0.0;
  double fat = 0.0;

  double get totalCalories => (protein * 4) + (carbs * 4) + (fat * 9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Calorie Calculator',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {
              setState(() {
                protein = 0;
                carbs = 0;
                fat = 0;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const Text(
                    'Adjust the sliders below to calculate your total calorie intake:',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  buildSlider(
                    label: 'Protein',
                    color: Colors.red,
                    value: protein,
                    onChanged: (value) => setState(() => protein = value),
                  ),
                  const SizedBox(height: 20),
                  buildSlider(
                    label: 'Carbs',
                    color: Colors.orange,
                    value: carbs,
                    onChanged: (value) => setState(() => carbs = value),
                  ),
                  const SizedBox(height: 20),
                  buildSlider(
                    label: 'Fat',
                    color: Colors.blue,
                    value: fat,
                    onChanged: (value) => setState(() => fat = value),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total Calories',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      '${totalCalories.toStringAsFixed(1)} kcal',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSlider({
    required String label,
    required Color color,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '${value.toStringAsFixed(1)} g',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: color,
            inactiveTrackColor: color.withOpacity(0.3),
            thumbColor: color,
            overlayColor: color.withOpacity(0.1),
          ),
          child: Slider(
            value: value,
            onChanged: onChanged,
            min: 0,
            max: 100,
          ),
        ),
      ],
    );
  }
}
