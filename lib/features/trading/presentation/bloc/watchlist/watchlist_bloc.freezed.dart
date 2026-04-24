// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WatchlistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadWatchlist,
    required TResult Function(int index) changeWatchlist,
    required TResult Function(int oldIndex, int newIndex) reorderStocks,
    required TResult Function(String id) deleteStock,
    required TResult Function(WatchlistSortType sortType) changeSortType,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadWatchlist,
    TResult? Function(int index)? changeWatchlist,
    TResult? Function(int oldIndex, int newIndex)? reorderStocks,
    TResult? Function(String id)? deleteStock,
    TResult? Function(WatchlistSortType sortType)? changeSortType,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadWatchlist,
    TResult Function(int index)? changeWatchlist,
    TResult Function(int oldIndex, int newIndex)? reorderStocks,
    TResult Function(String id)? deleteStock,
    TResult Function(WatchlistSortType sortType)? changeSortType,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWatchlist value) loadWatchlist,
    required TResult Function(_ChangeWatchlist value) changeWatchlist,
    required TResult Function(_ReorderStocks value) reorderStocks,
    required TResult Function(_DeleteStock value) deleteStock,
    required TResult Function(_ChangeSortType value) changeSortType,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWatchlist value)? loadWatchlist,
    TResult? Function(_ChangeWatchlist value)? changeWatchlist,
    TResult? Function(_ReorderStocks value)? reorderStocks,
    TResult? Function(_DeleteStock value)? deleteStock,
    TResult? Function(_ChangeSortType value)? changeSortType,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWatchlist value)? loadWatchlist,
    TResult Function(_ChangeWatchlist value)? changeWatchlist,
    TResult Function(_ReorderStocks value)? reorderStocks,
    TResult Function(_DeleteStock value)? deleteStock,
    TResult Function(_ChangeSortType value)? changeSortType,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistEventCopyWith<$Res> {
  factory $WatchlistEventCopyWith(
    WatchlistEvent value,
    $Res Function(WatchlistEvent) then,
  ) = _$WatchlistEventCopyWithImpl<$Res, WatchlistEvent>;
}

/// @nodoc
class _$WatchlistEventCopyWithImpl<$Res, $Val extends WatchlistEvent>
    implements $WatchlistEventCopyWith<$Res> {
  _$WatchlistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadWatchlistImplCopyWith<$Res> {
  factory _$$LoadWatchlistImplCopyWith(
    _$LoadWatchlistImpl value,
    $Res Function(_$LoadWatchlistImpl) then,
  ) = __$$LoadWatchlistImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadWatchlistImplCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$LoadWatchlistImpl>
    implements _$$LoadWatchlistImplCopyWith<$Res> {
  __$$LoadWatchlistImplCopyWithImpl(
    _$LoadWatchlistImpl _value,
    $Res Function(_$LoadWatchlistImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadWatchlistImpl implements _LoadWatchlist {
  const _$LoadWatchlistImpl();

  @override
  String toString() {
    return 'WatchlistEvent.loadWatchlist()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadWatchlistImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadWatchlist,
    required TResult Function(int index) changeWatchlist,
    required TResult Function(int oldIndex, int newIndex) reorderStocks,
    required TResult Function(String id) deleteStock,
    required TResult Function(WatchlistSortType sortType) changeSortType,
  }) {
    return loadWatchlist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadWatchlist,
    TResult? Function(int index)? changeWatchlist,
    TResult? Function(int oldIndex, int newIndex)? reorderStocks,
    TResult? Function(String id)? deleteStock,
    TResult? Function(WatchlistSortType sortType)? changeSortType,
  }) {
    return loadWatchlist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadWatchlist,
    TResult Function(int index)? changeWatchlist,
    TResult Function(int oldIndex, int newIndex)? reorderStocks,
    TResult Function(String id)? deleteStock,
    TResult Function(WatchlistSortType sortType)? changeSortType,
    required TResult orElse(),
  }) {
    if (loadWatchlist != null) {
      return loadWatchlist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWatchlist value) loadWatchlist,
    required TResult Function(_ChangeWatchlist value) changeWatchlist,
    required TResult Function(_ReorderStocks value) reorderStocks,
    required TResult Function(_DeleteStock value) deleteStock,
    required TResult Function(_ChangeSortType value) changeSortType,
  }) {
    return loadWatchlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWatchlist value)? loadWatchlist,
    TResult? Function(_ChangeWatchlist value)? changeWatchlist,
    TResult? Function(_ReorderStocks value)? reorderStocks,
    TResult? Function(_DeleteStock value)? deleteStock,
    TResult? Function(_ChangeSortType value)? changeSortType,
  }) {
    return loadWatchlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWatchlist value)? loadWatchlist,
    TResult Function(_ChangeWatchlist value)? changeWatchlist,
    TResult Function(_ReorderStocks value)? reorderStocks,
    TResult Function(_DeleteStock value)? deleteStock,
    TResult Function(_ChangeSortType value)? changeSortType,
    required TResult orElse(),
  }) {
    if (loadWatchlist != null) {
      return loadWatchlist(this);
    }
    return orElse();
  }
}

