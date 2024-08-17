import 'package:flutter/material.dart';

Widget buildMealBox(
  String name,
  String guests,
  String image,
) {
  return Container(
    width: 165,
    height: 188,
    margin: const EdgeInsets.all(8), // Add margin for spacing between items
    decoration: BoxDecoration(
      color: const Color(0xFFE4D4F1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Row(
            children: [
              Text(
                name, // Dynamic name
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              const CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            guests, // Dynamic guest text
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Image.asset(
              image, // Dynamic image
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    ),
  );
}
