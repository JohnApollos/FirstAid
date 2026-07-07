// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuizQuestionCollection on Isar {
  IsarCollection<QuizQuestion> get quizQuestions => this.collection();
}

const QuizQuestionSchema = CollectionSchema(
  name: r'QuizQuestion',
  id: 6768406734576234344,
  properties: {
    r'correctOptionIndex': PropertySchema(
      id: 0,
      name: r'correctOptionIndex',
      type: IsarType.long,
    ),
    r'explanation': PropertySchema(
      id: 1,
      name: r'explanation',
      type: IsarType.object,
      target: r'LocalizedText',
    ),
    r'optionsEn': PropertySchema(
      id: 2,
      name: r'optionsEn',
      type: IsarType.stringList,
    ),
    r'optionsSo': PropertySchema(
      id: 3,
      name: r'optionsSo',
      type: IsarType.stringList,
    ),
    r'optionsSw': PropertySchema(
      id: 4,
      name: r'optionsSw',
      type: IsarType.stringList,
    ),
    r'question': PropertySchema(
      id: 5,
      name: r'question',
      type: IsarType.object,
      target: r'LocalizedText',
    )
  },
  estimateSize: _quizQuestionEstimateSize,
  serialize: _quizQuestionSerialize,
  deserialize: _quizQuestionDeserialize,
  deserializeProp: _quizQuestionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'LocalizedText': LocalizedTextSchema},
  getId: _quizQuestionGetId,
  getLinks: _quizQuestionGetLinks,
  attach: _quizQuestionAttach,
  version: '3.1.0+1',
);

int _quizQuestionEstimateSize(
  QuizQuestion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.explanation;
    if (value != null) {
      bytesCount += 3 +
          LocalizedTextSchema.estimateSize(
              value, allOffsets[LocalizedText]!, allOffsets);
    }
  }
  {
    final list = object.optionsEn;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.optionsSo;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.optionsSw;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.question;
    if (value != null) {
      bytesCount += 3 +
          LocalizedTextSchema.estimateSize(
              value, allOffsets[LocalizedText]!, allOffsets);
    }
  }
  return bytesCount;
}

void _quizQuestionSerialize(
  QuizQuestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.correctOptionIndex);
  writer.writeObject<LocalizedText>(
    offsets[1],
    allOffsets,
    LocalizedTextSchema.serialize,
    object.explanation,
  );
  writer.writeStringList(offsets[2], object.optionsEn);
  writer.writeStringList(offsets[3], object.optionsSo);
  writer.writeStringList(offsets[4], object.optionsSw);
  writer.writeObject<LocalizedText>(
    offsets[5],
    allOffsets,
    LocalizedTextSchema.serialize,
    object.question,
  );
}

QuizQuestion _quizQuestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuizQuestion();
  object.correctOptionIndex = reader.readLongOrNull(offsets[0]);
  object.explanation = reader.readObjectOrNull<LocalizedText>(
    offsets[1],
    LocalizedTextSchema.deserialize,
    allOffsets,
  );
  object.id = id;
  object.optionsEn = reader.readStringList(offsets[2]);
  object.optionsSo = reader.readStringList(offsets[3]);
  object.optionsSw = reader.readStringList(offsets[4]);
  object.question = reader.readObjectOrNull<LocalizedText>(
    offsets[5],
    LocalizedTextSchema.deserialize,
    allOffsets,
  );
  return object;
}

