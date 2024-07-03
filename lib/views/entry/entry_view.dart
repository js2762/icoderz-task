import 'package:flutter/material.dart';
import 'package:icoderz_task/views/entry/tabs/earnings_view.dart';
import 'package:icoderz_task/views/entry/tabs/expenses_view.dart';

class EntryView extends StatefulWidget {
  const EntryView({super.key});

  @override
  State<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends State<EntryView> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            color: Colors.deepPurple[400],
          ),
          tabs: const [
            Tab(
              child: Text('Earnings'),
            ),
            Tab(
              child: Text('Expenses'),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(controller: tabController, children: const [
            EarningsView(),
            ExpensesView(),
          ]),
        ),
      ],
    );
  }
}
