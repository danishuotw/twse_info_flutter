// Mocks generated by Mockito 5.4.0 from annotations
// in twse_info_flutter/test/view_model/company_detail_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:twse_info_flutter/data/model/dto/company_dto.dart' as _i4;
import 'package:twse_info_flutter/domain/favourite/add_favourite.dart' as _i6;
import 'package:twse_info_flutter/domain/favourite/delete_favourite.dart'
    as _i7;
import 'package:twse_info_flutter/domain/favourite/get_favourite.dart' as _i5;

import 'company_detail_view_model_test.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GetFavouriteTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetFavouriteTest extends _i1.Mock implements _i2.GetFavouriteTest {
  MockGetFavouriteTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.CompanyDto?> call({required _i5.GetFavouriteParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i3.Future<_i4.CompanyDto?>.value(),
      ) as _i3.Future<_i4.CompanyDto?>);
}

/// A class which mocks [AddFavouriteTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddFavouriteTest extends _i1.Mock implements _i2.AddFavouriteTest {
  MockAddFavouriteTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<int> call({required _i6.AddFavouriteParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
}

/// A class which mocks [DeleteFavouriteTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteFavouriteTest extends _i1.Mock
    implements _i2.DeleteFavouriteTest {
  MockDeleteFavouriteTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<int> call({required _i7.DeleteFavouriteParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
}
