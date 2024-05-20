class Income {
  String? idIncome;
  double? cost;
  double? revenue;
  double? profit;

  Income(this.idIncome, this.cost, this.revenue, this.profit);

  Income.fromJson(Map<String, dynamic> json) {
    idIncome = json["idIncome"];
    cost = json["cost"];
    revenue = json["revenue"];
    profit = json["profit"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idIncome"] = idIncome;
    _data["cost"] = cost;
    _data["revenue"] = revenue;
    _data["profit"] = profit;
    return _data;
  }
}
