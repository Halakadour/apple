import 'package:apple/core/widgets/bottom_app_bar.dart';
import 'package:apple/features/favorite/screens/favorite_screen.dart';
import 'package:apple/features/home/screens/home_screen.dart';
import 'package:apple/features/user/screens/user_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/float_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, value, _) {
          return Scaffold(
            floatingActionButton: const MyFloatButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            body: IndexedStack(index: value, children: [
              HomeScreen(),
              UserScreen(),
              FavoriteScreen(),
              SizedBox(),
            ]),
            bottomNavigationBar: CustomBottomAppBar(pageIndex: pageIndex),
          );
        });
  }
}
