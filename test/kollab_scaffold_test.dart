import 'package:flutter_test/flutter_test.dart';

import 'package:kollab_scaffold/kollab_scaffold.dart';

void main() {
  test('constructs app', () {
    final title = 'My App';
    final app = App(title: title);
    expect(app.title, title);
  });
}
