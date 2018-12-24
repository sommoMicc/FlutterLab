import 'package:flutter/material.dart';

import './pages/splash_screen.dart';
import './UI/theme.dart';

void main() => runApp(MaterialApp(
  title: "Let's Memory!",
  color: LetsMemoryColors.primary,
  home: SplashscreenPage()
));
