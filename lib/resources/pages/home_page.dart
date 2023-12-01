import 'package:flutter_app/app/controllers/authentication_controller.dart';
import 'package:flutter_app/resources/pages/events_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';
import 'package:flutter/material.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/safearea_widget.dart';
import '/app/controllers/home_controller.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static const path = '/home';

  HomePage() : super(path, child: _HomePageState());
}

class _HomePageState extends NyState<HomePage> {
  bool isLoggedIn = false;
  @override
  boot() async {
    super.boot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Outdoor".tr()),
        centerTitle: true,
      ),
      body: SafeAreaWidget(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Logo(),
              Text(
                getEnv("APP_NAME"),
              ).displayMedium(context),
              if (!context.isDarkMode)
                Switch(
                    value: isThemeDark,
                    onChanged: (_) {
                      NyTheme.set(context,
                          id: getEnv(isThemeDark != true
                              ? 'DARK_THEME_ID'
                              : 'LIGHT_THEME_ID'));
                    }),
              if (!context.isDarkMode)
                Text("${isThemeDark ? "Dark" : "Light"} Mode"),
              Backpack.instance.auth() != null
                  ? ElevatedButton(
                      onPressed: () async {
                        await AuthenticationController().logout();
                      },
                      child: Text("Logout"))
                  : SizedBox(),
              ElevatedButton(
                  onPressed: () async {
                    routeTo(EventsPage.path);
                  },
                  child: Text("Events"))
            ],
          ),
        ),
      ),
    );
  }

  bool get isThemeDark =>
      ThemeProvider.controllerOf(context).currentThemeId ==
      getEnv('DARK_THEME_ID');
}
