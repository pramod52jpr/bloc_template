import 'package:bloc_template/config/components/app_button.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onTap;
  const InternetExceptionWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.cloud_off, size: 50),
          const Text("No Internet"),
          AppButton(title: "Retry", onTap: onTap)
        ],
      ),
    );
  }
}
