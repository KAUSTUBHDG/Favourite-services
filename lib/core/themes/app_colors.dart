// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

abstract class AppColors {
  static _AppToastColors get toast => _AppToastColors();

  static _LeadingImageBackgroundColors get leadingImageBackgroundColors =>
      _LeadingImageBackgroundColors();

  static Color get whiteColor => Colors.white;

  /// ![](https://www.colorhexa.com/DA251D.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}]
  static MaterialColor get primary =>
      const MaterialColor(0xFFDA251D, <int, Color>{
        50: Color(0xFFFFE4E4),
        100: Color(0xFFFFB2B2),
        200: Color(0xFFFF7F7F),
        300: Color(0xFFFF4C4C),
        400: Color(0xFFFF2E2E),
        500: Color(0xFFDA251D),
        600: Color(0xFFD61F1B),
        700: Color(0xFFD11A16),
        800: Color(0xFFCD1512),
        900: Color(0xFFB70F0D),
      });

  /// Light Color scheme
  static ColorScheme get lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFFDA251D),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFD4E3FF),
        onPrimaryContainer: Color(0xFF001C39),
        secondary: Color(0xFF2F2E2F),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFCAE6FF),
        onSecondaryContainer: Color(0xFF001E2F),
        tertiary: Color(0xFF006C53),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFF66FBCE),
        onTertiaryContainer: Color(0xFF002117),
        error: Color(0xFFDA251D),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        surface: Color(0xFFFDFCFF),
        onSurface: Color(0xFF1A1C1E),
        onSurfaceVariant: Color(0xFF43474E),
        outline: Color(0xFF73777F),
        onInverseSurface: Color(0xFFF1F0F4),
        inverseSurface: Color(0xFF2F3033),
        inversePrimary: Color(0xFFA4C9FF),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFFDA251D),
        outlineVariant: Color(0xFFC3C6CF),
        scrim: Color(0xFF000000),
      );

  /// This color is used for success background
  /// ![](https://www.colorhexa.com/49454F.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color49454F => const Color(0xFF49454F);

  /// This color is used for success background
  /// ![](https://www.colorhexa.com/A0A8B4.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorA0A8B4 => const Color(0xFFA0A8B4);

  /// This color is used for success background
  /// ![](https://www.colorhexa.com/CBCBCB.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorCBCBCB => const Color(0xFFCBCBCB);

  /// ![](https://www.colorhexa.com/DD4217.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorDD4217 => const Color(0xFFDD4217);

  /// ![](https://www.colorhexa.com/FF9625.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorFF9625 => const Color(0xFFFF9625);

  /// ![](https://www.colorhexa.com/000000.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color000000 => const Color(0xFF000000);

  /// ![](https://www.colorhexa.com/F5F5F6.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorF5F5F6 => const Color(0xFFF5F5F6);

  /// ![](https://www.colorhexa.com/B5681B.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorB5681B => const Color(0xFFB5681B);

  /// ![](https://www.colorhexa.com/9C27B0.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color9C27B0 => const Color(0xFF9C27B0);

  /// ![](https://www.colorhexa.com/7B7980.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color7B7980 => const Color(0xFF7B7980);

  /// ![](https://www.colorhexa.com/8F9098.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color8F9098 => const Color(0xFF8F9098);

  /// ![](https://www.colorhexa.com/B3B3B3.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorB3B3B3 => const Color(0xFFB3B3B3);

  /// ![](https://www.colorhexa.com/1a000000.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color1A000000 => const Color(0x1A000000);

  /// ![](https://www.colorhexa.com/A9A8AA.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorA9A8AA => const Color(0xFFA9A8AA);

  /// ![](https://www.colorhexa.com/E5EAE7.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorE5EAE7 => const Color(0xFFE5EAE7);

  /// ![](https://www.colorhexa.com/0890FE.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color0890FE => const Color(0xFF0890FE);

  /// ![](https://www.colorhexa.com/14A425.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color14A425 => const Color(0xFF14A425);

  /// ![](https://www.colorhexa.com/FFF0F0.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorFFF0F0 => const Color(0xFFFFF0F0);

  /// ![](https://www.colorhexa.com/FFF1D8.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorFFF1D8 => const Color(0xFFFFF1D8);

  /// ![](https://www.colorhexa.com/EDFFEF.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorEDFFEF => const Color(0xFFEDFFEF);

  /// ![](https://www.colorhexa.com/F9A508.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorF9A508 => const Color(0xFFF9A508);

  /// ![](https://www.colorhexa.com/EBF3FF.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorEBF3FF => const Color(0xFFEBF3FF);

  /// ![](https://www.colorhexa.com/D22F28.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorD22F28 => const Color(0xFFD22F28);

  /// ![](https://www.colorhexa.com/39AFBC.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color39AFBC => const Color(0xFF39AFBC);

  /// ![](https://www.colorhexa.com/E9EFFF.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorE9EFFF => const Color(0xFFE9EFFF);

  /// ![](https://www.colorhexa.com/ED2323.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorED2323 => const Color(0xFFED2323);

  /// ![](https://www.colorhexa.com/024000000.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color024000000 => const Color(0xFF024000000);

  /// ![](https://www.colorhexa.com/E16F7C.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorE16F7C => const Color(0xFFE16F7C);

  /// ![](https://www.colorhexa.com/D9504A.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorD9504A => const Color(0xFFD9504A);

  /// ![](https://www.colorhexa.com/9E6240.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color9E6240 => const Color(0xFF9E6240);

  /// ![](https://www.colorhexa.com/FFFFFF.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorFFFFFF => const Color(0xFFFFFFFF);
  //shadow color
  static Color get color19000000 => const Color(0x19000000);

  /// ![](https://www.colorhexa.com/dd5858.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorDD5858 => const Color(0xFFDD5858);

  /// ![](https://www.colorhexa.com/55515C.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color55515C => const Color(0xFF55515C);

  /// ![](https://www.colorhexa.com/0000000D.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color0000000D => const Color(0xFF0000000D);

  /// ![](https://www.colorhexa.com/2F3036.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color2F3036 => const Color(0xFF2F3036);

  /// ![](https://www.colorhexa.com/E6E6E6.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorE6E6E6 => const Color(0xFFE6E6E6);

  /// ![](https://www.colorhexa.com/3629B7.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color3629B7 => const Color(0xFF3629B7);

  /// ![](https://www.colorhexa.com/0D000000.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color0D000000 => const Color(0xFF0D000000);

  /// ![](https://www.colorhexa.com/2C2F42.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color2C2F42 => const Color(0xFF2C2F42);

  /// ![](https://www.colorhexa.com/D3DCE9.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorD3DCE9 => const Color(0xFFD3DCE9);

  /// ![](https://www.colorhexa.com/D9D9D9.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorD9D9D9 => const Color(0xFFD9D9D9);

  /// ![](https://www.colorhexa.com/19C12D.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color19C12D => const Color(0xFF19C12D);

  /// ![](https://www.colorhexa.com/525565.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color525565 => const Color(0xFF525565);

  /// ![](https://www.colorhexa.com/386BF6.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color386BF6 => const Color(0xFF386BF6);

  /// ![](https://www.colorhexa.com/19A72A.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color19A72A => const Color(0xFF19A72A);

  /// This color is used for success text message
  /// ![](https://www.colorhexa.com/2F2E2F.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color2F2E2F => const Color(0xFF2F2E2F);

  /// This color is used for success text message
  /// ![](https://www.colorhexa.com/F7F7F7.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorF7F7F7 => const Color(0xFFF7F7F7);

  /// ![](https://www.colorhexa.com/3A99F5.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color3A99F5 => const Color(0xFF3A99F5);

  /// ![](https://www.colorhexa.com/DA251D.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorDA251D => const Color(0xFFDA251D);

  /// ![](https://www.colorhexa.com/4D4948.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color4D4948 => const Color(0xFF4D4948);

  /// ![](https://www.colorhexa.com/281A3E.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color281A3E => const Color(0xFF281A3E);

  /// ![](https://www.colorhexa.com/8EDCFF.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color8EDCFF => const Color(0xFF8EDCFF);

  /// ![](https://www.colorhexa.com/919090.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color919090 => const Color(0xFF919090);

  /// ![](https://www.colorhexa.com/FFDD80.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorFFDD80 => const Color(0xFFFFDD80);

  /// ![](https://www.colorhexa.com/89D3AC.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color89D3AC => const Color(0xFF89D3AC);

  /// ![](https://www.colorhexa.com/CDD9EC.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorCDD9EC => const Color(0xFFCDD9EC);

  /// ![](https://www.colorhexa.com/3E454D.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color3E454D => const Color(0xFF3E454D);

  /// ![](https://www.colorhexa.com/147FFC.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color147FFC => const Color(0xFF147FFC);

  /// ![](https://www.colorhexa.com/0F9246.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color0F9246 => const Color(0xFF0F9246);

  /// ![](https://www.colorhexa.com/7DBB42.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color7DBB42 => const Color(0xFF7DBB42);

  /// ![](https://www.colorhexa.com/FE8120.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorFE8120 => const Color(0xFFFE8120);

  /// ![](https://www.colorhexa.com/EF4723.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorEF4723 => const Color(0xFFEF4723);

  /// ![](https://www.colorhexa.com/BC2026.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorBC2026 => const Color(0xFFBC2026);

  /// ![](https://www.colorhexa.com/FFF0F0.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color878B92 => const Color(0xFF878B92);

  /// ![](https://www.colorhexa.com/FF4267.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorFF4267 => const Color(0xFFFF4267);

  /// ![](https://www.colorhexa.com/5A6168.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color5A6168 => const Color(0xFF5A6168);

  /// ![](https://www.colorhexa.com/F6F6F6.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorF5F7FA => const Color(0xFFF5F7FA);

  /// ![](https://www.colorhexa.com/F6F6F6.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorF6F6F6 => const Color(0xFFF6F6F6);

  /// ![](https://www.colorhexa.com/DFF6E2.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  ///
  static Color get colorDFF6E2 => const Color(0xFFDFF6E2);

  /// ![](https://www.colorhexa.com/F4F4F4.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorF4F4F4 => const Color(0xFFF4F4F4);

  /// ![](https://www.colorhexa.com/31AF42.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color31AF42 => const Color(0xFF31AF42);

  /// ![](https://www.colorhexa.com/1F2024.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color1F2024 => const Color(0xFF1F2024);

  /// ![](https://www.colorhexa.com/878B91.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color878B91 => const Color(0xFF878B91);
}

