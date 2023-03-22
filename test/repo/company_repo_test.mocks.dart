// Mocks generated by Mockito 5.3.2 from annotations
// in twse_info_flutter/test/repo/company_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:twse_info_flutter/data/model/dto/company_dto.dart' as _i4;
import 'package:twse_info_flutter/data/remote/data_state.dart' as _i2;

import 'company_repo_test.dart' as _i3;

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

class _FakeDataState_0<T> extends _i1.SmartFake implements _i2.DataState<T> {
  _FakeDataState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CompanyRepoTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockCompanyRepoTest extends _i1.Mock implements _i3.CompanyRepoTest {
  MockCompanyRepoTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set companyMap(Map<String, _i4.CompanyDto>? _companyMap) =>
      super.noSuchMethod(
        Invocation.setter(
          #companyMap,
          _companyMap,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set industryMap(Map<String, List<_i4.CompanyDto>>? _industryMap) =>
      super.noSuchMethod(
        Invocation.setter(
          #industryMap,
          _industryMap,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<_i2.DataState<Map<String, List<_i4.CompanyDto>>>> fetchData() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchData,
          [],
        ),
        returnValue:
            _i5.Future<_i2.DataState<Map<String, List<_i4.CompanyDto>>>>.value(
                _FakeDataState_0<Map<String, List<_i4.CompanyDto>>>(
          this,
          Invocation.method(
            #fetchData,
            [],
          ),
        )),
      ) as _i5.Future<_i2.DataState<Map<String, List<_i4.CompanyDto>>>>);
  @override
  _i5.Future<_i2.DataState<_i4.CompanyDto>> getCompany(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCompany,
          [id],
        ),
        returnValue: _i5.Future<_i2.DataState<_i4.CompanyDto>>.value(
            _FakeDataState_0<_i4.CompanyDto>(
          this,
          Invocation.method(
            #getCompany,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.DataState<_i4.CompanyDto>>);
}
