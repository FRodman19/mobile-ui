// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2Keypad extends StatelessWidget {
  final ValueChanged<String> onKeyPress;
  final VoidCallback onDelete;
  final bool biometricEnabled;
  final VoidCallback? onBiometricPress;

  const DSV2Keypad({
    super.key,
    required this.onKeyPress,
    required this.onDelete,
    this.biometricEnabled = false,
    this.onBiometricPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var j = 1; j <= 3; j++) _buildKey(context, '${i * 3 + j}'),
              ],
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            biometricEnabled
                ? IconButton(
                    icon: const Icon(Icons.fingerprint, size: 32),
                    onPressed: onBiometricPress,
                    color: DSV2Theme.teal,
                  )
                : const SizedBox(width: 64),
            _buildKey(context, '0'),
            IconButton(
              icon: const Icon(Icons.backspace_outlined, size: 24),
              onPressed: onDelete,
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildKey(BuildContext context, String value) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () => onKeyPress(value),
      borderRadius: BorderRadius.circular(32),
      child: Container(
        width: 64,
        height: 64,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark ? DSV2Theme.greyDark : DSV2Theme.grey.withOpacity(0.3),
        ),
        child: Text(value, style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
