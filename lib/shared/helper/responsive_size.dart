import 'package:flutter/material.dart';

double rs(BuildContext context, double size) {
  final width = MediaQuery.of(context).size.width;

  if (width >= 1200) return size * 1.4; // Desktop
  if (width >= 800) return size * 1.2; // Tablet
  return size; // Mobile
}
