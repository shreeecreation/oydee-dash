import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oydeeedashboard/src/core/core.dart';
import 'package:oydeeedashboard/src/features/auth/auth.dart';
import 'package:sidebarx/sidebarx.dart';

import '../widgets/widgets.dart';
import 'pages.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final isSmallScreen = MediaQuery.of(context).size.width < 600;
      return Scaffold(
        backgroundColor: AppColors.white,
        key: _key,
        appBar: isSmallScreen
            ? AppBar(
                backgroundColor: canvasColor,
                title: Text(getTitleByIndex(_controller.selectedIndex)),
                leading: IconButton(
                  onPressed: () {
                    _key.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              )
            : null,
        drawer: HomePageSidebar(controller: _controller),
        body: Row(
          children: [
            if (!isSmallScreen) HomePageSidebar(controller: _controller),
            Expanded(
              child: Center(
                child: HomeSideMenu(
                  controller: _controller,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class HomeSideMenu extends StatelessWidget {
  const HomeSideMenu({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return const HomeView();

          case 1:
            return const PostsView();

          default:
            return const LoginPage();
        }
      },
    );
  }
}
