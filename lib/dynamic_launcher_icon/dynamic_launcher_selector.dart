import 'package:flutter/material.dart';
import 'package:playground/core/public_utils.dart';
import 'package:playground/dynamic_launcher_icon/dynamic_launcer_icon_util.dart';

class DynamicLauncherSelector extends StatefulWidget {
  const new({super.key});

  @override
  State<DynamicLauncherSelector> createState() => _DynamicLauncherSelectorState();
}

class _DynamicLauncherSelectorState extends State<DynamicLauncherSelector> {
  List<String> availableIcons = [];
  String? currentIcon;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadIcons();
  }

  Future<void> _loadIcons() async {
    final List<String> icons = await DynamicLauncerIconUtil.getAvailableIcons();
    final String? current = await DynamicLauncerIconUtil.getCurrentAppliedIcon();

    setState(() {
      availableIcons = icons;
      currentIcon = current;
      isLoading = false;
    });
  }

  Future<void> _setIcon(String? iconName) async {
    debugCheck("icon name : $iconName");
    try {
      if (iconName != null && iconName.isNotEmpty) {
        await DynamicLauncerIconUtil.changeLauncherIcon(iconName);
      } else {
        await DynamicLauncerIconUtil.restoreDefaultIcon();
      }
      await _loadIcons();
      debugCheck("icon changes successfully!!");
    } catch (e) {
      debugCheck("error changing icon : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView(
              children: [
                // Default icon option
                ListTile(
                  title: Text('Default'),
                  trailing: currentIcon == null ? Icon(Icons.check) : null,
                  onTap: () => _setIcon(null),
                ),
                // Alternate icons
                ...availableIcons.map(
                  (iconName) => ListTile(
                    title: Text(iconName),
                    trailing: currentIcon == iconName ? Icon(Icons.check) : null,
                    onTap: () => _setIcon(iconName),
                  ),
                ),
              ],
            ),
    );
  }
}
