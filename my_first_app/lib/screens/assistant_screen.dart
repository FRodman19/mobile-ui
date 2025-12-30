import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_card.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF1DB954),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'AI Assistant',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: [
                _buildSystemMessage(
                  'Hi! I\'m your AI assistant. I can help you with:\n• Creating content (@mention projects)\n• Tracking skills (#mention skills)\n• Analyzing performance\n• Managing tasks',
                ),
                const SizedBox(height: 16),
                _buildUserMessage('Help me write a YouTube script for @NeoLaunch'),
                const SizedBox(height: 16),
                _buildSystemMessage('I\'ll help you create a YouTube script for NeoLaunch. Let me draft something for you.'),
                const SizedBox(height: 16),
                _buildContentCard(
                  title: 'YouTube Script Draft',
                  platform: 'YouTube',
                  content: 'Hook: "What if I told you that you could validate your SaaS idea in 48 hours?"\n\nIntro: Today I\'m breaking down the exact framework we used to...',
                  project: 'NeoLaunch',
                ),
                const SizedBox(height: 16),
                _buildUserMessage('Can you update my progress on #Python for Data Science?'),
                const SizedBox(height: 16),
                _buildSystemMessage('Sure! I see you\'ve completed "Pandas Library Basics". Would you like me to mark this milestone as complete and suggest the next one?'),
                const SizedBox(height: 16),
                _buildSystemMessage('Your next milestone would be "Data Visualization with Matplotlib". Ready to start?'),
              ],
            ),
          ),

          // Input bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              border: Border(
                top: BorderSide(
                  color: isDark ? const Color(0xFF282828) : const Color(0xFFE0E0E0),
                  width: 1,
                ),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // @ button
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF121212) : const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.alternate_email, size: 18),
                  ),
                  const SizedBox(width: 8),
                  // # button
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF121212) : const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.tag, size: 18),
                  ),
                  const SizedBox(width: 12),
                  // Input field
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF121212) : const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _messageController,
                        style: GoogleFonts.inter(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'Ask me anything...',
                          hintStyle: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Voice button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1DB954),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.mic, color: Colors.black, size: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSystemMessage(String message) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF1DB954).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.smart_toy, color: Color(0xFF1DB954), size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF121212) : const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: GoogleFonts.inter(
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(width: 44),
      ],
    );
  }

  Widget _buildUserMessage(String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 44),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF1DB954),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: GoogleFonts.inter(
                fontSize: 14,
                height: 1.5,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFF1DB954),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, color: Colors.black, size: 18),
        ),
      ],
    );
  }

  Widget _buildContentCard({
    required String title,
    required String platform,
    required String content,
    required String project,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF1DB954).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.smart_toy, color: Color(0xFF1DB954), size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.play_circle_outline, size: 16, color: Color(0xFF1DB954)),
                    const SizedBox(width: 6),
                    Text(
                      platform,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1DB954),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      project,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  content,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    height: 1.5,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.2),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          'Edit Draft',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1DB954),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          elevation: 0,
                        ),
                        child: Text(
                          'Apply to Content',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 44),
      ],
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
