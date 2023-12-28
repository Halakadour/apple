import 'package:apple/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(pageIndex: 2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff6CC51D),
        child: SvgPicture.asset(
          "assets/bag.svg",
          width: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: const Center(child: Text("Favorite Screen")),
    );
  }
}