abstract class _LoadWatchlist implements WatchlistEvent {
  const factory _LoadWatchlist() = _$LoadWatchlistImpl;
}

/// @nodoc
abstract class _$$ChangeWatchlistImplCopyWith<$Res> {
  factory _$$ChangeWatchlistImplCopyWith(
    _$ChangeWatchlistImpl value,
    $Res Function(_$ChangeWatchlistImpl) then,
  ) = __$$ChangeWatchlistImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ChangeWatchlistImplCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$ChangeWatchlistImpl>
    implements _$$ChangeWatchlistImplCopyWith<$Res> {
  __$$ChangeWatchlistImplCopyWithImpl(
    _$ChangeWatchlistImpl _value,
    $Res Function(_$ChangeWatchlistImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? index = null}) {
    return _then(
      _$ChangeWatchlistImpl(
        index: null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$ChangeWatchlistImpl implements _ChangeWatchlist {
  const _$ChangeWatchlistImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'WatchlistEvent.changeWatchlist(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeWatchlistImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeWatchlistImplCopyWith<_$ChangeWatchlistImpl> get copyWith =>
      __$$ChangeWatchlistImplCopyWithImpl<_$ChangeWatchlistImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadWatchlist,
    required TResult Function(int index) changeWatchlist,
    required TResult Function(int oldIndex, int newIndex) reorderStocks,
    required TResult Function(String id) deleteStock,
    required TResult Function(WatchlistSortType sortType) changeSortType,
  }) {
    return changeWatchlist(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadWatchlist,
    TResult? Function(int index)? changeWatchlist,
    TResult? Function(int oldIndex, int newIndex)? reorderStocks,
    TResult? Function(String id)? deleteStock,
    TResult? Function(WatchlistSortType sortType)? changeSortType,
  }) {
    return changeWatchlist?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadWatchlist,
    TResult Function(int index)? changeWatchlist,
    TResult Function(int oldIndex, int newIndex)? reorderStocks,
    TResult Function(String id)? deleteStock,
    TResult Function(WatchlistSortType sortType)? changeSortType,
    required TResult orElse(),
  }) {
    if (changeWatchlist != null) {
      return changeWatchlist(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWatchlist value) loadWatchlist,
    required TResult Function(_ChangeWatchlist value) changeWatchlist,
    required TResult Function(_ReorderStocks value) reorderStocks,
    required TResult Function(_DeleteStock value) deleteStock,
    required TResult Function(_ChangeSortType value) changeSortType,
  }) {
    return changeWatchlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWatchlist value)? loadWatchlist,
    TResult? Function(_ChangeWatchlist value)? changeWatchlist,
    TResult? Function(_ReorderStocks value)? reorderStocks,
    TResult? Function(_DeleteStock value)? deleteStock,
    TResult? Function(_ChangeSortType value)? changeSortType,
  }) {
    return changeWatchlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWatchlist value)? loadWatchlist,
    TResult Function(_ChangeWatchlist value)? changeWatchlist,
    TResult Function(_ReorderStocks value)? reorderStocks,
    TResult Function(_DeleteStock value)? deleteStock,
    TResult Function(_ChangeSortType value)? changeSortType,
    required TResult orElse(),
  }) {
    if (changeWatchlist != null) {
      return changeWatchlist(this);
    }
    return orElse();
  }
}

abstract class _ChangeWatchlist implements WatchlistEvent {
  const factory _ChangeWatchlist({required final int index}) =
      _$ChangeWatchlistImpl;

  int get index;

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeWatchlistImplCopyWith<_$ChangeWatchlistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReorderStocksImplCopyWith<$Res> {
  factory _$$ReorderStocksImplCopyWith(
    _$ReorderStocksImpl value,
    $Res Function(_$ReorderStocksImpl) then,
  ) = __$$ReorderStocksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int oldIndex, int newIndex});
}

