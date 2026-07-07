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
    r'title': PropertySchema(
      id: 3,
      name: r'title',
      type: IsarType.object,
      target: r'LocalizedText',
    )
  },
  estimateSize: _procedureEstimateSize,
  serialize: _procedureSerialize,
  deserialize: _procedureDeserialize,
  deserializeProp: _procedureDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'LocalizedText': LocalizedTextSchema,
    r'FirstAidStep': FirstAidStepSchema
  },
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
  {
    final value = object.iconName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.steps;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FirstAidStep]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FirstAidStepSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 +
          LocalizedTextSchema.estimateSize(
              value, allOffsets[LocalizedText]!, allOffsets);
    }
  }
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
  writer.writeObject<LocalizedText>(
    offsets[3],
    allOffsets,
    LocalizedTextSchema.serialize,
    object.title,
  );
}

Procedure _procedureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Procedure();
  object.iconName = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.severityLevel = reader.readLongOrNull(offsets[1]);
  object.steps = reader.readObjectList<FirstAidStep>(
    offsets[2],
    FirstAidStepSchema.deserialize,
    allOffsets,
    FirstAidStep(),
  );
  object.title = reader.readObjectOrNull<LocalizedText>(
    offsets[3],
    LocalizedTextSchema.deserialize,
    allOffsets,
  );
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
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<FirstAidStep>(
        offset,
        FirstAidStepSchema.deserialize,
        allOffsets,
        FirstAidStep(),
      )) as P;
    case 3:
      return (reader.readObjectOrNull<LocalizedText>(
        offset,
        LocalizedTextSchema.deserialize,
        allOffsets,
      )) as P;
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
}

extension ProcedureQueryFilter
    on QueryBuilder<Procedure, Procedure, QFilterCondition> {
  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iconName',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      iconNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iconName',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> iconNameEqualTo(
    String? value, {
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
    String? value, {
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
    String? value, {
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
    String? lower,
    String? upper, {
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
      severityLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'severityLevel',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      severityLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'severityLevel',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      severityLevelEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'severityLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition>
      severityLevelGreaterThan(
    int? value, {
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
    int? value, {
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
    int? lower,
    int? upper, {
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

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> stepsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'steps',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> stepsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'steps',
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

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
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

  QueryBuilder<Procedure, Procedure, QAfterFilterCondition> title(
      FilterQuery<LocalizedText> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'title');
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
}

extension ProcedureQueryProperty
    on QueryBuilder<Procedure, Procedure, QQueryProperty> {
  QueryBuilder<Procedure, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Procedure, String?, QQueryOperations> iconNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconName');
    });
  }

  QueryBuilder<Procedure, int?, QQueryOperations> severityLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'severityLevel');
    });
  }

  QueryBuilder<Procedure, List<FirstAidStep>?, QQueryOperations>
      stepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'steps');
    });
  }

  QueryBuilder<Procedure, LocalizedText?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
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
    r'instruction': PropertySchema(
      id: 1,
      name: r'instruction',
      type: IsarType.object,
      target: r'LocalizedText',
    ),
    r'stepOrder': PropertySchema(
      id: 2,
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
  {
    final value = object.imageResource;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.instruction;
    if (value != null) {
      bytesCount += 3 +
          LocalizedTextSchema.estimateSize(
              value, allOffsets[LocalizedText]!, allOffsets);
    }
  }
  return bytesCount;
}

void _firstAidStepSerialize(
  FirstAidStep object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imageResource);
  writer.writeObject<LocalizedText>(
    offsets[1],
    allOffsets,
    LocalizedTextSchema.serialize,
    object.instruction,
  );
  writer.writeLong(offsets[2], object.stepOrder);
}

FirstAidStep _firstAidStepDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FirstAidStep();
  object.imageResource = reader.readStringOrNull(offsets[0]);
  object.instruction = reader.readObjectOrNull<LocalizedText>(
    offsets[1],
    LocalizedTextSchema.deserialize,
    allOffsets,
  );
  object.stepOrder = reader.readLongOrNull(offsets[2]);
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
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<LocalizedText>(
        offset,
        LocalizedTextSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FirstAidStepQueryFilter
    on QueryBuilder<FirstAidStep, FirstAidStep, QFilterCondition> {
  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageResource',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageResource',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      imageResourceEqualTo(
    String? value, {
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
    String? value, {
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
    String? value, {
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
    String? lower,
    String? upper, {
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
      instructionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instruction',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      instructionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instruction',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      stepOrderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stepOrder',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      stepOrderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stepOrder',
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      stepOrderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stepOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition>
      stepOrderGreaterThan(
    int? value, {
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
    int? value, {
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
    int? lower,
    int? upper, {
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
    on QueryBuilder<FirstAidStep, FirstAidStep, QFilterCondition> {
  QueryBuilder<FirstAidStep, FirstAidStep, QAfterFilterCondition> instruction(
      FilterQuery<LocalizedText> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'instruction');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LocalizedTextSchema = Schema(
  name: r'LocalizedText',
  id: -3704307675503032859,
  properties: {
    r'en': PropertySchema(
      id: 0,
      name: r'en',
      type: IsarType.string,
    ),
    r'so': PropertySchema(
      id: 1,
      name: r'so',
      type: IsarType.string,
    ),
    r'sw': PropertySchema(
      id: 2,
      name: r'sw',
      type: IsarType.string,
    )
  },
  estimateSize: _localizedTextEstimateSize,
  serialize: _localizedTextSerialize,
  deserialize: _localizedTextDeserialize,
  deserializeProp: _localizedTextDeserializeProp,
);

int _localizedTextEstimateSize(
  LocalizedText object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.en;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.so;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sw;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _localizedTextSerialize(
  LocalizedText object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.en);
  writer.writeString(offsets[1], object.so);
  writer.writeString(offsets[2], object.sw);
}

LocalizedText _localizedTextDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalizedText();
  object.en = reader.readStringOrNull(offsets[0]);
  object.so = reader.readStringOrNull(offsets[1]);
  object.sw = reader.readStringOrNull(offsets[2]);
  return object;
}

P _localizedTextDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LocalizedTextQueryFilter
    on QueryBuilder<LocalizedText, LocalizedText, QFilterCondition> {
  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> enIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'en',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      enIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'en',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> enEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      enGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> enLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> enBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'en',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      enStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> enEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> enContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> enMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'en',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      enIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'en',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      enIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'en',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> soIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'so',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      soIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'so',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> soEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'so',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      soGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'so',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> soLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'so',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> soBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'so',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      soStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'so',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> soEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'so',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> soContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'so',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> soMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'so',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      soIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'so',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      soIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'so',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> swIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sw',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      swIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sw',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> swEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      swGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> swLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> swBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sw',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      swStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> swEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> swContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition> swMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sw',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      swIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sw',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalizedText, LocalizedText, QAfterFilterCondition>
      swIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sw',
        value: '',
      ));
    });
  }
}

extension LocalizedTextQueryObject
    on QueryBuilder<LocalizedText, LocalizedText, QFilterCondition> {}
