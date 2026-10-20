import 'package:dynamic_app_icon_flutter_plus/dynamic_app_icon_flutter_plus.dart';
import 'package:playground/core/public_utils.dart';

class DynamicLauncerIconUtil {
  // Check if dynamic icons are supported on this platform
  static Future<bool> checkIfPlatformIsEligible() async {
    bool supported = await DynamicAppIconFlutterPlus.supportsAlternateIcons;
    return supported;
  }

  // Get all available icons
  static Future<List<String>> getAvailableIcons() async {
    List<String> icons = await DynamicAppIconFlutterPlus.getAvailableIcons();
    return icons;
  }

  // Get the currently active icon
  static Future<String?> getCurrentAppliedIcon() async {
    String? currentIcon = await DynamicAppIconFlutterPlus.getAlternateIconName();
    return currentIcon;
  }

  // Change to a different icon
  static Future<void> changeLauncherIcon(String iconName) async {
    debugCheck("change icon name : $iconName");
    final dynamic changeIcon = await DynamicAppIconFlutterPlus.setAlternateIconName(iconName);
    debugCheck("change of icon : $changeIcon");
  }

  // Restore default icon
  static Future<void> restoreDefaultIcon() async {
    final dynamic restoreDefaultIcon = await DynamicAppIconFlutterPlus.setAlternateIconName(null);
    debugCheck("restore default icon : $restoreDefaultIcon");
  }
}
