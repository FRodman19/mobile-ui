import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../foundation/gol_colors.dart';

const _golGridLoaderSvg = r'''<svg fill="hsl(228, 97%, 42%)" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><rect x="1" y="1" rx="1" width="10" height="10"><animate id="spinner_c7A9" begin="0;spinner_23zP.end" attributeName="x" dur="0.2s" values="1;13" fill="freeze"/><animate id="spinner_Acnw" begin="spinner_ZmWi.end" attributeName="y" dur="0.2s" values="1;13" fill="freeze"/><animate id="spinner_iIcm" begin="spinner_zfQN.end" attributeName="x" dur="0.2s" values="13;1" fill="freeze"/><animate id="spinner_WX4U" begin="spinner_rRAc.end" attributeName="y" dur="0.2s" values="13;1" fill="freeze"/></rect><rect x="1" y="13" rx="1" width="10" height="10"><animate id="spinner_YLx7" begin="spinner_c7A9.end" attributeName="y" dur="0.2s" values="13;1" fill="freeze"/><animate id="spinner_vwnJ" begin="spinner_Acnw.end" attributeName="x" dur="0.2s" values="1;13" fill="freeze"/><animate id="spinner_KQuy" begin="spinner_iIcm.end" attributeName="y" dur="0.2s" values="1;13" fill="freeze"/><animate id="spinner_arKy" begin="spinner_WX4U.end" attributeName="x" dur="0.2s" values="13;1" fill="freeze"/></rect><rect x="13" y="13" rx="1" width="10" height="10"><animate id="spinner_ZmWi" begin="spinner_YLx7.end" attributeName="x" dur="0.2s" values="13;1" fill="freeze"/><animate id="spinner_zfQN" begin="spinner_vwnJ.end" attributeName="y" dur="0.2s" values="13;1" fill="freeze"/><animate id="spinner_rRAc" begin="spinner_KQuy.end" attributeName="x" dur="0.2s" values="1;13" fill="freeze"/><animate id="spinner_23zP" begin="spinner_arKy.end" attributeName="y" dur="0.2s" values="1;13" fill="freeze"/></rect></svg>''';

class GOLGridLoader extends StatefulWidget {
  final double size;
  final Color? color;

  const GOLGridLoader({
    super.key,
    this.size = 64,
    this.color,
  });

  @override
  State<GOLGridLoader> createState() => _GOLGridLoaderState();
}

class _GOLGridLoaderState extends State<GOLGridLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final spinnerColor = widget.color ?? colors.interactivePrimary;
    final child = SizedBox(
      height: widget.size,
      width: widget.size,
      child: SvgPicture.string(
        _golGridLoaderSvg,
        colorFilter: ColorFilter.mode(
          spinnerColor,
          BlendMode.srcIn,
        ),
        fit: BoxFit.contain,
      ),
    );

    return RotationTransition(
      turns: _controller,
      child: child,
    );
  }
}
