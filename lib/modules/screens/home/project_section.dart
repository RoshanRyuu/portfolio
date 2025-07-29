import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  final Key widgetKey;
  const ProjectsSection({super.key, required this.widgetKey});
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> projects = [
      {
        'title': 'Connect Here',
        'description': 'A social networking app that connects nearby users. (Live on Play Store & App Store)',
        'link': 'https://play.google.com/store/apps/details?id=com.khd.CH&hl=en_IN'
      },
      {
        'title': 'Here is What I Like',
        'description':
            'A hotel booking app that provides personalized hotel suggestions based on user preferences, location, and booking history.Features include real-time availability, secure bookings, in-app reviews, and smart filtering for amenities, price, and ratings.',
        'link': 'https://play.google.com/store/apps/details?id=com.hivil.hivil&hl=en'
      },
      {
        'title': 'Gambling Application',
        'description':
            'A gambling app implementing complex mathematical algorithms for betting mechanics. (Live on a website)',
        'link': 'https://spl.live'
      },
      {
        'title': 'Alpha One',
        'description': 'A music streaming app that allows users to listen to live-streamed songs and upload music.',
        'link': 'https://apps.apple.com/pl/app/alphaone-radio/id6480052795'
      },
      {
        'title': 'Infinity Talk',
        'description': 'An e-commerce and social networking app enabling users to chat and shop within the platform.',
      },
      {
        'title': 'Purana Paper Product (PPP)',
        'description':
            'A stationery e-commerce application providing 24/7 free home delivery, featuring real-time product updates, seamless order tracking, and integrated support from the sales team to streamline bulk and custom stationery purchases.',
        'link': 'https://play.google.com/store/apps/details?id=com.ppp.app&ref=apkcombo.app'
      },
      {
        'title': 'Loyalty Program',
        'description':
            'A Loyalty Program Application that rewards users for fuel purchases, allowing them to redeem points via coupons (Private client distribution).',
      },
      {
        'title': 'Roadside Assist',
        'description':
            'An assistance app for vehicle breakdowns, integrating live location tracking for customers and service providers.',
      },
      {
        'title': 'Astrology Application',
        'description':
            'An astrology app integrating real-time chat (WebSockets) and audio/video call features using Zigo Cloud for astrologer consultations.',
      },
    ];

    return Container(
      key: widgetKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.blue.shade50,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(
              projects.length,
              (index) => _ProjectCard(
                  index: index,
                  title: projects[index]['title'] ?? "",
                  description: projects[index]['description'] ?? "",
                  link: projects[index]['link'] ?? ""),
            ),
          )
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final int index;
  final String title;
  final String description;
  final String? link;
  const _ProjectCard({required this.index, required this.title, required this.description, this.link});

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _fadeController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 1.05).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _scaleController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _scaleController.reverse();
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: Colors.black87,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: widget.link != null ? () => launchUrl(Uri.parse(widget.link.toString())) : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "View",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
