import 'package:flutter/material.dart';

class IconTypeMapping {
  Icon mapTypeToIcon(String type) {
    switch (type) {
      case 'Food':
        return Icon(
          Icons.rice_bowl,
          size: 40,
        );
      case 'Shop':
        return Icon(
          Icons.shopping_bag,
          size: 40,
        );
      case 'Traffic':
        return Icon(
          Icons.emoji_transportation,
          size: 40,
        );
      case 'Snack':
        return Icon(
          Icons.cake,
          size: 40,
        );
      case 'Sport':
        return Icon(
          Icons.sports,
          size: 40,
        );
      case 'Game':
        return Icon(
          Icons.videogame_asset,
          size: 40,
        );
      case 'Phone':
        return Icon(
          Icons.phone,
          size: 40,
        );
      case 'Health':
        return Icon(
          Icons.local_hospital_rounded,
          size: 40,
        );
      case 'Study':
        return Icon(
          Icons.book,
          size: 40,
        );
      case 'Network':
        return Icon(
          Icons.people,
          size: 40,
        );
      case 'Salary':
        return Icon(
          Icons.add_card,
          size: 40,
        );
      case 'Award':
        return Icon(
          Icons.card_membership,
          size: 40,
        );
      case 'Interest':
        return Icon(
          Icons.credit_card,
          size: 40,
        );
      case 'Gift':
        return Icon(
          Icons.card_giftcard,
          size: 40,
        );
      case 'Dividend':
        return Icon(
          Icons.group_add,
          size: 40,
        );
      case 'Stocks':
        return Icon(
          Icons.trending_up,
          size: 40,
        );
      case 'Borrow':
        return Icon(
          Icons.arrow_back,
          size: 40,
        );
      case 'Received':
        return Icon(
          Icons.download,
          size: 40,
        );
      case 'Rent':
        return Icon(
          Icons.house,
          size: 40,
        );
      case 'Alimony':
        return Icon(
          Icons.child_care,
          size: 40,
        );
      case 'Fund':
        return Icon(
          Icons.attach_money,
          size: 40,
        );
      case 'Others':
        return Icon(
          Icons.add,
          size: 40,
        );
      default:
        return Icon(
          Icons.add,
          size: 40,
        );
    }
  }
}
