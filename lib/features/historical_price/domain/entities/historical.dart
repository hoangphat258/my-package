import 'package:equatable/equatable.dart';

class Historical extends Equatable {
  const Historical({
    this.date,
    this.open,
    this.high,
    this.low,
    this.close,
    this.adjClose,
    this.volume,
    this.unadjustedVolume,
    this.change,
    this.changePercent,
    this.vwap,
    this.label,
    this.changeOverTime,
  });

  final DateTime? date;
  final double? open;
  final double? high;
  final double? low;
  final double? close;
  final double? adjClose;
  final int? volume;
  final int? unadjustedVolume;
  final double? change;
  final double? changePercent;
  final double? vwap;
  final String? label;
  final double? changeOverTime;

  factory Historical.fromJson(Map<String, dynamic> json) => Historical(
    date: DateTime.parse(json["date"]),
    open: json["open"]?.toDouble(),
    high: json["high"]?.toDouble(),
    low: json["low"]?.toDouble(),
    close: json["close"]?.toDouble(),
    adjClose: json["adjClose"]?.toDouble(),
    volume: json["volume"],
    unadjustedVolume: json["unadjustedVolume"],
    change: json["change"]?.toDouble(),
    changePercent: json["changePercent"]?.toDouble(),
    vwap: json["vwap"]?.toDouble(),
    label: json["label"],
    changeOverTime: json["changeOverTime"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
    "open": open,
    "high": high,
    "low": low,
    "close": close,
    "adjClose": adjClose,
    "volume": volume,
    "unadjustedVolume": unadjustedVolume,
    "change": change,
    "changePercent": changePercent,
    "vwap": vwap,
    "label": label,
    "changeOverTime": changeOverTime,
  };

  @override
  List<Object?> get props => [
        date,
        open,
        high,
        low,
        close,
        adjClose,
        volume,
        unadjustedVolume,
        change,
        changePercent,
        vwap,
        label,
        changeOverTime
      ];
}
