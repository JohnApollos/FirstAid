// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProcedureCollection on Isar {
  IsarCollection<Procedure> get procedures => this.collection();
}

const ProcedureSchema = CollectionSchema(
  name: r'Procedure',
  id: 1792391547608497503,
  properties: {
    r'iconName': PropertySchema(
      id: 0,
      name: r'iconName',
      type: IsarType.string,
    ),
    r'severityLevel': PropertySchema(
      id: 1,
      name: r'severityLevel',
      type: IsarType.long,
    ),
    r'steps': PropertySchema(
      id: 2,
      name: r'steps',
      type: IsarType.objectList,
      target: r'FirstAidStep',
    ),
    r'titleEn': PropertySchema(
      id: 3,
      name: r'titleEn',
      type: IsarType.string,
    ),
    r'titleSw': PropertySchema(
      id: 4,
      name: r'titleSw',
      type: IsarType.string,
    )
  },
  estimateSize: _procedureEstimateSize,
  serialize: _procedureSerialize,
  deserialize: _procedureDeserialize,
  deserializeProp: _procedureDeserializeProp,
  idName: r'id',
  indexes: {
    r'titleEn': IndexSchema(
      id: -2091063282091232382,
      name: r'titleEn',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'titleEn',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'titleSw': IndexSchema(
      id: 7300015692631919592,
      name: r'titleSw',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'titleSw',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'FirstAidStep': FirstAidStepSchema},
  getId: _procedureGetId,
  getLinks: _procedureGetLinks,
  attach: _procedureAttach,
  version: '3.1.0+1',
);

int _procedureEstimateSize(
  Procedure object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.iconName.length * 3;
  bytesCount += 3 + object.steps.length * 3;
  {
    final offsets = allOffsets[FirstAidStep]!;
    for (var i = 0; i < object.steps.length; i++) {
      final value = object.steps[i];
      bytesCount += FirstAidStepSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.titleEn.length * 3;
  bytesCount += 3 + object.titleSw.length * 3;
  return bytesCount;
}

void _procedureSerialize(
  Procedure object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.iconName);
  writer.writeLong(offsets[1], object.severityLevel);
  writer.writeObjectList<FirstAidStep>(
    offsets[2],
    allOffsets,
    FirstAidStepSchema.serialize,
    object.steps,
  );
  writer.writeString(offsets[3], object.titleEn);
  writer.writeString(offsets[4], object.titleSw);
}

Procedure _procedureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Procedure();
  object.iconName = reader.readString(offsets[0]);
  object.id = id;
  object.severityLevel = reader.readLong(offsets[1]);
  object.steps = reader.readObjectList<FirstAidStep>(
        offsets[2],
        FirstAidStepSchema.deserialize,
        allOffsets,
        FirstAidStep(),
      ) ??
      [];
  object.titleEn = reader.readString(offsets[3]);
  object.titleSw = reader.readString(offsets[4]);
  return object;
}

P _procedureDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readObjectList<FirstAidStep>(
            offset,
            FirstAidStepSchema.deserialize,
            allOffsets,
            FirstAidStep(),
          ) ??
          []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _procedureGetId(Procedure object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _procedureGetLinks(Procedure object) {
  return [];
}

void _procedureAttach(IsarCollection<dynamic> col, Id id, Procedure object) {
  object.id = id;
}

extension ProcedureQueryWhereSort
    on QueryBuilder<Procedure, Procedure, QWhere> {
  QueryBuilder<Procedure, Procedure, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhere> anyTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'titleEn'),
      );
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhere> anyTitleSw() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'titleSw'),
      );
    });
  }
}

