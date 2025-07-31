// lib/constants.dart



class PagesRoutesConstants {
  static const String root = '/';
  static const String addPlanting = '/add-planting';
  static const String addPruning = '/add-pruning';
  static const String addGrafting = '/add-grafting';
  static const String selectSecondStorage = '/select-second-storage';
  static const String storage = '/storage';
  static const String operations = '/operations';
  static const String prices = '/prices';
  static const String reservations = '/reservations';
}
class OperationTypesConstants {
  static const String planting = 'زراعة';
  static const String pruning = 'قص';
  static const String grafting = 'تطعيم';

  static const double plantingDefaultSuccessRatio = 0.85;
  static const double pruningDefaultSuccessRatio = 0.9;
  static const double graftingDefaultSuccessRatio = 0.85;
}

class NurseryPeriodConstants {
  static const int seed = 0;
  static const int short = 7;
  static const int long = 30;
}

class PlantShapesConstants {
  static const String wildSeed = 'بذرة برية';
  static const String cultivatedSeed = 'بذرة جوية';
  static const String seedling = 'شتلة';
  static const String rasiya = 'راسية';
  static const String qarmah = 'قرمة';
  static const String rasiyaRasiya = 'راسية راسية';
  static const String falqa = 'فلقة';
  static const String origin = 'أصل';
  static const String zaghfa = 'زغفة';
  static const String seedlingOnOrigin = 'شتلة ع أصل';
  static const String seedlingOnZaghfa = 'شتلة ع زغفة';
  static const String qarmahOnOrigin = 'قرمة ع أصل';
  static const String qarmahOnZaghfa = 'قرمة ع زغفة';
  static const String rasiyaOnOrigin = 'راسية ع أصل';
  static const String rasiyaOnZaghfa = 'راسية ع زغفة';
  static const String rasiyaRasiyaOnOrigin = 'راسية راسية ع أصل';
  static const String rasiyaRasiyaOnZaghfa = 'راسية راسية ع زغفة';
  static const String falqaOnOrigin = 'فلقة ع أصل';
  static const String falqaOnZaghfa = 'فلقة ع زغفة';

  static String mergeForGrafting (String head, String root)=>"$head ع $root";
  static String? rootOf(String cultivatedPlantShape) {
    switch (cultivatedPlantShape) {
      case seedling:
        return qarmah;
      case rasiya:
        return falqa;
      case falqa:
      case rasiyaRasiya:
      case qarmah:
        return null;
      default:
      // رمي استثناء في حالة عدم تطابق أي شرط
        throw StateError('الشكل $cultivatedPlantShape غير مدعوم في الدالة rootOf');
    }
  }

  static String? headOf(String wildPlantShape) {
    switch (wildPlantShape) {
      case origin:
        return zaghfa;
      case zaghfa:
        return null;
      default:
        throw StateError('الشكل $wildPlantShape غير مدعوم في الدالة headOf');
    }
  }

}
