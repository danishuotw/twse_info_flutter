import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:twse_info_flutter/main.dart' as app;

import 'robots/home_robot.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  HomeRobot homeRobot;

  group('App test', () {
    testWidgets('whole app', (WidgetTester tester) async {
      app.main();

      homeRobot = HomeRobot(tester);
      await homeRobot.clickEnterButton();
      await homeRobot.findTitle();
      await homeRobot.findBottomNavBar();
      await homeRobot.clickFirstBarItem();
      await homeRobot.clickSecondBarItem();
      await homeRobot.clickFirstBarItem();
      await homeRobot.scrollThePage();
      await homeRobot.scrollThePage(scrollUp: true);
    });
  });
}
