class Rate {
  String usd;
  String cny;
  String sgd;
  String thb;
  String eur;
  String gbp;
  String jpy;
  String krw;
  String khr;
  String lak;
  String inr;
  String idr;

  Rate({
    this.usd,
    this.sgd,
    this.cny,
    this.thb,
    this.eur,
    this.gbp,
    this.jpy,
    this.krw,
    this.khr,
    this.lak,
    this.inr,
    this.idr,
  });
  factory Rate.fromJson(Map<String, dynamic> json) => _rateFromJson(json);
}

Rate _rateFromJson(Map<String, dynamic> json) => Rate(
      usd: json['USD'] as String,
      sgd: json['SGD'] as String,
      cny: json['CNY'] as String,
      thb: json['THB'] as String,
      eur: json['EUR'] as String,
      gbp: json['GBP'] as String,
      jpy: json['JPY'] as String,
      krw: json['KRW'] as String,
      khr: json['KHR'] as String,
      lak: json['LAK'] as String,
      inr: json['INR'] as String,
      idr: json['IDR'] as String,
    );
