import 'package:flutter_test/flutter_test.dart';

import 'package:kollab_scaffold/kollab_scaffold.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('constructs app', () async {
    final model = await ScaffoldConfigModel.example;
    expect(model.app_title, 'My App Title');

    final widget = HomePage(model: model);
    expect(widget.model.app_title, model.app_title);
  });
}
