import 'package:flutter/material.dart';
import 'package:ostad_14_project_lottery_app/core/app_colors.dart';
import 'package:ostad_14_project_lottery_app/core/app_string.dart';
import 'package:ostad_14_project_lottery_app/presentation/screens/result_screen.dart';
import 'package:ostad_14_project_lottery_app/presentation/widget/number_tile.dart';
import 'package:provider/provider.dart';

import '../provider/lottery_provider.dart';
import '../widget/gradient_scaffold.dart';

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
              Icon(Icons.casino, size: 100, color: Colors.cyanAccent),
              Text(
                AppStrings.entryHeading,
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                AppStrings.entrySubheading,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteOpacity70,
                ),
                textAlign: TextAlign.center,
              ),
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
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final number = index + 1;
                      return NumberTile(
                        number: number,
                        isSelected: _selectedNumber == number,
                        onTap: () {
                          setState(() => _selectedNumber = number);
                          provider.setSelectedNumber(number);
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    provider.playLottery();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text(
                    AppStrings.playLotteryAction,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
              Text(AppStrings.goodLuck, style: TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }
}
