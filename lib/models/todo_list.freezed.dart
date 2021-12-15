// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoList _$TodoListFromJson(Map<String, dynamic> json) {
  return _TodoList.fromJson(json);
}

/// @nodoc
class _$TodoListTearOff {
  const _$TodoListTearOff();

  _TodoList call({String? id, required String title}) {
    return _TodoList(
      id: id,
      title: title,
    );
  }

  TodoList fromJson(Map<String, Object?> json) {
    return TodoList.fromJson(json);
  }
}

/// @nodoc
const $TodoList = _$TodoListTearOff();

/// @nodoc
mixin _$TodoList {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoListCopyWith<TodoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListCopyWith<$Res> {
  factory $TodoListCopyWith(TodoList value, $Res Function(TodoList) then) =
      _$TodoListCopyWithImpl<$Res>;
  $Res call({String? id, String title});
}

/// @nodoc
class _$TodoListCopyWithImpl<$Res> implements $TodoListCopyWith<$Res> {
  _$TodoListCopyWithImpl(this._value, this._then);

  final TodoList _value;
  // ignore: unused_field
  final $Res Function(TodoList) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TodoListCopyWith<$Res> implements $TodoListCopyWith<$Res> {
  factory _$TodoListCopyWith(_TodoList value, $Res Function(_TodoList) then) =
      __$TodoListCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String title});
}

/// @nodoc
class __$TodoListCopyWithImpl<$Res> extends _$TodoListCopyWithImpl<$Res>
    implements _$TodoListCopyWith<$Res> {
  __$TodoListCopyWithImpl(_TodoList _value, $Res Function(_TodoList) _then)
      : super(_value, (v) => _then(v as _TodoList));

  @override
  _TodoList get _value => super._value as _TodoList;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_TodoList(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoList implements _TodoList {
  const _$_TodoList({this.id, required this.title});

  factory _$_TodoList.fromJson(Map<String, dynamic> json) =>
      _$$_TodoListFromJson(json);

  @override
  final String? id;
  @override
  final String title;

  @override
  String toString() {
    return 'TodoList(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoList &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$TodoListCopyWith<_TodoList> get copyWith =>
      __$TodoListCopyWithImpl<_TodoList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoListToJson(this);
  }
}

abstract class _TodoList implements TodoList {
  const factory _TodoList({String? id, required String title}) = _$_TodoList;

  factory _TodoList.fromJson(Map<String, dynamic> json) = _$_TodoList.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$TodoListCopyWith<_TodoList> get copyWith =>
      throw _privateConstructorUsedError;
}
