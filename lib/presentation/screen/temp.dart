import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Temp extends StatelessWidget {
  const Temp({required this.number, super.key});
  final int number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 22.sp),
        ),
      ),
    );
  }
}
