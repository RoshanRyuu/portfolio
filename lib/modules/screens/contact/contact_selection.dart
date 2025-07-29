import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Contact",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          children: [
            TextButton(
              onPressed: () => launchUrl(Uri.parse('mailto:roshanchachre21@gmail.com')),
              child: const Text("roshanchachre21@gmail.com"),
            ),
            TextButton(
              onPressed: () => launchUrl(Uri.parse('https://github.com/RoshanRyuu')),
              child: const Text("GitHub"),
            ),
            TextButton(
              onPressed: () => launchUrl(Uri.parse('https://www.linkedin.com/in/roshan-chachre')),
              child: const Text("LinkedIn"),
            ),
          ],
        )
      ],
    );
  }
}
