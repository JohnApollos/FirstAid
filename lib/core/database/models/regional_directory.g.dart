// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regional_directory.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRegionalOfficeCollection on Isar {
  IsarCollection<RegionalOffice> get regionalOffices => this.collection();
}

const RegionalOfficeSchema = CollectionSchema(
  name: r'RegionalOffice',
  id: -5818876334561918376,
  properties: {
    r'contactPhone': PropertySchema(
      id: 0,
      name: r'contactPhone',
      type: IsarType.string,
    ),
    r'countyName': PropertySchema(
      id: 1,
      name: r'countyName',
      type: IsarType.string,
    ),
    r'locationName': PropertySchema(
      id: 2,
      name: r'locationName',
      type: IsarType.string,
    ),
    r'regionName': PropertySchema(
      id: 3,
      name: r'regionName',
      type: IsarType.string,
    )
  },
  estimateSize: _regionalOfficeEstimateSize,
  serialize: _regionalOfficeSerialize,
  deserialize: _regionalOfficeDeserialize,
  deserializeProp: _regionalOfficeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _regionalOfficeGetId,
  getLinks: _regionalOfficeGetLinks,
  attach: _regionalOfficeAttach,
  version: '3.1.0+1',
);

int _regionalOfficeEstimateSize(
  RegionalOffice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contactPhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.countyName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locationName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.regionName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _regionalOfficeSerialize(
  RegionalOffice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.contactPhone);
  writer.writeString(offsets[1], object.countyName);
  writer.writeString(offsets[2], object.locationName);
  writer.writeString(offsets[3], object.regionName);
}

RegionalOffice _regionalOfficeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegionalOffice();
  object.contactPhone = reader.readStringOrNull(offsets[0]);
  object.countyName = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.locationName = reader.readStringOrNull(offsets[2]);
  object.regionName = reader.readStringOrNull(offsets[3]);
  return object;
}

P _regionalOfficeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _regionalOfficeGetId(RegionalOffice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _regionalOfficeGetLinks(RegionalOffice object) {
  return [];
}

void _regionalOfficeAttach(
    IsarCollection<dynamic> col, Id id, RegionalOffice object) {
  object.id = id;
}

extension RegionalOfficeQueryWhereSort
    on QueryBuilder<RegionalOffice, RegionalOffice, QWhere> {
  QueryBuilder<RegionalOffice, RegionalOffice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RegionalOfficeQueryWhere
    on QueryBuilder<RegionalOffice, RegionalOffice, QWhereClause> {
  QueryBuilder<RegionalOffice, RegionalOffice, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RegionalOfficeQueryFilter
    on QueryBuilder<RegionalOffice, RegionalOffice, QFilterCondition> {
  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactPhone',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactPhone',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      contactPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'countyName',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'countyName',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'countyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countyName',
        value: '',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      countyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'countyName',
        value: '',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationName',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationName',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationName',
        value: '',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      locationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationName',
        value: '',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionName',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionName',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'regionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'regionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionName',
        value: '',
      ));
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterFilterCondition>
      regionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'regionName',
        value: '',
      ));
    });
  }
}

extension RegionalOfficeQueryObject
    on QueryBuilder<RegionalOffice, RegionalOffice, QFilterCondition> {}

extension RegionalOfficeQueryLinks
    on QueryBuilder<RegionalOffice, RegionalOffice, QFilterCondition> {}

extension RegionalOfficeQuerySortBy
    on QueryBuilder<RegionalOffice, RegionalOffice, QSortBy> {
  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      sortByContactPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.asc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      sortByContactPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.desc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      sortByCountyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countyName', Sort.asc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      sortByCountyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countyName', Sort.desc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      sortByLocationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.asc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      sortByLocationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.desc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      sortByRegionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionName', Sort.asc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      sortByRegionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionName', Sort.desc);
    });
  }
}

extension RegionalOfficeQuerySortThenBy
    on QueryBuilder<RegionalOffice, RegionalOffice, QSortThenBy> {
  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      thenByContactPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.asc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      thenByContactPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.desc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      thenByCountyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countyName', Sort.asc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      thenByCountyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countyName', Sort.desc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      thenByLocationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.asc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      thenByLocationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.desc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      thenByRegionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionName', Sort.asc);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QAfterSortBy>
      thenByRegionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionName', Sort.desc);
    });
  }
}

extension RegionalOfficeQueryWhereDistinct
    on QueryBuilder<RegionalOffice, RegionalOffice, QDistinct> {
  QueryBuilder<RegionalOffice, RegionalOffice, QDistinct>
      distinctByContactPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactPhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QDistinct> distinctByCountyName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countyName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QDistinct>
      distinctByLocationName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegionalOffice, RegionalOffice, QDistinct> distinctByRegionName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionName', caseSensitive: caseSensitive);
    });
  }
}

extension RegionalOfficeQueryProperty
    on QueryBuilder<RegionalOffice, RegionalOffice, QQueryProperty> {
  QueryBuilder<RegionalOffice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RegionalOffice, String?, QQueryOperations>
      contactPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactPhone');
    });
  }

  QueryBuilder<RegionalOffice, String?, QQueryOperations> countyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countyName');
    });
  }

  QueryBuilder<RegionalOffice, String?, QQueryOperations>
      locationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationName');
    });
  }

  QueryBuilder<RegionalOffice, String?, QQueryOperations> regionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionName');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReferralHospitalCollection on Isar {
  IsarCollection<ReferralHospital> get referralHospitals => this.collection();
}

