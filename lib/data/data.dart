import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionsData = [
  {
    'icon': const FaIcon(FontAwesomeIcons.burger, color: Colors.white),
    'name': 'Food',
    'color': Colors.yellow[700],
    'totalAmount': '\$ 20.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.bagShopping,
      color: Colors.white,
    ),
    'name': 'Shopping',
    'color': Colors.purple,
    'totalAmount': '\$ 460.00',
    'date': 'Today',
  },
  {
    'icon':
        const FaIcon(FontAwesomeIcons.heartCircleCheck, color: Colors.white),
    'name': 'Health',
    'color': Colors.green,
    'totalAmount': '\$ 790.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.plane, color: Colors.white),
    'name': 'Travel',
    'color': Colors.blue,
    'totalAmount': '\$ 190.00',
    'date': 'Yesterday',
  },
];
