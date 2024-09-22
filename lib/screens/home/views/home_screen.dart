import 'dart:math';
import 'package:expense_tracker/screens/add_expense/views/add_expense.dart';
import 'package:expense_tracker/screens/home/views/main_screen.dart';
import 'package:expense_tracker/screens/stats/stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Color selectedItem = Theme.of(context).colorScheme.primary;
    Color unselectedItem = Colors.grey;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => setState(() => index = value),
          backgroundColor: Colors.white,
          selectedItemColor: selectedItem,
          unselectedItemColor: unselectedItem,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.graph_square_fill), label: "Stats"),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpense(),
            ),
          );
        },
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: const GradientRotation(pi / 4),
            ),
          ),
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      body: index == 0 ? const MainScreen() : const StatScreen(),
    );
  }
}
