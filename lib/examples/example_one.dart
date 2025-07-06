import 'package:flutter/material.dart';

class ExampleOne extends StatelessWidget {
  const ExampleOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mohammad Bahlaq', style: TextStyle(fontFamily: 'PNU')),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              // margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontFamily: 'PNU'),
              ),
            ),

            Container(
              // margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star_border, color: Colors.black),
                          Icon(Icons.star_border, color: Colors.black),
                        ],
                      ),
                      // Spacer(),
                      Text('17 Review', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.restaurant_rounded,
                            color: Colors.green,
                            size: 40,
                          ),
                          Text('Feed'),
                          Text('2.5'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.restaurant_rounded,
                            color: Colors.green,
                            size: 40,
                          ),
                          Text('Feed'),
                          Text('2.5'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.restaurant_rounded,
                            color: Colors.green,
                            size: 40,
                          ),
                          Text('Feed'),
                          Text('2.5'),
                        ],
                      ),
                    ],
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
