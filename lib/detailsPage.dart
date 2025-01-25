import 'package:flutter/material.dart';





class IncludeDetailsPage extends StatelessWidget {
  const IncludeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Include some details'),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey), // Set AppBar arrow color to grey
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Brand Dropdown
            const TextFieldLabel(label: 'Brand*'),
            DropdownButtonFormField<String>(
              decoration: _inputDecoration('Brand'),
              items: ['Brand A', 'Brand B', 'Brand C']
                  .map((brand) => DropdownMenuItem(value: brand, child: Text(brand)))
                  .toList(),
              onChanged: (value) {
                // Handle brand selection
              },
            ),
            const SizedBox(height: 16.0),

            // Year TextField
            const TextFieldLabel(label: 'Year*'),
            TextField(
              decoration: _inputDecoration('Year of Purchases').copyWith(counterText: '0/4'),
              keyboardType: TextInputType.number,
              maxLength: 4,
            ),
            const SizedBox(height: 16.0),

            // Uses of Product
            const TextFieldLabel(label: 'Uses time*'),
            TextField(
              decoration: _inputDecoration('Uses of this Product').copyWith(counterText: '0/6'),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            const SizedBox(height: 16.0),

            // Ad Title TextField
            const TextFieldLabel(label: 'Ad title*'),
            TextField(
              decoration: _inputDecoration('Key features of your item').copyWith(counterText: '0/70'),
              maxLength: 70,
            ),
            const SizedBox(height: 16.0),

            // Additional Information TextField
            const TextFieldLabel(label: 'Additional information*'),
            TextField(
              decoration: _inputDecoration('Include condition, features and reasons for selling')
                  .copyWith(counterText: '0/4096'),
              maxLength: 4096,
              maxLines: 5,
            ),
            const SizedBox(height: 24.0),

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle next button action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.black),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    );
  }
}

class TextFieldLabel extends StatelessWidget {
  final String label;

  const TextFieldLabel({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
