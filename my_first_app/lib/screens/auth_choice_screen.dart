import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_button.dart';
import 'create_account_screen.dart';

class AuthChoiceScreen extends StatelessWidget {
  const AuthChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Headline
              Text(
                'Create Your\nAccount',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle
              Text(
                'Join thousands building their future with clarity and focus.',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Email Button
              AppButton(
                text: 'Continue with Email',
                icon: Icons.email_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAccountScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              // Google Button
              AppButton(
                text: 'Continue with Google',
                icon: Icons.g_mobiledata,
                isPrimary: false,
                onPressed: () {},
              ),

              const SizedBox(height: 12),

              // Apple Button
              AppButton(
                text: 'Continue with Apple',
                icon: Icons.apple,
                isPrimary: false,
                onPressed: () {},
              ),

              const SizedBox(height: 24),

              // Sign In Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF1DB954),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Terms
              Text.rich(
                TextSpan(
                  text: 'By signing up, you agree to our ',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant
                        .withOpacity(0.7),
                    height: 1.5,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' & '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
