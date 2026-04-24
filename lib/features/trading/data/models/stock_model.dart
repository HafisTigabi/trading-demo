import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_model.freezed.dart';
part 'stock_model.g.dart';

@freezed
class StockModel with _$StockModel {
  const factory StockModel({
    required String id,
    required String name,
    required String symbol,
    required Exchange exchange,
    required StockType type,
    required double price,
    required double change,
    required double changePercent,
  }) = _StockModel;

  factory StockModel.fromJson(Map<String, dynamic> json) =>
      _$StockModelFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum StockType {
  @JsonValue('eq')
  eq,
  @JsonValue('idx')
  idx,
  @JsonValue('option')
  option,
}

@JsonEnum(alwaysCreate: true)
enum Exchange {
  @JsonValue('nse')
  nse,
  @JsonValue('bse')
  bse,
  @JsonValue('index')
  indexExchange,
}
