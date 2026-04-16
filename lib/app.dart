import 'package:flutter/material.dart';
import 'package:ostad_14_project_lottery_app/presentation/provider/lottery_provider.dart';
import 'package:ostad_14_project_lottery_app/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
class LotteryApp extends StatelessWidget {
  const LotteryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LotteryProvider(),
      child: MaterialApp(
        title: 'Lottery App',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   useMaterial3: true,
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   textTheme: const TextTheme(
        //     titleLarge: TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //     ),
        //     titleMedium: TextStyle(
        //       fontSize: 18,
        //       fontWeight: FontWeight.bold,
        //     ),
        //     bodyLarge: TextStyle(
        //       fontSize: 16,
        //     ),
        //     bodyMedium: TextStyle(
        //       fontSize: 14,
        //     ),
        //   ),
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       foregroundColor: Colors.white,
        //       backgroundColor: Colors.deepPurple,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        //     )
        //   )
        // ),
        home: HomeScreen(),
      ),
    );
  }
}
