import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icoderz_task/controllers/entry_controller.dart';
import 'package:icoderz_task/data/app_colors.dart';

import '../../widgets/custom_dialog_box.dart';
import '../../widgets/top_indicator.dart';
import '../entry/entry_view.dart';
import '../profile/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late TabController bottomTabController;
  int bottomBarIndex = 0;
  final entryController = Get.put(EntryController());

  Widget _buildBody(int bottomBarIndex) {
    switch (bottomBarIndex) {
      case 0:
        return const EntryView();
      case 1:
        return const ProfileView();
      default:
        return Container();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    bottomTabController = TabController(length: 2, vsync: this);
    Future.delayed(const Duration(seconds: 1), () => entryController.getAllListData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          "Finance Management",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CustomDialogBox(),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: _buildBody(bottomBarIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: TabBar(
          indicator: TopIndicator(),
          onTap: (value) {
            bottomBarIndex = value;
            if(value == 1){
              entryController.calculateCurrentBalance();
            }
            setState(() {});
          },
          controller: bottomTabController,
          labelColor: AppColors.appBarColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: AppColors.appBarColor,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(
              icon: Icon(Icons.edit_note),
              text: 'Entries',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: 'Profile',
            )
          ],
        ),
      ),
    );
  }
}
