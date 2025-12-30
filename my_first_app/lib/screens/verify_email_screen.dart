import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_setup_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final List<TextEditingController> _codeControllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _verifyCode() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ProfileSetupScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [colorScheme.surface, colorScheme.surface]
                : [colorScheme.surface, Colors.white],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 60),

                // Email icon with animation
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        colorScheme.primary.withOpacity(0.2),
                        colorScheme.primary.withOpacity(0.05),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.mark_email_unread_outlined,
                    size: 60,
                    color: colorScheme.primary,
                  ),
                )
                    .animate(onPlay: (controller) => controller.repeat())
                    .scale(
                      duration: 2000.ms,
                      begin: const Offset(0.95, 0.95),
                      end: const Offset(1.05, 1.05),
                    )
                    .then()
                    .scale(
                      duration: 2000.ms,
                      begin: const Offset(1.05, 1.05),
                      end: const Offset(0.95, 0.95),
                    ),

                const SizedBox(height: 40),

                // Title
                Text(
                  'Verify Your Email',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ).animate().fadeIn(delay: 200.ms),

                const SizedBox(height: 16),

                // Description
                Text(
                  'We sent a verification link to:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ).animate().fadeIn(delay: 300.ms),

                const SizedBox(height: 8),

                // Email
                Text(
                  widget.email,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ).animate().fadeIn(delay: 400.ms),

                const SizedBox(height: 32),

                // Code input
                Text(
                  'OR ENTER CODE MANUALLY',
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurfaceVariant,
                    letterSpacing: 1.2,
                  ),
                ).animate().fadeIn(delay: 500.ms),

                const SizedBox(height: 20),

                // 6-digit code input
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                    (index) => SizedBox(
                      width: 50,
                      height: 60,
                      child: TextField(
                        controller: _codeControllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: colorScheme.surfaceContainerHighest,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: colorScheme.primary,
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          }
                        },
                      ),
                    )
                        .animate()
                        .fadeIn(delay: (600 + index * 50).ms, duration: 400.ms)
                        .slideY(begin: 0.3, end: 0),
                  ),
                ),

                const SizedBox(height: 32),

                // Verify button
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [colorScheme.primary, colorScheme.secondary],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _verifyCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Verify Code',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ).animate().fadeIn(delay: 900.ms),

                const SizedBox(height: 24),

                // Resend email
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Verification email sent!',
                          style: GoogleFonts.dmSans(),
                        ),
                        backgroundColor: colorScheme.primary,
                      ),
                    );
                  },
                  child: Text(
                    'Resend Email',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ).animate().fadeIn(delay: 1000.ms),

                const SizedBox(height: 40),

                // Skip link
                TextButton(
                  onPressed: () => _verifyCode(),
                  child: Text(
                    'I\'ll Do This Later',
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                    ),
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
