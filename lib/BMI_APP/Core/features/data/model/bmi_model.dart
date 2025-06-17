class BmiModel {
  final String status;
  final dynamic error;
  final Map<String, dynamic>? data;
  BmiModel(this.status, this.error, {this.data});
  factory BmiModel.fromJson(Map<String, dynamic> json) {
    return BmiModel(json['status'], json['error'], data: json['data']);
  }
}
