import 'package:debtrak/core/utils/layout_type.dart';
import 'package:debtrak/data/models/quick_action_model.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class QuickActionDetails {
  final actionButton = [
    QuickActionModel(
      icon: LucideIcons.userPlus,
      label: "New debtor",
      goToLayout: LayoutType.debtorsPage,
    ),
    QuickActionModel(
      icon: LucideIcons.filePlus,
      label: "Add note",
      goToLayout: LayoutType.notesPage,
    ),
    QuickActionModel(
      icon: LucideIcons.banknote,
      label: "Payment",
      goToLayout: LayoutType.debtorsPage,
    ),
  ];
}
