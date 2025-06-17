class BmiDataModel {
  final String height;
  final String weight;
  final double bmi;
  final String risk;
  final String summary;
  final String recommendation;
  const BmiDataModel({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.risk,
    required this.summary,
    required this.recommendation,
  });
  factory BmiDataModel.fromJson(Map<String, dynamic> json) {
    return BmiDataModel(
      height: json['height'],
      weight: json['weight'],
      bmi: json['bmi'],
      risk: json['risk'],
      summary: json['summary'],
      recommendation: json['recommendation'],
    );
  }
}
