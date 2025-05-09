final List<String> SyncStatus = ["متزامن","فشل","ينتظر"];

class SyncStatusArabicNames{
  static const String synced = "متزامن";
  static const String failed = "فشل";
  static const String pending = "ينتظر";
}

final List<String> CategoryOptions = [
  "نايلون",
  "ناموسيات",
  "صقيع",
  "تعقيم"
];

// تعريف mapping بين كل فئة وخيارات المصروف الخاصة بها
final Map<String, List<String>> ExpenseTypeMapping = {
  "نايلون": [
    "أجور يد عاملة",
    "ثمن نايلون",
    "ثمن خشب",
    "شريط صالات",
    "شريط تربيط",
    "أخرى"
  ],
  "ناموسيات": [
    "أجور يد عاملة",
    "ثمن ناموسيات",
    "شريط تربيط",
    "أخرى"
  ],
  "صقيع": [
    "أجور يد عاملة",
    "ثمن مواد",
    "أخرى"
  ],
  "تعقيم": [
    "أجور يد عاملة",
    "أخرى",
    "ثمن مواد"
  ],
};