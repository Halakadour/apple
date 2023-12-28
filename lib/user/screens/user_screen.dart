
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/widgets/bottom_app_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(pageIndex: 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff6CC51D),
        child: SvgPicture.asset(
          "assets/bag.svg",
          width: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: const Center(child: Text("user screen")),
    );
  }
}