/// @nodoc
class __$$ReorderStocksImplCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$ReorderStocksImpl>
    implements _$$ReorderStocksImplCopyWith<$Res> {
  __$$ReorderStocksImplCopyWithImpl(
    _$ReorderStocksImpl _value,
    $Res Function(_$ReorderStocksImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oldIndex = null, Object? newIndex = null}) {
    return _then(
      _$ReorderStocksImpl(
        oldIndex: null == oldIndex
            ? _value.oldIndex
            : oldIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        newIndex: null == newIndex
            ? _value.newIndex
            : newIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$ReorderStocksImpl implements _ReorderStocks {
  const _$ReorderStocksImpl({required this.oldIndex, required this.newIndex});

  @override
  final int oldIndex;
  @override
  final int newIndex;

  @override
  String toString() {
    return 'WatchlistEvent.reorderStocks(oldIndex: $oldIndex, newIndex: $newIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReorderStocksImpl &&
            (identical(other.oldIndex, oldIndex) ||
                other.oldIndex == oldIndex) &&
            (identical(other.newIndex, newIndex) ||
                other.newIndex == newIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldIndex, newIndex);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReorderStocksImplCopyWith<_$ReorderStocksImpl> get copyWith =>
      __$$ReorderStocksImplCopyWithImpl<_$ReorderStocksImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadWatchlist,
    required TResult Function(int index) changeWatchlist,
    required TResult Function(int oldIndex, int newIndex) reorderStocks,
    required TResult Function(String id) deleteStock,
    required TResult Function(WatchlistSortType sortType) changeSortType,
  }) {
    return reorderStocks(oldIndex, newIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadWatchlist,
    TResult? Function(int index)? changeWatchlist,
    TResult? Function(int oldIndex, int newIndex)? reorderStocks,
    TResult? Function(String id)? deleteStock,
    TResult? Function(WatchlistSortType sortType)? changeSortType,
  }) {
    return reorderStocks?.call(oldIndex, newIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadWatchlist,
    TResult Function(int index)? changeWatchlist,
    TResult Function(int oldIndex, int newIndex)? reorderStocks,
    TResult Function(String id)? deleteStock,
    TResult Function(WatchlistSortType sortType)? changeSortType,
    required TResult orElse(),
  }) {
    if (reorderStocks != null) {
      return reorderStocks(oldIndex, newIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWatchlist value) loadWatchlist,
    required TResult Function(_ChangeWatchlist value) changeWatchlist,
    required TResult Function(_ReorderStocks value) reorderStocks,
    required TResult Function(_DeleteStock value) deleteStock,
    required TResult Function(_ChangeSortType value) changeSortType,
  }) {
    return reorderStocks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWatchlist value)? loadWatchlist,
    TResult? Function(_ChangeWatchlist value)? changeWatchlist,
    TResult? Function(_ReorderStocks value)? reorderStocks,
    TResult? Function(_DeleteStock value)? deleteStock,
    TResult? Function(_ChangeSortType value)? changeSortType,
  }) {
    return reorderStocks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWatchlist value)? loadWatchlist,
    TResult Function(_ChangeWatchlist value)? changeWatchlist,
    TResult Function(_ReorderStocks value)? reorderStocks,
    TResult Function(_DeleteStock value)? deleteStock,
    TResult Function(_ChangeSortType value)? changeSortType,
    required TResult orElse(),
  }) {
    if (reorderStocks != null) {
      return reorderStocks(this);
    }
    return orElse();
  }
}

abstract class _ReorderStocks implements WatchlistEvent {
  const factory _ReorderStocks({
    required final int oldIndex,
    required final int newIndex,
  }) = _$ReorderStocksImpl;