extension ProcedureQueryWhere
    on QueryBuilder<Procedure, Procedure, QWhereClause> {
  QueryBuilder<Procedure, Procedure, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> idBetween(
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

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleEnEqualTo(
      String titleEn) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'titleEn',
        value: [titleEn],
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleEnNotEqualTo(
      String titleEn) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleEn',
              lower: [],
              upper: [titleEn],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleEn',
              lower: [titleEn],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleEn',
              lower: [titleEn],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleEn',
              lower: [],
              upper: [titleEn],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleEnGreaterThan(
    String titleEn, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleEn',
        lower: [titleEn],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleEnLessThan(
    String titleEn, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleEn',
        lower: [],
        upper: [titleEn],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleEnBetween(
    String lowerTitleEn,
    String upperTitleEn, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleEn',
        lower: [lowerTitleEn],
        includeLower: includeLower,
        upper: [upperTitleEn],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleEnStartsWith(
      String TitleEnPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleEn',
        lower: [TitleEnPrefix],
        upper: ['$TitleEnPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'titleEn',
        value: [''],
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'titleEn',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'titleEn',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'titleEn',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'titleEn',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleSwEqualTo(
      String titleSw) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'titleSw',
        value: [titleSw],
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleSwNotEqualTo(
      String titleSw) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleSw',
              lower: [],
              upper: [titleSw],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleSw',
              lower: [titleSw],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleSw',
              lower: [titleSw],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleSw',
              lower: [],
              upper: [titleSw],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleSwGreaterThan(
    String titleSw, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleSw',
        lower: [titleSw],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleSwLessThan(
    String titleSw, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleSw',
        lower: [],
        upper: [titleSw],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleSwBetween(
    String lowerTitleSw,
    String upperTitleSw, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleSw',
        lower: [lowerTitleSw],
        includeLower: includeLower,
        upper: [upperTitleSw],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleSwStartsWith(
      String TitleSwPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleSw',
        lower: [TitleSwPrefix],
        upper: ['$TitleSwPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleSwIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'titleSw',
        value: [''],
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterWhereClause> titleSwIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'titleSw',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'titleSw',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'titleSw',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'titleSw',
              upper: [''],
            ));
      }
    });
  }
}

extension ProcedureQueryFilter
    on QueryBuilder<Procedure, Procedure, QFilterCondition> {
  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconName',
        value: '',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      iconNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconName',
        value: '',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      severityLevelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'severityLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      severityLevelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'severityLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      severityLevelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'severityLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      severityLevelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'severityLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> stepsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> stepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> stepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> stepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      stepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> stepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleEnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleEn',
        value: '',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      titleEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleEn',
        value: '',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleSwEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleSwGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleSwLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleSwBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleSw',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleSwStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleSwEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleSwContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleSwMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleSw',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleSwIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleSw',
        value: '',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      titleSwIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleSw',
        value: '',
      ));
    });
  }
}

extension ProcedureQueryObject
    on QueryBuilder<Procedure, Procedure, QFilterCondition> {
  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> stepsElement(
      FilterQuery<FirstAidStep> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'steps');
    });
  }
}

extension ProcedureQueryLinks
    on QueryBuilder<Procedure, Procedure, QFilterCondition> {}

extension ProcedureQuerySortBy on QueryBuilder<Procedure, Procedure, QSortBy> {
  QueryBuilder<Procedure, Procedure, QAfterSortBy> sortByIconName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconName', Sort.asc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> sortByIconNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconName', Sort.desc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> sortBySeverityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityLevel', Sort.asc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> sortBySeverityLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityLevel', Sort.desc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> sortByTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.asc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> sortByTitleEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.desc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> sortByTitleSw() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleSw', Sort.asc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> sortByTitleSwDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleSw', Sort.desc);
    });
  }
}

extension ProcedureQuerySortThenBy
    on QueryBuilder<Procedure, Procedure, QSortThenBy> {
  QueryBuilder<Procedure, Procedure, QAfterSortBy> thenByIconName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconName', Sort.asc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> thenByIconNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconName', Sort.desc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> thenBySeverityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityLevel', Sort.asc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> thenBySeverityLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityLevel', Sort.desc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> thenByTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.asc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> thenByTitleEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.desc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> thenByTitleSw() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleSw', Sort.asc);
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterSortBy> thenByTitleSwDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleSw', Sort.desc);
    });
  }
}

