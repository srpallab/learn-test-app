import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget questionsSummary({required List<Map<String, Object>> summary}) {
  return SizedBox(
    height: Get.height - 300,
    child: ListView(
      children: summary.map((data) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(
              ((data['question_index'] as int) + 1).toString(),
            ),
          ),
          title: Text(
            data['question'] as String,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontSize: 16,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                "Correct Answers : ${data['correct_answer']}",
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                "Your Answers: ${data['user_answer']}",
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 5),
            ],
          ),
        );
      }).toList(),
    ),
  );
}
