import '/core/constants/assets.dart';
import '/core/constants/strings.dart';

enum DialogHelperEnum { noInternet, serverError, noDataFound, comingSoon }

extension DialogHelperEnumExt on DialogHelperEnum {
  /// Returns a [String] value for the __DialogHelperEnum__.
  String get strValue {
    switch (this) {
      case DialogHelperEnum.noInternet:
        return 'No Internet';
      case DialogHelperEnum.noDataFound:
        return 'No Data Found';
      case DialogHelperEnum.comingSoon:
        return 'Coming Soon';
      case DialogHelperEnum.serverError:
        return 'Server Error';
    }
  }

  String get title {
    switch (this) {
      case DialogHelperEnum.noInternet:
        return AppStrings.uhDialogTitle;
      case DialogHelperEnum.serverError:
        return AppStrings.oopsDialogTitle;
      case DialogHelperEnum.noDataFound:
        return AppStrings.weCouldntFindAnything;
      case DialogHelperEnum.comingSoon:
        return AppStrings.stayTuned;
    }
  }

  String get subtitle {
    switch (this) {
      case DialogHelperEnum.noInternet:
        return AppStrings.noInternetErrorMessage;
      case DialogHelperEnum.serverError:
        return AppStrings.somethingWentWrongMessage;
      case DialogHelperEnum.noDataFound:
        return '';
      case DialogHelperEnum.comingSoon:
        return AppStrings.weAreWorkingOnSomethingCool;
    }
  }

  String get image {
    // switch (this) {
    // case DialogHelperEnum.noInternet:
    //   return AssetsConstants.noInternet;
    // case DialogHelperEnum.serverError:
    //   return AssetsConstants.comingSoon;
    // case DialogHelperEnum.noDataFound:
    //   return AssetsConstants.noDataFound;
    // case DialogHelperEnum.comingSoon:
    //   return AssetsConstants.comingSoon;
    // }
    return '';
  }

  String get buttonText {
    switch (this) {
      case DialogHelperEnum.noInternet:
        return AppStrings.tryAgain;
      case DialogHelperEnum.serverError:
        return AppStrings.tryAgain;
      case DialogHelperEnum.noDataFound:
        return AppStrings.checkBackLater;
      case DialogHelperEnum.comingSoon:
        return AppStrings.back;
    }
  }
}