extension ProcedureQueryWhereDistinct
    on QueryBuilder<Procedure, Procedure, QDistinct> {
  QueryBuilder<Procedure, Procedure, QDistinct> distinctByIconName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Procedure, Procedure, QDistinct> distinctBySeverityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'severityLevel');
    });
  }

  QueryBuilder<Procedure, Procedure, QDistinct> distinctByTitleEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Procedure, Procedure, QDistinct> distinctByTitleSw(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleSw', caseSensitive: caseSensitive);
    });
  }
}

extension ProcedureQueryProperty
    on QueryBuilder<Procedure, Procedure, QQueryProperty> {
  QueryBuilder<Procedure, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Procedure, String, QQueryOperations> iconNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconName');
    });
  }

  QueryBuilder<Procedure, int, QQueryOperations> severityLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'severityLevel');
    });
  }

  QueryBuilder<Procedure, List<FirstAidStep>, QQueryOperations>
      stepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'steps');
    });
  }

  QueryBuilder<Procedure, String, QQueryOperations> titleEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleEn');
    });
  }

  QueryBuilder<Procedure, String, QQueryOperations> titleSwProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleSw');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FirstAidStepSchema = Schema(
  name: r'FirstAidStep',
  id: -2571872961126680279,
  properties: {
    r'imageResource': PropertySchema(
      id: 0,
      name: r'imageResource',
      type: IsarType.string,
    ),
    r'instructionEn': PropertySchema(
      id: 1,
      name: r'instructionEn',
      type: IsarType.string,
    ),
    r'instructionSw': PropertySchema(
      id: 2,
      name: r'instructionSw',
      type: IsarType.string,
    ),
    r'stepOrder': PropertySchema(
      id: 3,
      name: r'stepOrder',
      type: IsarType.long,
    )
  },
  estimateSize: _firstAidStepEstimateSize,
  serialize: _firstAidStepSerialize,
  deserialize: _firstAidStepDeserialize,
  deserializeProp: _firstAidStepDeserializeProp,
);

int _firstAidStepEstimateSize(
  FirstAidStep object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imageResource.length * 3;
  bytesCount += 3 + object.instructionEn.length * 3;
  bytesCount += 3 + object.instructionSw.length * 3;
  return bytesCount;
}

void _firstAidStepSerialize(
  FirstAidStep object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imageResource);
  writer.writeString(offsets[1], object.instructionEn);
  writer.writeString(offsets[2], object.instructionSw);
  writer.writeLong(offsets[3], object.stepOrder);
}

FirstAidStep _firstAidStepDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FirstAidStep();
  object.imageResource = reader.readString(offsets[0]);
  object.instructionEn = reader.readString(offsets[1]);
  object.instructionSw = reader.readString(offsets[2]);
  object.stepOrder = reader.readLong(offsets[3]);
  return object;
}

P _firstAidStepDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FirstAidStepQueryFilter
    on QueryBuilder<FirstAidStep, FirstAidStep, QFilterCondition> {
  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageResource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageResource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageResource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageResource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageResource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageResource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageResource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageResource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageResource',
        value: '',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageResource',
        value: '',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instructionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instructionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instructionEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instructionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instructionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instructionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instructionEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructionEn',
        value: '',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instructionEn',
        value: '',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionSwEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionSwGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instructionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionSwLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instructionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionSwBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instructionSw',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionSwStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instructionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionSwEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instructionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionSwContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instructionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionSwMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instructionSw',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionSwIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructionSw',
        value: '',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionSwIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instructionSw',
        value: '',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      stepOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stepOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      stepOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stepOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      stepOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stepOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      stepOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stepOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FirstAidStepQueryObject
    on QueryBuilder<FirstAidStep, FirstAidStep, QFilterCondition> {}
