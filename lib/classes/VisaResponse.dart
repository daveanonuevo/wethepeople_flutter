class VisaResponse {
  String conversionRate;
  String destinationAmount;
  String markUpRateApplied;
  String originalDestnAmtBeforeMarkUp;

  VisaResponse(
      {this.conversionRate,
        this.destinationAmount,
        this.markUpRateApplied,
        this.originalDestnAmtBeforeMarkUp});

  VisaResponse.fromJson(Map<String, dynamic> json) {
    conversionRate = json['conversionRate'];
    destinationAmount = json['destinationAmount'];
    markUpRateApplied = json['markUpRateApplied'];
    originalDestnAmtBeforeMarkUp = json['originalDestnAmtBeforeMarkUp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conversionRate'] = this.conversionRate;
    data['destinationAmount'] = this.destinationAmount;
    data['markUpRateApplied'] = this.markUpRateApplied;
    data['originalDestnAmtBeforeMarkUp'] = this.originalDestnAmtBeforeMarkUp;
    return data;
  }
}