class _AppToastColors {
  /// This color is used for success background
  /// ![](https://www.colorhexa.com/eaffde.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  Color get successIconBG => const Color(0xFF0FA556);

  /// This color is used for error text message
  /// ![](https://www.colorhexa.com/dd5858.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  Color get errorIconBG => const Color(0xFFDA251D);

  /// This color is used for warning text message
  /// ![](https://www.colorhexa.com/ffbd31.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  Color get warningIconBG => const Color(0xFFF99908);

  /// This color is used for information background
  /// ![](https://www.colorhexa.com/3A99F5.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  Color get infoIconBG => const Color(0xFF386BF6);

  Color get successBG => const Color(0xFFEBFFF4);
  Color get errorBG => const Color(0xFFFFEFEE);
  Color get warningBG => const Color(0xFFFFF6E8);
  Color get infoBG => const Color(0xFFF0F4FF);

  Color get toastText => Colors.black;
}

class _LeadingImageBackgroundColors {
  /// ![](https://www.colorhexa.com/CA3953.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorCA3953 => const Color(0xFFCA3953);

  /// ![](https://www.colorhexa.com/C817AC.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorC817AC => const Color(0xFFC817AC);

  /// ![](https://www.colorhexa.com/6517C8.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color6517C8 => const Color(0xFF6517C8);

