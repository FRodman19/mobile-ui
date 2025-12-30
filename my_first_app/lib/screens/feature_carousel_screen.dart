import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import 'auth_choice_screen.dart';

class FeatureCarouselScreen extends StatefulWidget {
  const FeatureCarouselScreen({super.key});

  @override
  State<FeatureCarouselScreen> createState() => _FeatureCarouselScreenState();
}

class _FeatureCarouselScreenState extends State<FeatureCarouselScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _features = [
    {
      'icon': Icons.school_outlined,
      'title': 'Master Any Skill',
      'description':
          'Track practice sessions, build portfolios, and achieve skill milestones with structured learning paths.',
    },
    {
      'icon': Icons.rocket_launch_outlined,
      'title': 'Launch Your Ventures',
      'description':
          'Manage projects, track tasks, hit milestones, and turn ideas into reality with structured execution.',
    },
    {
      'icon': Icons.trending_up,
      'title': 'Track Performance',
      'description':
          'Monitor campaign revenue, track ad spend, measure ROI, and turn marketing into profit.',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (_currentPage < 2)
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthChoiceScreen(),
                  ),
                );
              },
              child: Text(
                'Skip',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _features.length,
                itemBuilder: (context, index) {
                  final feature = _features[index];
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1DB954),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            feature['icon'],
                            size: 40,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Title
                        Text(
                          feature['title'],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            letterSpacing: -0.5,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Description
                        Text(
                          feature['description'],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Indicators
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _features.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? const Color(0xFF1DB954)
                          : Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant
                              .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),

            // Button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: AppButton(
                text: _currentPage < _features.length - 1 ? 'Next' : 'Get Started',
                onPressed: () {
                  if (_currentPage < _features.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthChoiceScreen(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
