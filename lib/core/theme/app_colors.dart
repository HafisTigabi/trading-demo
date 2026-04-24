import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color bg;
  final Color surface;
  final Color surfaceHigh;
  final Color card;
  final Color accent;
  final Color accentGlow;
  final Color accentSoft;
  final Color accentText;
  final Color gain;
  final Color gainBg;
  final Color loss;
  final Color lossBg;
  final Color neutral;
  final Color textPri;
  final Color textSec;
  final Color textMuted;
  final Color border;
  final Color borderLight;
  final Color amber;
  final Color amberBg;
  final Color purple;
  final Color purpleBg;

  const AppColorScheme({
    required this.bg,
    required this.surface,
    required this.surfaceHigh,
    required this.card,
    required this.accent,
    required this.accentGlow,
    required this.accentSoft,
    required this.accentText,
    required this.gain,
    required this.gainBg,
    required this.loss,
    required this.lossBg,
    required this.neutral,
    required this.textPri,
    required this.textSec,
    required this.textMuted,
    required this.border,
    required this.borderLight,
    required this.amber,
    required this.amberBg,
    required this.purple,
    required this.purpleBg,
  });

  factory AppColorScheme.dark() {
    return const AppColorScheme(
      bg: Color(0xFF0A0D14),
      surface: Color(0xFF111620),
      surfaceHigh: Color(0xFF181E2C),
      card: Color(0xFF141B28),
      accent: Color(0xFF4F8EF7),
      accentGlow: Color(0x264F8EF7),
      accentSoft: Color(0xFF1A2540),
      accentText: Color(0xFF4E94E6),
      gain: Color(0xFF22C55E),
      gainBg: Color(0x1A22C55E),
      loss: Color(0xFFEF4444),
      lossBg: Color(0x1AEF4444),
      neutral: Color(0xFF94A3B8),
      textPri: Color(0xFFF1F5F9),
      textSec: Color(0xFF64748B),
      textMuted: Color(0xFF334155),
      border: Color(0xFF1E2A3D),
      borderLight: Color(0xFF253047),
      amber: Color(0xFFE29A27),
      amberBg: Color(0xFF201508),
      purple: Color(0xFF9B7FE8),
      purpleBg: Color(0xFF1A1530),
    );
  }

  factory AppColorScheme.light() {
    // For now, mirroring dark or providing simplified light variations
    return const AppColorScheme(
      bg: Color(0xFFF8FAFC),
      surface: Color(0xFFFFFFFF),
      surfaceHigh: Color(0xFFF1F5F9),
      card: Color(0xFFFFFFFF),
      accent: Color(0xFF2563EB),
      accentGlow: Color(0x262563EB),
      accentSoft: Color(0xFFDBEAFE),
      accentText: Color(0xFF1D4ED8),
      gain: Color(0xFF16A34A),
      gainBg: Color(0x1A16A34A),
      loss: Color(0xFFDC2626),
      lossBg: Color(0x1ADC2626),
      neutral: Color(0xFF64748B),
      textPri: Color(0xFF0F172A),
      textSec: Color(0xFF475569),
      textMuted: Color(0xFF94A3B8),
      border: Color(0xFFE2E8F0),
      borderLight: Color(0xFFCBD5E1),
      amber: Color(0xFFD97706),
      amberBg: Color(0xFFFEF3C7),
      purple: Color(0xFF7C3AED),
      purpleBg: Color(0xFFEDE9FE),
    );
  }

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? bg,
    Color? surface,
    Color? surfaceHigh,
    Color? card,
    Color? accent,
    Color? accentGlow,
    Color? accentSoft,
    Color? accentText,
    Color? gain,
    Color? gainBg,
    Color? loss,
    Color? lossBg,
    Color? neutral,
    Color? textPri,
    Color? textSec,
    Color? textMuted,
    Color? border,
    Color? borderLight,
    Color? amber,
    Color? amberBg,
    Color? purple,
    Color? purpleBg,
  }) {
    return AppColorScheme(
      bg: bg ?? this.bg,
      surface: surface ?? this.surface,
      surfaceHigh: surfaceHigh ?? this.surfaceHigh,
      card: card ?? this.card,
      accent: accent ?? this.accent,
      accentGlow: accentGlow ?? this.accentGlow,
      accentSoft: accentSoft ?? this.accentSoft,
      accentText: accentText ?? this.accentText,
      gain: gain ?? this.gain,
      gainBg: gainBg ?? this.gainBg,
      loss: loss ?? this.loss,
      lossBg: lossBg ?? this.lossBg,
      neutral: neutral ?? this.neutral,
      textPri: textPri ?? this.textPri,
      textSec: textSec ?? this.textSec,
      textMuted: textMuted ?? this.textMuted,
      border: border ?? this.border,
      borderLight: borderLight ?? this.borderLight,
      amber: amber ?? this.amber,
      amberBg: amberBg ?? this.amberBg,
      purple: purple ?? this.purple,
      purpleBg: purpleBg ?? this.purpleBg,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
      ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) {
      return this;
    }
    return AppColorScheme(
      bg: Color.lerp(bg, other.bg, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceHigh: Color.lerp(surfaceHigh, other.surfaceHigh, t)!,
      card: Color.lerp(card, other.card, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentGlow: Color.lerp(accentGlow, other.accentGlow, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      accentText: Color.lerp(accentText, other.accentText, t)!,
      gain: Color.lerp(gain, other.gain, t)!,
      gainBg: Color.lerp(gainBg, other.gainBg, t)!,
      loss: Color.lerp(loss, other.loss, t)!,
      lossBg: Color.lerp(lossBg, other.lossBg, t)!,
      neutral: Color.lerp(neutral, other.neutral, t)!,
      textPri: Color.lerp(textPri, other.textPri, t)!,
      textSec: Color.lerp(textSec, other.textSec, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderLight: Color.lerp(borderLight, other.borderLight, t)!,
      amber: Color.lerp(amber, other.amber, t)!,
      amberBg: Color.lerp(amberBg, other.amberBg, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      purpleBg: Color.lerp(purpleBg, other.purpleBg, t)!,
    );
  }
}
