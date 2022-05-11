//
// This file it is not needed it is just for presenting the
// await, async, Future conscepts
//

import 'dart:ui';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:async/async.dart';

void main() {
  MyClass myclass = MyClass();
  print(myclass.position);
}

class MyClass {
  final position = AsyncMemoizer();

  MyClass() {
    position.runOnce(() {
      return Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    });
  }
}

void performTasks() async {
  task1();
  String? task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String?> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);
  String? result;
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String? task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