const ReferralHospitalSchema = CollectionSchema(
  name: r'ReferralHospital',
  id: -4795413090523038252,
  properties: {
    r'capabilityTier': PropertySchema(
      id: 0,
      name: r'capabilityTier',
      type: IsarType.string,
    ),
    r'contactPhone': PropertySchema(
      id: 1,
      name: r'contactPhone',
      type: IsarType.string,
    ),
    r'countyName': PropertySchema(
      id: 2,
      name: r'countyName',
      type: IsarType.string,
    ),
    r'hospitalName': PropertySchema(
      id: 3,
      name: r'hospitalName',
      type: IsarType.string,
    ),
    r'regionName': PropertySchema(
      id: 4,
      name: r'regionName',
      type: IsarType.string,
    )
  },
  estimateSize: _referralHospitalEstimateSize,
  serialize: _referralHospitalSerialize,
  deserialize: _referralHospitalDeserialize,
  deserializeProp: _referralHospitalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _referralHospitalGetId,
  getLinks: _referralHospitalGetLinks,
  attach: _referralHospitalAttach,
  version: '3.1.0+1',
);

int _referralHospitalEstimateSize(
  ReferralHospital object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.capabilityTier;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contactPhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.countyName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.hospitalName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.regionName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _referralHospitalSerialize(
  ReferralHospital object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.capabilityTier);
  writer.writeString(offsets[1], object.contactPhone);
  writer.writeString(offsets[2], object.countyName);
  writer.writeString(offsets[3], object.hospitalName);
  writer.writeString(offsets[4], object.regionName);
}

ReferralHospital _referralHospitalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReferralHospital();
  object.capabilityTier = reader.readStringOrNull(offsets[0]);
  object.contactPhone = reader.readStringOrNull(offsets[1]);
  object.countyName = reader.readStringOrNull(offsets[2]);
  object.hospitalName = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.regionName = reader.readStringOrNull(offsets[4]);
  return object;
}

P _referralHospitalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _referralHospitalGetId(ReferralHospital object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _referralHospitalGetLinks(ReferralHospital object) {
  return [];
}

void _referralHospitalAttach(
    IsarCollection<dynamic> col, Id id, ReferralHospital object) {
  object.id = id;
}

extension ReferralHospitalQueryWhereSort
    on QueryBuilder<ReferralHospital, ReferralHospital, QWhere> {
  QueryBuilder<ReferralHospital, ReferralHospital, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReferralHospitalQueryWhere
    on QueryBuilder<ReferralHospital, ReferralHospital, QWhereClause> {
  QueryBuilder<ReferralHospital, ReferralHospital, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReferralHospitalQueryFilter
    on QueryBuilder<ReferralHospital, ReferralHospital, QFilterCondition> {
  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'capabilityTier',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'capabilityTier',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capabilityTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capabilityTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capabilityTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capabilityTier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'capabilityTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'capabilityTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'capabilityTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'capabilityTier',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capabilityTier',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      capabilityTierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'capabilityTier',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactPhone',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactPhone',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      contactPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'countyName',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'countyName',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'countyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'countyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countyName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      countyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'countyName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hospitalName',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hospitalName',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hospitalName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hospitalName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hospitalName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      hospitalNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hospitalName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionName',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionName',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'regionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'regionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'regionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterFilterCondition>
      regionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'regionName',
        value: '',
      ));
    });
  }
}

extension ReferralHospitalQueryObject
    on QueryBuilder<ReferralHospital, ReferralHospital, QFilterCondition> {}

extension ReferralHospitalQueryLinks
    on QueryBuilder<ReferralHospital, ReferralHospital, QFilterCondition> {}

extension ReferralHospitalQuerySortBy
    on QueryBuilder<ReferralHospital, ReferralHospital, QSortBy> {
  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      sortByCapabilityTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capabilityTier', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      sortByCapabilityTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capabilityTier', Sort.desc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      sortByContactPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      sortByContactPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.desc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      sortByCountyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countyName', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      sortByCountyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countyName', Sort.desc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      sortByHospitalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      sortByHospitalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.desc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      sortByRegionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionName', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      sortByRegionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionName', Sort.desc);
    });
  }
}

extension ReferralHospitalQuerySortThenBy
    on QueryBuilder<ReferralHospital, ReferralHospital, QSortThenBy> {
  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByCapabilityTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capabilityTier', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByCapabilityTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capabilityTier', Sort.desc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByContactPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByContactPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.desc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByCountyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countyName', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByCountyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countyName', Sort.desc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByHospitalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByHospitalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.desc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByRegionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionName', Sort.asc);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QAfterSortBy>
      thenByRegionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionName', Sort.desc);
    });
  }
}

extension ReferralHospitalQueryWhereDistinct
    on QueryBuilder<ReferralHospital, ReferralHospital, QDistinct> {
  QueryBuilder<ReferralHospital, ReferralHospital, QDistinct>
      distinctByCapabilityTier({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capabilityTier',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QDistinct>
      distinctByContactPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactPhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QDistinct>
      distinctByCountyName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countyName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QDistinct>
      distinctByHospitalName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hospitalName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReferralHospital, ReferralHospital, QDistinct>
      distinctByRegionName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionName', caseSensitive: caseSensitive);
    });
  }
}

extension ReferralHospitalQueryProperty
    on QueryBuilder<ReferralHospital, ReferralHospital, QQueryProperty> {
  QueryBuilder<ReferralHospital, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReferralHospital, String?, QQueryOperations>
      capabilityTierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capabilityTier');
    });
  }

  QueryBuilder<ReferralHospital, String?, QQueryOperations>
      contactPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactPhone');
    });
  }

  QueryBuilder<ReferralHospital, String?, QQueryOperations>
      countyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countyName');
    });
  }

  QueryBuilder<ReferralHospital, String?, QQueryOperations>
      hospitalNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hospitalName');
    });
  }

  QueryBuilder<ReferralHospital, String?, QQueryOperations>
      regionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionName');
    });
  }
}
