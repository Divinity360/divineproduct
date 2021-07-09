// import 'package:chiedoziedivine/models/Product.dart';
// import 'package:chiedoziedivine/services/apiService.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// class MockBuildContext extends Mock implements BuildContext {}
// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   ApiService apiService;
//   MockBuildContext _mockContext;
//
//   setUp(() {
//     apiService = ApiService();
//     _mockContext = MockBuildContext();
//   });
//
//
//   var matcher = <String, dynamic>{
//     'id': 1,
//     'name': 'new',
//     'price': 300,
//     'before_sale_price': null,
//     'description': null,
//     'full_description': null,
//     'order': null,
//     'tags': ["shoe"],
//     'availability': null
//   };
//
//   test('Return type is instance of Product', () async {
//     Product actual = await apiService.readProductFromJSON(_mockContext);
//     expect(actual, isInstanceOf<Product>());
//   });
//
//   test('Returns valid map', () async {
//     Product product = new Product(id: 1, name: "new", price: 300, tags: ['shoe']);
//     expect(product.toJson(), equals(matcher));
//   });
//
//   test('Returns valid object from Map', () async {
//     expect(Product.fromJson(matcher),
//       isA<Product>(),);
//   });
// }