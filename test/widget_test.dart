import 'package:flutter_test/flutter_test.dart';
import 'package:navigasi_wisata/main.dart';

void main() {
  testWidgets('Aplikasi Wisata Indonesia tampil',
      (WidgetTester tester) async {
    await tester.pumpWidget(const WisataIndonesiaApp());

    expect(find.text('Wisata Indonesia'), findsOneWidget);
    expect(find.text('Kategori Wisata'), findsOneWidget);
    expect(find.text('Pantai'), findsOneWidget);
    expect(find.text('Gunung'), findsOneWidget);
    expect(find.text('Budaya'), findsOneWidget);
    expect(find.text('Kuliner'), findsOneWidget);
  });
}
