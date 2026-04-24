// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockModelImpl _$$StockModelImplFromJson(Map<String, dynamic> json) =>
    _$StockModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      exchange: $enumDecode(_$ExchangeEnumMap, json['exchange']),
      type: $enumDecode(_$StockTypeEnumMap, json['type']),
      price: (json['price'] as num).toDouble(),
      change: (json['change'] as num).toDouble(),
      changePercent: (json['changePercent'] as num).toDouble(),
    );

Map<String, dynamic> _$$StockModelImplToJson(_$StockModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'exchange': _$ExchangeEnumMap[instance.exchange]!,
      'type': _$StockTypeEnumMap[instance.type]!,
      'price': instance.price,
      'change': instance.change,
      'changePercent': instance.changePercent,
    };

const _$ExchangeEnumMap = {
  Exchange.nse: 'nse',
  Exchange.bse: 'bse',
  Exchange.indexExchange: 'index',
};

const _$StockTypeEnumMap = {
  StockType.eq: 'eq',
  StockType.idx: 'idx',
  StockType.option: 'option',
};
