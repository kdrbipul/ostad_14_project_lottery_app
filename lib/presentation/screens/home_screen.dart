import 'package:flutter/material.dart';
import 'package:ostad_14_project_lottery_app/core/app_colors.dart';
import 'package:ostad_14_project_lottery_app/core/app_string.dart';
import 'package:provider/provider.dart';

import '../provider/lottery_provider.dart';
import '../widget/gradient_scaffold.dart';
import 'lottery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selectedNumber;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LotteryProvider>(context);
    return GradientScaffold(
      // showBackButton: true,
      title: AppStrings.appTitle,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 15,
            children: [
              SizedBox(height: 100),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.circle
                ),
                  child: Icon(Icons.casino, size: 100, color: Colors.white)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  alignment: Alignment.topLeft,
                  // height: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: AppColors.glassGradient,
                    ),
                    border: Border.all(
                      color: AppColors.whiteOpacity20,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackOpacity10,
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        AppStrings.homeTitle,
                        style: TextStyle(
                          fontSize: 65,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        AppStrings.homeTagline,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        AppStrings.homeEmoji,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LotteryScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
                    ),
                    child: Text(
                      AppStrings.playLotteryAction,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
