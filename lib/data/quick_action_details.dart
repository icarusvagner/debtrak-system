import 'package:debtrak/core/utils/layout_type.dart';
import 'package:debtrak/data/models/quick_action_model.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class QuickActionDetails {
  final actionButton = [
    QuickActionModel(
      icon: LucideIcons.userPlus,
      label: "New debtor",
      args: 1,
      goToLayout: LayoutType.debtorsPage,
    ),
    QuickActionModel(
      icon: LucideIcons.filePlus,
      label: "Add note",
      goToLayout: LayoutType.notesPage,
    ),
    QuickActionModel(
      icon: LucideIcons.banknoteArrowUp,
      label: "Set Balance",
      goToLayout: LayoutType.homePage,
      args: 0,
    ),
  ];
}
