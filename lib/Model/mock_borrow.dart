class mockBorrowPool {
  String? status;
  List<Data>? data;

  mockBorrowPool({this.status, this.data});

  mockBorrowPool.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? poolState;
  String? borrowerAddress;
  int? poolId;
  String? loanCurrency;
  int? borrowAmount;
  int? tenor;
  String? subscriptionStart;
  String? subscriptionEnd;
  String? termStart;
  String? termEnd;
  String? collateralCurrency;
  int? lowerBound;
  int? upperBound;
  int? loanRate;
  int? repaymentAmount;
  int? collateralAmount;
  List<String>? lenders;

  Data(
      {this.poolState,
      this.borrowerAddress,
      this.poolId,
      this.loanCurrency,
      this.borrowAmount,
      this.tenor,
      this.subscriptionStart,
      this.subscriptionEnd,
      this.termStart,
      this.termEnd,
      this.collateralCurrency,
      this.lowerBound,
      this.upperBound,
      this.loanRate,
      this.repaymentAmount,
      this.collateralAmount,
      this.lenders});

  Data.fromJson(Map<String, dynamic> json) {
    poolState = json['poolState'];
    borrowerAddress = json['borrowerAddress'];
    poolId = json['poolId'];
    loanCurrency = json['loanCurrency'];
    borrowAmount = json['borrowAmount'];
    tenor = json['tenor'];
    subscriptionStart = json['subscriptionStart'];
    subscriptionEnd = json['subscriptionEnd'];
    termStart = json['termStart'];
    termEnd = json['termEnd'];
    collateralCurrency = json['collateralCurrency'];
    lowerBound = json['lowerBound'];
    upperBound = json['upperBound'];
    loanRate = json['loanRate'];
    repaymentAmount = json['repaymentAmount'];
    collateralAmount = json['collateralAmount'];
    lenders = json['lenders'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poolState'] = this.poolState;
    data['borrowerAddress'] = this.borrowerAddress;
    data['poolId'] = this.poolId;
    data['loanCurrency'] = this.loanCurrency;
    data['borrowAmount'] = this.borrowAmount;
    data['tenor'] = this.tenor;
    data['subscriptionStart'] = this.subscriptionStart;
    data['subscriptionEnd'] = this.subscriptionEnd;
    data['termStart'] = this.termStart;
    data['termEnd'] = this.termEnd;
    data['collateralCurrency'] = this.collateralCurrency;
    data['lowerBound'] = this.lowerBound;
    data['upperBound'] = this.upperBound;
    data['loanRate'] = this.loanRate;
    data['repaymentAmount'] = this.repaymentAmount;
    data['collateralAmount'] = this.collateralAmount;
    data['lenders'] = this.lenders;
    return data;
  }
}