P _quizQuestionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<LocalizedText>(
        offset,
        LocalizedTextSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readStringList(offset)) as P;
    case 3:
      return (reader.readStringList(offset)) as P;
    case 4:
      return (reader.readStringList(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<LocalizedText>(
        offset,
        LocalizedTextSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _quizQuestionGetId(QuizQuestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quizQuestionGetLinks(QuizQuestion object) {
  return [];
}

void _quizQuestionAttach(
    IsarCollection<dynamic> col, Id id, QuizQuestion object) {
  object.id = id;
}

extension QuizQuestionQueryWhereSort
    on QueryBuilder<QuizQuestion, QuizQuestion, QWhere> {
  QueryBuilder<QuizQuestion, QuizQuestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuizQuestionQueryWhere
    on QueryBuilder<QuizQuestion, QuizQuestion, QWhereClause> {
  QueryBuilder<QuizQuestion, QuizQuestion, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterWhereClause> idBetween(
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

extension QuizQuestionQueryFilter
    on QueryBuilder<QuizQuestion, QuizQuestion, QFilterCondition> {
  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      correctOptionIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correctOptionIndex',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      correctOptionIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correctOptionIndex',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      correctOptionIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctOptionIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      correctOptionIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctOptionIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      correctOptionIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctOptionIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      correctOptionIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctOptionIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'explanation',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'explanation',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition> idBetween(
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

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'optionsEn',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'optionsEn',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'optionsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'optionsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'optionsEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'optionsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'optionsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'optionsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'optionsEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionsEn',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'optionsEn',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsEn',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsEn',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsEn',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsEn',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsEn',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsEnLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsEn',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'optionsSo',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'optionsSo',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionsSo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'optionsSo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'optionsSo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'optionsSo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'optionsSo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'optionsSo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'optionsSo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'optionsSo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionsSo',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'optionsSo',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSo',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSo',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSo',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSo',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSo',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSoLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSo',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'optionsSw',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'optionsSw',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionsSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'optionsSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'optionsSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'optionsSw',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'optionsSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'optionsSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'optionsSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'optionsSw',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionsSw',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'optionsSw',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSw',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSw',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSw',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSw',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSw',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      optionsSwLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionsSw',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'question',
      ));
    });
  }
}

extension QuizQuestionQueryObject
    on QueryBuilder<QuizQuestion, QuizQuestion, QFilterCondition> {
  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition> explanation(
      FilterQuery<LocalizedText> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'explanation');
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition> question(
      FilterQuery<LocalizedText> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'question');
    });
  }
}

extension QuizQuestionQueryLinks
    on QueryBuilder<QuizQuestion, QuizQuestion, QFilterCondition> {}

extension QuizQuestionQuerySortBy
    on QueryBuilder<QuizQuestion, QuizQuestion, QSortBy> {
  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      sortByCorrectOptionIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctOptionIndex', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      sortByCorrectOptionIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctOptionIndex', Sort.desc);
    });
  }
}

extension QuizQuestionQuerySortThenBy
    on QueryBuilder<QuizQuestion, QuizQuestion, QSortThenBy> {
  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      thenByCorrectOptionIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctOptionIndex', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      thenByCorrectOptionIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctOptionIndex', Sort.desc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension QuizQuestionQueryWhereDistinct
    on QueryBuilder<QuizQuestion, QuizQuestion, QDistinct> {
  QueryBuilder<QuizQuestion, QuizQuestion, QDistinct>
      distinctByCorrectOptionIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctOptionIndex');
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QDistinct> distinctByOptionsEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'optionsEn');
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QDistinct> distinctByOptionsSo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'optionsSo');
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QDistinct> distinctByOptionsSw() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'optionsSw');
    });
  }
}

extension QuizQuestionQueryProperty
    on QueryBuilder<QuizQuestion, QuizQuestion, QQueryProperty> {
  QueryBuilder<QuizQuestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuizQuestion, int?, QQueryOperations>
      correctOptionIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctOptionIndex');
    });
  }

  QueryBuilder<QuizQuestion, LocalizedText?, QQueryOperations>
      explanationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explanation');
    });
  }

  QueryBuilder<QuizQuestion, List<String>?, QQueryOperations>
      optionsEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'optionsEn');
    });
  }

  QueryBuilder<QuizQuestion, List<String>?, QQueryOperations>
      optionsSoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'optionsSo');
    });
  }

  QueryBuilder<QuizQuestion, List<String>?, QQueryOperations>
      optionsSwProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'optionsSw');
    });
  }

  QueryBuilder<QuizQuestion, LocalizedText?, QQueryOperations>
      questionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'question');
    });
  }
}
