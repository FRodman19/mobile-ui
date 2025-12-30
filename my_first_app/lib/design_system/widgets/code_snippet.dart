import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../../theme/spacing.dart';

class CodeSnippet extends StatefulWidget {
  final String code;
  final String? title;

  const CodeSnippet({
    super.key,
    required this.code,
    this.title,
  });

  @override
  State<CodeSnippet> createState() => _CodeSnippetState();
}

class _CodeSnippetState extends State<CodeSnippet> {
  bool _copied = false;

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.code));
    setState(() => _copied = true);

    // Reset after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _copied = false);
      }
    });

    // Show snackbar at TOP
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Code copied to clipboard'),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.success500,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16,
          left: 16,
          right: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.screenMarginHorizontal,
        vertical: AppSpacing.stackXs,
      ),
      padding: EdgeInsets.all(AppSpacing.insetMd),
      decoration: BoxDecoration(
        color: brightness == Brightness.dark
            ? const Color(0xFF1E1E1E) // Darker grey for better contrast in dark mode
            : const Color(0xFFF5F5F5), // Light grey for better contrast in light mode
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(
          color: AppColors.borderColor(brightness).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title ?? 'CODE',
                style: TextStyles.labelSmall(brightness).copyWith(
                  letterSpacing: 1.0,
                ),
              ),
              IconButton(
                icon: Icon(
                  _copied ? Icons.check : Icons.copy,
                  size: 16,
                ),
                color: _copied ? AppColors.success500 : AppColors.teal500,  // Sage green
                onPressed: _copyToClipboard,
                tooltip: 'Copy code',
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.stackXs),
          SelectableText(
            widget.code,
            style: TextStyles.codeText(brightness),
          ),
        ],
      ),
    );
  }
}
