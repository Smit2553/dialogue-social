import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

List<Widget> buildVerifiedBadge(bool isVerified) {
  if (isVerified) {
    return [
      const SizedBox(width: 8.0),
      const badges.Badge(
        badgeContent: Icon(Icons.check, size: 10.0, color: Colors.white),
        badgeStyle: badges.BadgeStyle(
          badgeColor: Colors.green,
          shape: badges.BadgeShape.instagram,
        ),
      ),
    ];
  } else {
    return [];
  }
}
