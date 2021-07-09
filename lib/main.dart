import 'package:chiedoziedivine/providers/app_state.dart';
import 'package:chiedoziedivine/utils/colors.dart';
import 'package:chiedoziedivine/views/ProductDetailModal/ProductDetailModal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => ProductDetailModal(),
        },
        theme: ThemeData(
            primaryColor: AppColors.PRIMARY_COLOR,
            accentColor: AppColors.ACCENT_COLOR,
            textTheme: GoogleFonts.loraTextTheme()),
      ),
    ),
  );
}
