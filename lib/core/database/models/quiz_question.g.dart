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
    r'explanationEn': PropertySchema(
      id: 1,
      name: r'explanationEn',
      type: IsarType.string,
    ),
    r'explanationSw': PropertySchema(
      id: 2,
      name: r'explanationSw',
      type: IsarType.string,
    ),
    r'optionsEn': PropertySchema(
      id: 3,
      name: r'optionsEn',
      type: IsarType.stringList,
    ),
    r'optionsSw': PropertySchema(
      id: 4,
      name: r'optionsSw',
      type: IsarType.stringList,
    ),
    r'questionEn': PropertySchema(
      id: 5,
      name: r'questionEn',
      type: IsarType.string,
    ),
    r'questionSw': PropertySchema(
      id: 6,
      name: r'questionSw',
      type: IsarType.string,
    )
  },
  estimateSize: _quizQuestionEstimateSize,
  serialize: _quizQuestionSerialize,
  deserialize: _quizQuestionDeserialize,
  deserializeProp: _quizQuestionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
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
  bytesCount += 3 + object.explanationEn.length * 3;
  bytesCount += 3 + object.explanationSw.length * 3;
  bytesCount += 3 + object.optionsEn.length * 3;
  {
    for (var i = 0; i < object.optionsEn.length; i++) {
      final value = object.optionsEn[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.optionsSw.length * 3;
  {
    for (var i = 0; i < object.optionsSw.length; i++) {
      final value = object.optionsSw[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.questionEn.length * 3;
  bytesCount += 3 + object.questionSw.length * 3;
  return bytesCount;
}

void _quizQuestionSerialize(
  QuizQuestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.correctOptionIndex);
  writer.writeString(offsets[1], object.explanationEn);
  writer.writeString(offsets[2], object.explanationSw);
  writer.writeStringList(offsets[3], object.optionsEn);
  writer.writeStringList(offsets[4], object.optionsSw);
  writer.writeString(offsets[5], object.questionEn);
  writer.writeString(offsets[6], object.questionSw);
}

QuizQuestion _quizQuestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuizQuestion();
  object.correctOptionIndex = reader.readLong(offsets[0]);
  object.explanationEn = reader.readString(offsets[1]);
  object.explanationSw = reader.readString(offsets[2]);
  object.id = id;
  object.optionsEn = reader.readStringList(offsets[3]) ?? [];
  object.optionsSw = reader.readStringList(offsets[4]) ?? [];
  object.questionEn = reader.readString(offsets[5]);
  object.questionSw = reader.readString(offsets[6]);
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
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
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
      correctOptionIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctOptionIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      correctOptionIndexGreaterThan(
    int value, {
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
    int value, {
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
    int lower,
    int upper, {
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
      explanationEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explanationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'explanationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'explanationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'explanationEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'explanationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'explanationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'explanationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'explanationEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explanationEn',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'explanationEn',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationSwEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explanationSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationSwGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'explanationSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationSwLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'explanationSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationSwBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'explanationSw',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationSwStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'explanationSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationSwEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'explanationSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationSwContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'explanationSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationSwMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'explanationSw',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationSwIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explanationSw',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      explanationSwIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'explanationSw',
        value: '',
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
      questionEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionEn',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionEn',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionSwEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionSwGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionSwLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionSwBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionSw',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionSwStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionSwEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionSwContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionSw',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionSwMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionSw',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionSwIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionSw',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterFilterCondition>
      questionSwIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionSw',
        value: '',
      ));
    });
  }
}

extension QuizQuestionQueryObject
    on QueryBuilder<QuizQuestion, QuizQuestion, QFilterCondition> {}

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

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy> sortByExplanationEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanationEn', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      sortByExplanationEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanationEn', Sort.desc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy> sortByExplanationSw() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanationSw', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      sortByExplanationSwDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanationSw', Sort.desc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy> sortByQuestionEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionEn', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      sortByQuestionEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionEn', Sort.desc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy> sortByQuestionSw() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionSw', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      sortByQuestionSwDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionSw', Sort.desc);
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

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy> thenByExplanationEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanationEn', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      thenByExplanationEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanationEn', Sort.desc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy> thenByExplanationSw() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanationSw', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      thenByExplanationSwDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanationSw', Sort.desc);
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

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy> thenByQuestionEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionEn', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      thenByQuestionEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionEn', Sort.desc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy> thenByQuestionSw() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionSw', Sort.asc);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QAfterSortBy>
      thenByQuestionSwDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionSw', Sort.desc);
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

  QueryBuilder<QuizQuestion, QuizQuestion, QDistinct> distinctByExplanationEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explanationEn',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QDistinct> distinctByExplanationSw(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explanationSw',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QDistinct> distinctByOptionsEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'optionsEn');
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QDistinct> distinctByOptionsSw() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'optionsSw');
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QDistinct> distinctByQuestionEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizQuestion, QuizQuestion, QDistinct> distinctByQuestionSw(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionSw', caseSensitive: caseSensitive);
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

  QueryBuilder<QuizQuestion, int, QQueryOperations>
      correctOptionIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctOptionIndex');
    });
  }

  QueryBuilder<QuizQuestion, String, QQueryOperations> explanationEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explanationEn');
    });
  }

  QueryBuilder<QuizQuestion, String, QQueryOperations> explanationSwProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explanationSw');
    });
  }

  QueryBuilder<QuizQuestion, List<String>, QQueryOperations>
      optionsEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'optionsEn');
    });
  }

  QueryBuilder<QuizQuestion, List<String>, QQueryOperations>
      optionsSwProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'optionsSw');
    });
  }

  QueryBuilder<QuizQuestion, String, QQueryOperations> questionEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionEn');
    });
  }

  QueryBuilder<QuizQuestion, String, QQueryOperations> questionSwProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionSw');
    });
  }
}
