import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'spacing.dart';
import 'theme.dart';

class DSProgressBar extends StatelessWidget {
  const DSProgressBar({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DSSpacing.componentRadius),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 6,
        backgroundColor: DSColors.neutral200,
        valueColor: const AlwaysStoppedAnimation(DSColors.teal500),
      ),
    );
  }
}

const _dsGridLoaderSvg = r'''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><rect width="7.33" height="7.33" x="1" y="1" fill="currentColor"><animate id="SVGzjrPLenI" attributeName="x" begin="0;SVGXAURnSRI.end+0.2s" dur="0.6s" values="1;4;1"/><animate attributeName="y" begin="0;SVGXAURnSRI.end+0.2s" dur="0.6s" values="1;4;1"/><animate attributeName="width" begin="0;SVGXAURnSRI.end+0.2s" dur="0.6s" values="7.33;1.33;7.33"/><animate attributeName="height" begin="0;SVGXAURnSRI.end+0.2s" dur="0.6s" values="7.33;1.33;7.33"/></rect><rect width="7.33" height="7.33" x="8.33" y="1" fill="currentColor"><animate attributeName="x" begin="SVGzjrPLenI.begin+0.1s" dur="0.6s" values="8.33;11.33;8.33"/><animate attributeName="y" begin="SVGzjrPLenI.begin+0.1s" dur="0.6s" values="1;4;1"/><animate attributeName="width" begin="SVGzjrPLenI.begin+0.1s" dur="0.6s" values="7.33;1.33;7.33"/><animate attributeName="height" begin="SVGzjrPLenI.begin+0.1s" dur="0.6s" values="7.33;1.33;7.33"/></rect><rect width="7.33" height="7.33" x="1" y="8.33" fill="currentColor"><animate attributeName="x" begin="SVGzjrPLenI.begin+0.1s" dur="0.6s" values="1;4;1"/><animate attributeName="y" begin="SVGzjrPLenI.begin+0.1s" dur="0.6s" values="8.33;11.33;8.33"/><animate attributeName="width" begin="SVGzjrPLenI.begin+0.1s" dur="0.6s" values="7.33;1.33;7.33"/><animate attributeName="height" begin="SVGzjrPLenI.begin+0.1s" dur="0.6s" values="7.33;1.33;7.33"/></rect><rect width="7.33" height="7.33" x="15.66" y="1" fill="currentColor"><animate attributeName="x" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="15.66;18.66;15.66"/><animate attributeName="y" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="1;4;1"/><animate attributeName="width" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="7.33;1.33;7.33"/><animate attributeName="height" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="7.33;1.33;7.33"/></rect><rect width="7.33" height="7.33" x="8.33" y="8.33" fill="currentColor"><animate attributeName="x" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="8.33;11.33;8.33"/><animate attributeName="y" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="8.33;11.33;8.33"/><animate attributeName="width" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="7.33;1.33;7.33"/><animate attributeName="height" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="7.33;1.33;7.33"/></rect><rect width="7.33" height="7.33" x="1" y="15.66" fill="currentColor"><animate attributeName="x" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="1;4;1"/><animate attributeName="y" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="15.66;18.66;15.66"/><animate attributeName="width" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="7.33;1.33;7.33"/><animate attributeName="height" begin="SVGzjrPLenI.begin+0.2s" dur="0.6s" values="7.33;1.33;7.33"/></rect><rect width="7.33" height="7.33" x="15.66" y="8.33" fill="currentColor"><animate attributeName="x" begin="SVGzjrPLenI.begin+0.3s" dur="0.6s" values="15.66;18.66;15.66"/><animate attributeName="y" begin="SVGzjrPLenI.begin+0.3s" dur="0.6s" values="8.33;11.33;8.33"/><animate attributeName="width" begin="SVGzjrPLenI.begin+0.3s" dur="0.6s" values="7.33;1.33;7.33"/><animate attributeName="height" begin="SVGzjrPLenI.begin+0.3s" dur="0.6s" values="7.33;1.33;7.33"/></rect><rect width="7.33" height="7.33" x="8.33" y="15.66" fill="currentColor"><animate attributeName="x" begin="SVGzjrPLenI.begin+0.3s" dur="0.6s" values="8.33;11.33;8.33"/><animate attributeName="y" begin="SVGzjrPLenI.begin+0.3s" dur="0.6s" values="15.66;18.66;15.66"/><animate attributeName="width" begin="SVGzjrPLenI.begin+0.3s" dur="0.6s" values="7.33;1.33;7.33"/><animate attributeName="height" begin="SVGzjrPLenI.begin+0.3s" dur="0.6s" values="7.33;1.33;7.33"/></rect><rect width="7.33" height="7.33" x="15.66" y="15.66" fill="currentColor"><animate id="SVGXAURnSRI" attributeName="x" begin="SVGzjrPLenI.begin+0.4s" dur="0.6s" values="15.66;18.66;15.66"/><animate attributeName="y" begin="SVGzjrPLenI.begin+0.4s" dur="0.6s" values="15.66;18.66;15.66"/><animate attributeName="width" begin="SVGzjrPLenI.begin+0.4s" dur="0.6s" values="7.33;1.33;7.33"/><animate attributeName="height" begin="SVGzjrPLenI.begin+0.4s" dur="0.6s" values="7.33;1.33;7.33"/></rect></svg>''';

class DSGridLoader extends StatelessWidget {
  final double size;
  final Color? color;

  const DSGridLoader({
    super.key,
    this.size = 64,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: SvgPicture.string(
        _dsGridLoaderSvg,
        colorFilter: ColorFilter.mode(
          color ?? DSColors.teal500,
          BlendMode.srcIn,
        ),
        fit: BoxFit.contain,
      ),
    );
  }
}
