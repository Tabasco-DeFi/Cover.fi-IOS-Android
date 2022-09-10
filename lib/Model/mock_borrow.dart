class MockBorrowModel {
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

  MockBorrowModel.name({
    this.poolState,
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
    this.lenders
  });


  MockBorrowModel.fromJson(Map<String, dynamic> json){
    poolState = json["poolState"];
    borrowerAddress = json["borrowerAddress"];
    poolId = json["poolId"];
    loanCurrency = json["loanCurrency"];
    borrowAmount = json["borrowAmount"];
    tenor = json["tenor"];
    subscriptionStart = json["subscriptionStart"];
    subscriptionEnd = json["subscriptionEnd"];
    termStart = json["termStart"];
    termEnd = json["termEnd"];
    collateralCurrency = json["collateralCurrency"];
    lowerBound = json["lowerBound"];
    upperBound = json["upperBound"];
    loanRate = json["loanRate"];
    repaymentAmount = json["repaymentAmount"];
    collateralAmount = json["collateralAmount"];
    lenders = json["lenders"];
  }
}
