class Calculation {
  final double first;
  final double second;
  final String operation;
  final double result;

  Calculation({
    required this.first,
    required this.second,
    required this.operation,
    required this.result,
  });

  factory Calculation.fromJson(Map<String, dynamic> json) {
    return Calculation(
      first: json['first'] ?? 0.0,
      second: json['second'] ?? 0.0,
      operation: json['operation'],
      result: json['result'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first'] = first;
    data['second'] = second;
    data['operation'] = operation;
    data['result'] = result;
    return data;
  }

  @override
  String toString() => '$first $operation $second = $result';
}
