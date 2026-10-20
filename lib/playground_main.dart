import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:playground/home/playgroud_home_screen.dart';
import 'package:playground/playground_uri_handler.dart';

class PlaygroundMainScreen extends StatefulWidget {
  const PlaygroundMainScreen({super.key});

  @override
  State<PlaygroundMainScreen> createState() => _PlaygroundMainScreenState();
}

class _PlaygroundMainScreenState extends State<PlaygroundMainScreen> {
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  late StreamSubscription<Uri?>? _sub;

  @override
  void initState() {
    super.initState();
    PlaygroundUriHandler.init(navKey: navKey);
    handleHomeWidgetTap();
  }

  void handleHomeWidgetTap() {
    final PlaygroundUriHandler launcher = PlaygroundUriHandler();

    HomeWidget.initiallyLaunchedFromHomeWidget().then(
      (uri) => launcher.launch(uri: uri, source: UriSource.homeWidget),
    );

    _sub = HomeWidget.widgetClicked.listen(
      (uri) => launcher.launch(uri: uri, source: UriSource.homeWidget),
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      home: PlaygroudHomeScreen(),
    );
  }
}