  /// ![](https://www.colorhexa.com/4425BE.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color4425BE => const Color(0xFF4425BE);

  /// ![](https://www.colorhexa.com/253EBE.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color253EBE => const Color(0xFF253EBE);

  /// ![](https://www.colorhexa.com/2575BE.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color2575BE => const Color(0xFF2575BE);

  /// ![](https://www.colorhexa.com/2199BE.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color2199BE => const Color(0xFF2199BE);

  /// ![](https://www.colorhexa.com/21BEAB.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color21BEAB => const Color(0xFF21BEAB);

  /// ![](https://www.colorhexa.com/21BE7C.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color21BE7C => const Color(0xFF21BE7C);

  /// ![](https://www.colorhexa.com/1AA742.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color1AA742 => const Color(0xFF1AA742);

  /// ![](https://www.colorhexa.com/279315.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color279315 => const Color(0xFF279315);

  /// ![](https://www.colorhexa.com/559D1C.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color559D1C => const Color(0xFF559D1C);

  /// ![](https://www.colorhexa.com/89B410.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color89B410 => const Color(0xFF89B410);

  /// ![](https://www.colorhexa.com/D9B910.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorD9B910 => const Color(0xFFD9B910);

  /// ![](https://www.colorhexa.com/E48024.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorE48024 => const Color(0xFFE48024);