  int get oldIndex;
  int get newIndex;

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReorderStocksImplCopyWith<_$ReorderStocksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteStockImplCopyWith<$Res> {
  factory _$$DeleteStockImplCopyWith(
    _$DeleteStockImpl value,
    $Res Function(_$DeleteStockImpl) then,
  ) = __$$DeleteStockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteStockImplCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$DeleteStockImpl>
    implements _$$DeleteStockImplCopyWith<$Res> {
  __$$DeleteStockImplCopyWithImpl(
    _$DeleteStockImpl _value,
    $Res Function(_$DeleteStockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$DeleteStockImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteStockImpl implements _DeleteStock {
  const _$DeleteStockImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'WatchlistEvent.deleteStock(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteStockImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteStockImplCopyWith<_$DeleteStockImpl> get copyWith =>
      __$$DeleteStockImplCopyWithImpl<_$DeleteStockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadWatchlist,
    required TResult Function(int index) changeWatchlist,
    required TResult Function(int oldIndex, int newIndex) reorderStocks,
    required TResult Function(String id) deleteStock,
    required TResult Function(WatchlistSortType sortType) changeSortType,
  }) {
    return deleteStock(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadWatchlist,
    TResult? Function(int index)? changeWatchlist,
    TResult? Function(int oldIndex, int newIndex)? reorderStocks,
    TResult? Function(String id)? deleteStock,
    TResult? Function(WatchlistSortType sortType)? changeSortType,
  }) {
    return deleteStock?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadWatchlist,
    TResult Function(int index)? changeWatchlist,
    TResult Function(int oldIndex, int newIndex)? reorderStocks,
    TResult Function(String id)? deleteStock,
    TResult Function(WatchlistSortType sortType)? changeSortType,
    required TResult orElse(),
  }) {
    if (deleteStock != null) {
      return deleteStock(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWatchlist value) loadWatchlist,
    required TResult Function(_ChangeWatchlist value) changeWatchlist,
    required TResult Function(_ReorderStocks value) reorderStocks,
    required TResult Function(_DeleteStock value) deleteStock,
    required TResult Function(_ChangeSortType value) changeSortType,
  }) {
    return deleteStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWatchlist value)? loadWatchlist,
    TResult? Function(_ChangeWatchlist value)? changeWatchlist,
    TResult? Function(_ReorderStocks value)? reorderStocks,
    TResult? Function(_DeleteStock value)? deleteStock,
    TResult? Function(_ChangeSortType value)? changeSortType,
  }) {
    return deleteStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWatchlist value)? loadWatchlist,
    TResult Function(_ChangeWatchlist value)? changeWatchlist,
    TResult Function(_ReorderStocks value)? reorderStocks,
    TResult Function(_DeleteStock value)? deleteStock,
    TResult Function(_ChangeSortType value)? changeSortType,
    required TResult orElse(),
  }) {
    if (deleteStock != null) {
      return deleteStock(this);
    }
    return orElse();
  }
}

abstract class _DeleteStock implements WatchlistEvent {
  const factory _DeleteStock({required final String id}) = _$DeleteStockImpl;

  String get id;

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteStockImplCopyWith<_$DeleteStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeSortTypeImplCopyWith<$Res> {
  factory _$$ChangeSortTypeImplCopyWith(
    _$ChangeSortTypeImpl value,
    $Res Function(_$ChangeSortTypeImpl) then,
  ) = __$$ChangeSortTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WatchlistSortType sortType});
}

/// @nodoc
class __$$ChangeSortTypeImplCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$ChangeSortTypeImpl>
    implements _$$ChangeSortTypeImplCopyWith<$Res> {
  __$$ChangeSortTypeImplCopyWithImpl(
    _$ChangeSortTypeImpl _value,
    $Res Function(_$ChangeSortTypeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sortType = null}) {
    return _then(
      _$ChangeSortTypeImpl(
        sortType: null == sortType
            ? _value.sortType
            : sortType // ignore: cast_nullable_to_non_nullable
                  as WatchlistSortType,
      ),
    );
  }
}

/// @nodoc

class _$ChangeSortTypeImpl implements _ChangeSortType {
  const _$ChangeSortTypeImpl({required this.sortType});

  @override
  final WatchlistSortType sortType;

