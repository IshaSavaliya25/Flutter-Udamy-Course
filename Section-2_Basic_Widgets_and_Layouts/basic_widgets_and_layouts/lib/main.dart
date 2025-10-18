import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterWidgetGuide());
}

class FlutterWidgetGuide extends StatelessWidget {
  const FlutterWidgetGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WidgetShowcase(),
    );
  }
}

class WidgetShowcase extends StatelessWidget {
  const WidgetShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- TEXT WIDGET ----------------
            const SectionTitle(title: '1. Text Widget'),
            const Text(
              'Hello, Flutter!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'This is a styled text with italics and underline.',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),

            // ---------------- CONTAINER WIDGET ----------------
            const SectionTitle(title: '2. Container Widget'),
            Container(
              width: 200,
              height: 200,
              color: Colors.green,
              child: const Center(child: Text('I am a Container')),
            ),
            const SizedBox(height: 20),

            // ---------------- ROW & COLUMN ----------------
            const SectionTitle(title: '3. Row and Column Widgets'),
            const Text('Row Example:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Column Example:'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('First Item'),
                Text('Second Item'),
                Text('Third Item'),
              ],
            ),
            const SizedBox(height: 20),

            // ---------------- LISTVIEW ----------------
            const SectionTitle(title: '4. ListView Widget'),
            SizedBox(
              height: 180,
              child: ListView(
                children: const [
                  ListTile(leading: Icon(Icons.map), title: Text('Map')),
                  ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text('Album'),
                  ),
                  ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ---------------- BUTTONS ----------------
            const SectionTitle(title: '5. Button Widgets'),
            ElevatedButton(
              onPressed: () => debugPrint('ElevatedButton pressed!'),
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: const Text('Styled Elevated Button'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => debugPrint('TextButton pressed!'),
              child: const Text('Text Button'),
            ),
            const SizedBox(height: 10),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
                padding: const EdgeInsets.all(15),
              ),
              onPressed: () {},
              child: const Text('Styled Text Button'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => debugPrint('OutlinedButton pressed!'),
              child: const Text('Outlined Button'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.orange,
                side: const BorderSide(color: Colors.orange, width: 2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text('Styled Outlined Button'),
            ),
            const SizedBox(height: 20),

            // ---------------- IMAGE WIDGET ----------------
            const SectionTitle(title: '6. Image Widget'),
            const Text('Network Image Example:'),
            const SizedBox(height: 10),
            Image.network(
              'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png',
              width: 300,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text('Styled Image with Border and Rounded Corners:'),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/200',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const Text('Failed to load image'),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ---------------- LAYOUTS & POSITIONING ----------------
            const SectionTitle(title: '7. Layouts & Positioning'),

            const Text('Row with Expanded & Flexible:'),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.red, height: 100),
                ),
                Flexible(
                  flex: 1,
                  child: Container(color: Colors.green, height: 100),
                ),
                Expanded(child: Container(color: Colors.blue, height: 100)),
              ],
            ),
            const SizedBox(height: 20),

            const Text('Column with spaceBetween:'),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Top'), Text('Middle'), Text('Bottom')],
            ),
            const SizedBox(height: 20),

            const Text('Decorated Container Example:'),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(color: Colors.red, width: 3),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(child: Text('Decorated Container')),
            ),
            const SizedBox(height: 20),

            const Text('Container Alignment & Transform:'),
            Container(
              width: 200,
              height: 200,
              color: Colors.purple,
              alignment: Alignment.bottomRight,
              child: const Text(
                'Bottom Right',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
              transform: Matrix4.rotationZ(0.1),
              child: const Center(child: Text('Rotated')),
            ),
            const SizedBox(height: 30),

            const Text('Combined Layout Example:'),
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 50, height: 50, color: Colors.red),
                      Container(width: 50, height: 50, color: Colors.green),
                      Container(width: 50, height: 50, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text('Nested Containers and Layouts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- Helper Widget for Section Titles ----------------
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }
}
