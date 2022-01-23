import 'package:flutter/material.dart';

enum TransactionType { incoming, outgoing, unknown }

extension TransactionTypeExtensions on TransactionType {
  String get sign {
    switch (this) {
      case TransactionType.incoming:
        return "+";
      case TransactionType.outgoing:
        return "-";
      default:
        return "";
    }
  }

  IconData get icon {
    switch (this) {
      case TransactionType.incoming:
        return Icons.download;
      case TransactionType.outgoing:
        return Icons.upload;
      default:
        return Icons.help;
    }
  }
}
