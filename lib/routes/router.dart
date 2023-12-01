import '/resources/pages/events_page.dart';
import 'package:flutter_app/resources/pages/login_page.dart';
import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.x/router
|--------------------------------------------------------------------------
*/

appRouter() => nyRoutes((router) {
      router.route(
        HomePage.path,
        (context) => HomePage(),
        authPage: true,
      );
      // Add your routes here
      router.route(LoginPage.path, (context) => LoginPage(),
          initialRoute: true, transition: PageTransitionType.fade);
      // router.route(NewPage.path, (context) => NewPage(), transition: PageTransitionType.fade);
      router.route(EventsPage.path, (context) => EventsPage());
    });
