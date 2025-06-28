import 'package:wichpath_ai/constants/asset_constants.dart';

enum WalletActionType {
  deposit, // Nạp tiền
  withdraw, // Rút tiền
  point,
} // Hoa hồng

extension WalletActionTypeExtension on WalletActionType {
  String get label {
    switch (this) {
      case WalletActionType.deposit:
        return 'Nạp';
      case WalletActionType.withdraw:
        return 'Rút';
      case WalletActionType.point:
        return 'Đổi thưởng';
    }
  }

  String get iconPath {
    switch (this) {
      case WalletActionType.deposit:
        return AssetConstants.depositIcon;
      case WalletActionType.withdraw:
        return AssetConstants.withDrawIcon;
      case WalletActionType.point:
        return AssetConstants.giftIcon;
    }
  }
}
