import 'package:flutter/material.dart';

enum CardType {
  visa,
  mastercard,
  amex,
  discover,
}

extension CardTypeExtensions on CardType {
  AssetImage get image {
    switch (this) {
      case CardType.mastercard:
        return const AssetImage("assets/card_logos/mastercard.png");
      case CardType.visa:
        return const AssetImage("assets/card_logos/visa.png");
      case CardType.discover:
        return const AssetImage("assets/card_logos/discover.png");
      case CardType.amex:
        return const AssetImage("assets/card_logos/amex.png");
      default:
        return const AssetImage("");
    }
  }
}