  @override
  String toString() {
    return 'WatchlistEvent.changeSortType(sortType: $sortType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeSortTypeImpl &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortType);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeSortTypeImplCopyWith<_$ChangeSortTypeImpl> get copyWith =>
      __$$ChangeSortTypeImplCopyWithImpl<_$ChangeSortTypeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadWatchlist,
    required TResult Function(int index) changeWatchlist,
    required TResult Function(int oldIndex, int newIndex) reorderStocks,
    required TResult Function(String id) deleteStock,
    required TResult Function(WatchlistSortType sortType) changeSortType,
  }) {
    return changeSortType(sortType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadWatchlist,
    TResult? Function(int index)? changeWatchlist,
    TResult? Function(int oldIndex, int newIndex)? reorderStocks,
    TResult? Function(String id)? deleteStock,
    TResult? Function(WatchlistSortType sortType)? changeSortType,
  }) {
    return changeSortType?.call(sortType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadWatchlist,
    TResult Function(int index)? changeWatchlist,
    TResult Function(int oldIndex, int newIndex)? reorderStocks,
    TResult Function(String id)? deleteStock,
    TResult Function(WatchlistSortType sortType)? changeSortType,
    required TResult orElse(),
  }) {
    if (changeSortType != null) {
      return changeSortType(sortType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWatchlist value) loadWatchlist,
    required TResult Function(_ChangeWatchlist value) changeWatchlist,
    required TResult Function(_ReorderStocks value) reorderStocks,
    required TResult Function(_DeleteStock value) deleteStock,
    required TResult Function(_ChangeSortType value) changeSortType,
  }) {
    return changeSortType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWatchlist value)? loadWatchlist,
    TResult? Function(_ChangeWatchlist value)? changeWatchlist,
    TResult? Function(_ReorderStocks value)? reorderStocks,
    TResult? Function(_DeleteStock value)? deleteStock,
    TResult? Function(_ChangeSortType value)? changeSortType,
  }) {
    return changeSortType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWatchlist value)? loadWatchlist,
    TResult Function(_ChangeWatchlist value)? changeWatchlist,
    TResult Function(_ReorderStocks value)? reorderStocks,
    TResult Function(_DeleteStock value)? deleteStock,
    TResult Function(_ChangeSortType value)? changeSortType,
    required TResult orElse(),
  }) {
    if (changeSortType != null) {
      return changeSortType(this);
    }
    return orElse();
  }
}

abstract class _ChangeSortType implements WatchlistEvent {
  const factory _ChangeSortType({required final WatchlistSortType sortType}) =
      _$ChangeSortTypeImpl;

  WatchlistSortType get sortType;

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeSortTypeImplCopyWith<_$ChangeSortTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WatchlistState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )
    loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistStateCopyWith<$Res> {
  factory $WatchlistStateCopyWith(
    WatchlistState value,
    $Res Function(WatchlistState) then,
  ) = _$WatchlistStateCopyWithImpl<$Res, WatchlistState>;
}

/// @nodoc
class _$WatchlistStateCopyWithImpl<$Res, $Val extends WatchlistState>
    implements $WatchlistStateCopyWith<$Res> {
  _$WatchlistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$WatchlistStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'WatchlistState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WatchlistState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$WatchlistStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'WatchlistState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements WatchlistState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    Map<int, List<StockModel>> watchlists,
    int selectedIndex,
    WatchlistSortType sortType,
  });
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$WatchlistStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchlists = null,
    Object? selectedIndex = null,
    Object? sortType = null,
  }) {
    return _then(
      _$LoadedImpl(
        watchlists: null == watchlists
            ? _value._watchlists
            : watchlists // ignore: cast_nullable_to_non_nullable
                  as Map<int, List<StockModel>>,
        selectedIndex: null == selectedIndex
            ? _value.selectedIndex
            : selectedIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        sortType: null == sortType
            ? _value.sortType
            : sortType // ignore: cast_nullable_to_non_nullable
                  as WatchlistSortType,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({
    required final Map<int, List<StockModel>> watchlists,
    required this.selectedIndex,
    required this.sortType,
  }) : _watchlists = watchlists;

  final Map<int, List<StockModel>> _watchlists;
  @override
  Map<int, List<StockModel>> get watchlists {
    if (_watchlists is EqualUnmodifiableMapView) return _watchlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_watchlists);
  }

  @override
  final int selectedIndex;
  @override
  final WatchlistSortType sortType;

  @override
  String toString() {
    return 'WatchlistState.loaded(watchlists: $watchlists, selectedIndex: $selectedIndex, sortType: $sortType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(
              other._watchlists,
              _watchlists,
            ) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_watchlists),
    selectedIndex,
    sortType,
  );

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(watchlists, selectedIndex, sortType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(watchlists, selectedIndex, sortType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(watchlists, selectedIndex, sortType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements WatchlistState {
  const factory _Loaded({
    required final Map<int, List<StockModel>> watchlists,
    required final int selectedIndex,
    required final WatchlistSortType sortType,
  }) = _$LoadedImpl;

  Map<int, List<StockModel>> get watchlists;
  int get selectedIndex;
  WatchlistSortType get sortType;

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$WatchlistStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'WatchlistState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<int, List<StockModel>> watchlists,
      int selectedIndex,
      WatchlistSortType sortType,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements WatchlistState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
