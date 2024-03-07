import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class FileUploadContainer extends StatelessWidget {
  final VoidCallback onClick;
  final String name;
  final double progress;

  const FileUploadContainer(
      {Key? key,
      required this.onClick,
      required this.name,
      required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 240,
        height: 104,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select your $name',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Maximum file size: 50MB',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            FAProgressBar(
                displayTextStyle: TextStyle(color: Colors.white),
                currentValue: progress,
                displayText: "%",
                maxValue: 100,
                backgroundColor: Colors.white30,
                progressColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
