import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionsData = [
  {
    'icon': const FaIcon(FontAwesomeIcons.burger),
    'name': 'Food',
    'color': Colors.yellow[700],
    'totalAmount': '\$ 20.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bagShopping),
    'name': 'Shopping',
    'color': Colors.purple,
    'totalAmount': '\$ 460.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.heartCircleCheck),
    'name': 'Health',
    'color': Colors.green,
    'totalAmount': '\$ 790.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.plane),
    'name': 'Travel',
    'color': Colors.blue,
    'totalAmount': '\$ 190.00',
    'date': 'Yesterday',
  },
];
