import 'package:flutter/material.dart';
//reference link --- https://www.youtube.com/watch?v=xviNPcy8DD4&t=19s
class AppLifeCycleExample extends StatefulWidget {
  const AppLifeCycleExample({super.key});

  @override
  State<AppLifeCycleExample> createState() => _AppLifeCycleExampleState();
}

class _AppLifeCycleExampleState extends State<AppLifeCycleExample>
    with WidgetsBindingObserver {
  late AppLifecycleState appLifecycleState;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      appLifecycleState = state;
      print(appLifecycleState);
    });

    switch (state) {
      case AppLifecycleState.inactive:
      /**
       * The application is in an inactive state and is not receiving user input.
       * This event only works on iOS, as there is no equivalent event to map to on Android
       */
      // TODO: Handle this case.
      case AppLifecycleState.paused:
      /**
       * The application is not currently visible to the user,
       * not responding to user input, and running in the background.
       * This is equivalent to onPause() in Android
       */
      case AppLifecycleState.resumed:
      /**
       * The application is visible and responding to user input.
       * This is equivalent to onPostResume() in Android
       */
      case AppLifecycleState.hidden:
      /**
       *All views of an application are hidden, either because the application is about to be paused (on iOS and Android),
       * or because it has been minimized or placed on a desktop that is no longer visible (on non-web desktop),
       * or is running in a window or tab that is no longer visible (on the web).
       */
      case AppLifecycleState.detached:
      /**
       * The application is still hosted by a Flutter engine but is detached from any host views.
       * The application defaults to this state before it initializes,
       * and can be in this state (on Android and iOS only) after all views have been detached.
       * When the application is in this state, the engine is running without a view.
       */
      // TODO: Handle this case.
    }
    super.didChangeAppLifecycleState(state);
  }
}