  /// ![](https://www.colorhexa.com/B45B1A.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorB45B1A => const Color(0xFFB45B1A);

  /// ![](https://www.colorhexa.com/6C3E1C.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color6C3E1C => const Color(0xFF6C3E1C);

  /// ![](https://www.colorhexa.com/A52E1E.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorA52E1E => const Color(0xFFA52E1E);

  /// ![](https://www.colorhexa.com/C77466.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorC77466 => const Color(0xFFC77466);

  /// ![](https://www.colorhexa.com/605A68.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color605A68 => const Color(0xFF605A68);

  /// ![](https://www.colorhexa.com/D7CF11.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorD7CF11 => const Color(0xFFD7CF11);

  /// ![](https://www.colorhexa.com/A38129.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorA38129 => const Color(0xFFA38129);

  /// ![](https://www.colorhexa.com/132F63.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color132F63 => const Color(0xFF132F63);

  /// ![](https://www.colorhexa.com/338672.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color338672 => const Color(0xFF338672);

  /// ![](https://www.colorhexa.com/5FC746.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color5FC746 => const Color(0xFF5FC746);

  /// ![](https://www.colorhexa.com/979797.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color979797 => const Color(0xFF979797);

  /// ![](https://www.colorhexa.com/358FEA.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get color358FEA => const Color(0xFF358FEA);

  /// ![](https://www.colorhexa.com/F0715A.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorF0715A => const Color(0xFFF0715A);

  /// ![](https://www.colorhexa.com/D32579.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorD32579 => const Color(0xFFD32579);

  /// ![](https://www.colorhexa.com/A417C8.png)
  ///
  /// {@tool snippet}
  /// {@end-tool}
  static Color get colorA417C8 => const Color(0xFFA417C8);

  List<Color> allColors = <Color>[
    colorCA3953,
    colorC817AC,
    color6517C8,
    color4425BE,
    color253EBE,
    color2575BE,
    color2199BE,
    color21BEAB,
    color21BE7C,
    color1AA742,
    color279315,
    color559D1C,
    color89B410,
    colorD9B910,
    colorE48024,
    colorB45B1A,
    color6C3E1C,
    colorA52E1E,
    colorC77466,
    color605A68,
    colorD7CF11,
    colorA38129,
    color132F63,
    color338672,
    color5FC746,
    color979797,
    color358FEA,
    colorF0715A,
    colorD32579,
    colorA417C8,
  ];
}
