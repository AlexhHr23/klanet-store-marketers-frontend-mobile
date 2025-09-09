import 'package:flutter/material.dart';

class AcceptTermsScreen extends StatelessWidget {
  const AcceptTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Checkbox(value: true, onChanged: (value) {}),
          const Text('Acepto los términos y condiciones'),

          Checkbox(value: true, onChanged: (value) {}),
          const Text('Acepto los términos y condiciones'),

          Checkbox(value: true, onChanged: (value) {}),
          const Text('Acepto los términos y condiciones'),
        ],
      ),
    );
  }
}
