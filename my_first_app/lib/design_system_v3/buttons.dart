import 'package:flutter/material.dart';

import 'spacing_v3.dart';
import 'progress.dart';
import 'theme_v3.dart';

enum DSV3ButtonVariant { primary, secondary, tertiary, text }
enum DSV3ButtonSize { small, medium, large }
enum DSV3ButtonState { normal, hover, pressed, disabled, loading }

class DSV3Button extends StatelessWidget {
  const DSV3Button({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = DSV3ButtonVariant.primary,
    this.size = DSV3ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.stateOverride,
    this.fullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final DSV3ButtonVariant variant;
  final DSV3ButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final DSV3ButtonState? stateOverride;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final disabled = onPressed == null ||
        stateOverride == DSV3ButtonState.disabled ||
        isLoading ||
        stateOverride == DSV3ButtonState.loading;
    final visualState = _resolveState(disabled);

    final height = switch (size) {
      DSV3ButtonSize.small => 36.0,
      DSV3ButtonSize.medium => 44.0,
      DSV3ButtonSize.large => 52.0,
    };

    final padding = switch (size) {
      DSV3ButtonSize.small => const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      DSV3ButtonSize.medium => DSV3Spacing.buttonPadding,
      DSV3ButtonSize.large => const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    };

    final colors = _colorsForState(isDark, visualState);

    final style = ButtonStyle(
      padding: MaterialStateProperty.all(padding),
      minimumSize: MaterialStateProperty.all(Size(fullWidth ? double.infinity : 0, height)),
      backgroundColor: MaterialStateProperty.all(colors.background),
      foregroundColor: MaterialStateProperty.all(colors.foreground),
      overlayColor: MaterialStateProperty.all(colors.overlay),
      side: MaterialStateProperty.all(colors.border),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
        ),
      ),
      elevation: MaterialStateProperty.all(0),
    );

    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: style,
      child: _buildChild(colors.foreground),
    );
  }

  DSV3ButtonState _resolveState(bool disabled) {
    if (isLoading || stateOverride == DSV3ButtonState.loading) {
      return DSV3ButtonState.loading;
    }
    if (disabled) return DSV3ButtonState.disabled;
    return stateOverride ?? DSV3ButtonState.normal;
  }

  _ButtonColors _colorsForState(bool isDark, DSV3ButtonState state) {
    final baseForeground = isDark ? DSV3Colors.white : DSV3Colors.black;

    switch (variant) {
      case DSV3ButtonVariant.primary:
        return _ButtonColors(
          background: _resolveByState(
            state,
            normal: DSV3Colors.orange500,
            hover: DSV3Colors.orange500,
            pressed: DSV3Colors.orange600,
            disabled: DSV3Colors.neutral200,
            loading: DSV3Colors.orange500,
          ),
          foreground: DSV3Colors.black,
          overlay: DSV3Colors.orange600.withOpacity(0.1),
          border: BorderSide.none,
        );
      case DSV3ButtonVariant.secondary:
        return _ButtonColors(
          background: _resolveByState(
            state,
            normal: Colors.transparent,
            hover: DSV3Colors.teal500.withOpacity(0.08),
            pressed: DSV3Colors.teal600.withOpacity(0.12),
            disabled: Colors.transparent,
            loading: Colors.transparent,
          ),
          foreground: isDark ? DSV3Colors.white : DSV3Colors.black,
          overlay: DSV3Colors.teal600.withOpacity(0.08),
          border: BorderSide(
            color: state == DSV3ButtonState.disabled
                ? DSV3Colors.neutral300
                : (isDark ? DSV3Colors.white : DSV3Colors.black),
            width: 1,
          ),
        );
      case DSV3ButtonVariant.tertiary:
        return _ButtonColors(
          background: _resolveByState(
            state,
            normal: DSV3Colors.neutral200,
            hover: DSV3Colors.neutral200,
            pressed: DSV3Colors.neutral300,
            disabled: DSV3Colors.neutral100,
            loading: DSV3Colors.neutral200,
          ),
          foreground: DSV3Colors.black,
          overlay: DSV3Colors.neutral300.withOpacity(0.2),
          border: BorderSide.none,
        );
      case DSV3ButtonVariant.text:
        return _ButtonColors(
          background: _resolveByState(
            state,
            normal: Colors.transparent,
            hover: DSV3Colors.teal500.withOpacity(0.1),
            pressed: DSV3Colors.teal600.withOpacity(0.12),
            disabled: Colors.transparent,
            loading: Colors.transparent,
          ),
          foreground: state == DSV3ButtonState.disabled
              ? DSV3Colors.neutral500
              : (state == DSV3ButtonState.pressed
                  ? DSV3Colors.teal600
                  : DSV3Colors.teal500),
          overlay: DSV3Colors.teal600.withOpacity(0.08),
          border: BorderSide.none,
        );
    }
  }

  Color _resolveByState(
    DSV3ButtonState state, {
    required Color normal,
    required Color hover,
    required Color pressed,
    required Color disabled,
    required Color loading,
  }) {
    switch (state) {
      case DSV3ButtonState.hover:
        return hover;
      case DSV3ButtonState.pressed:
        return pressed;
      case DSV3ButtonState.disabled:
        return disabled;
      case DSV3ButtonState.loading:
        return loading;
      case DSV3ButtonState.normal:
        return normal;
    }
  }

  Widget _buildChild(Color foreground) {
    if (isLoading || stateOverride == DSV3ButtonState.loading) {
      return SizedBox(
        width: 18,
        height: 18,
        child: DSV3GridLoader(size: 18, color: foreground),
      );
    }

    if (icon == null) {
      return Text(label);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

class DSV3IconButton extends StatelessWidget {
  const DSV3IconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 48,
    this.isActive = false,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isActive
        ? DSV3Colors.teal500
        : (isDark ? DSV3Colors.surfaceDark : DSV3Colors.surfaceLight);

    final iconColor = isActive
        ? DSV3Colors.black
        : (isDark ? DSV3Colors.white : DSV3Colors.black);

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, color: iconColor, size: 20),
        ),
      ),
    );
  }
}

class DSV3Fab extends StatelessWidget {
  const DSV3Fab({
    super.key,
    required this.onPressed,
    required this.icon,
    this.label,
    this.mini = false,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String? label;
  final bool mini;

  @override
  Widget build(BuildContext context) {
    final size = mini ? 40.0 : 56.0;
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: DSV3Colors.black),
        if (label != null) ...[
          const SizedBox(width: 8),
          Text(label!, style: Theme.of(context).textTheme.labelLarge),
        ],
      ],
    );

    return Material(
      color: DSV3Colors.orange500,
      borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
        child: Container(
          padding: label != null
              ? const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
              : EdgeInsets.zero,
          width: label == null ? size : null,
          height: label == null ? size : null,
          alignment: Alignment.center,
          child: content,
        ),
      ),
    );
  }
}

class _ButtonColors {
  const _ButtonColors({
    required this.background,
    required this.foreground,
    required this.overlay,
    required this.border,
  });

  final Color background;
  final Color foreground;
  final Color overlay;
  final BorderSide border;
}
