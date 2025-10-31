class GetAccountStatementsModel {
  final int finYearId;
  final double ttlDebit;
  final double ttlCredit;
  final double balance;
  final FinYear finYear;
  final List<LedgerType> ledgerTypes;
  final bool flgExcludeArchived;
  final List<dynamic> cacheEntities;
  final int pageIndex;
  final int pageSize;

  GetAccountStatementsModel({
    required this.finYearId,
    required this.ttlDebit,
    required this.ttlCredit,
    required this.balance,
    required this.finYear,
    required this.ledgerTypes,
    required this.flgExcludeArchived,
    required this.cacheEntities,
    required this.pageIndex,
    required this.pageSize,
  });

  factory GetAccountStatementsModel.fromJson(Map<String, dynamic> json) {
    return GetAccountStatementsModel(
      finYearId: json['FinYearId'] ?? 0,
      ttlDebit: (json['TTLDebit'] ?? 0).toDouble(),
      ttlCredit: (json['TTLCredit'] ?? 0).toDouble(),
      balance: (json['Balance'] ?? 0).toDouble(),
      finYear: FinYear.fromJson(json['FinYear']),
      ledgerTypes: (json['LedgerTypes'] as List)
          .map((e) => LedgerType.fromJson(e))
          .toList(),
      flgExcludeArchived: json['FlgExcludeArchived'] ?? false,
      cacheEntities: json['CacheEntities'] ?? [],
      pageIndex: json['PageIndex'] ?? 0,
      pageSize: json['PageSize'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "FinYearId": finYearId,
    "TTLDebit": ttlDebit,
    "TTLCredit": ttlCredit,
    "Balance": balance,
    "FinYear": finYear.toJson(),
    "LedgerTypes": ledgerTypes.map((e) => e.toJson()).toList(),
    "FlgExcludeArchived": flgExcludeArchived,
    "CacheEntities": cacheEntities,
    "PageIndex": pageIndex,
    "PageSize": pageSize,
  };
}

class FinYear {
  final bool isClosed;
  final String startDate;
  final String endDate;
  final String name;
  final int id;

  FinYear({
    required this.isClosed,
    required this.startDate,
    required this.endDate,
    required this.name,
    required this.id,
  });

  factory FinYear.fromJson(Map<String, dynamic> json) {
    return FinYear(
      isClosed: json['IsClosed'] ?? false,
      startDate: json['StartDate'] ?? '',
      endDate: json['EndDate'] ?? '',
      name: json['Name'] ?? '',
      id: json['Id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "IsClosed": isClosed,
    "StartDate": startDate,
    "EndDate": endDate,
    "Name": name,
    "Id": id,
  };
}

class LedgerType {
  final String type;
  final double ttlDebit;
  final double ttlCredit;
  final double balance;
  final List<Ledger> ledgers;
  final int id;

  LedgerType({
    required this.type,
    required this.ttlDebit,
    required this.ttlCredit,
    required this.balance,
    required this.ledgers,
    required this.id,
  });

  factory LedgerType.fromJson(Map<String, dynamic> json) {
    return LedgerType(
      type: json['Type'] ?? '',
      ttlDebit: (json['TTLDebit'] ?? 0).toDouble(),
      ttlCredit: (json['TTLCredit'] ?? 0).toDouble(),
      balance: (json['Balance'] ?? 0).toDouble(),
      ledgers: (json['Ledgers'] as List)
          .map((e) => Ledger.fromJson(e))
          .toList(),
      id: json['Id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "Type": type,
    "TTLDebit": ttlDebit,
    "TTLCredit": ttlCredit,
    "Balance": balance,
    "Ledgers": ledgers.map((e) => e.toJson()).toList(),
    "Id": id,
  };
}

class Ledger {
  final String type;
  final int featureId;
  final String? docNbr;
  final String docDate;
  final int accountId;
  final Account? account;
  final int finYearId;
  final FinYear finYear;
  final int? partyId;
  final int currencyId;
  final double drAmount;
  final double crAmount;
  final String narration;
  final bool isOpening;
  final double balance;
  final int id;

  Ledger({
    required this.type,
    required this.featureId,
    this.docNbr,
    required this.docDate,
    required this.accountId,
    this.account,
    required this.finYearId,
    required this.finYear,
    this.partyId,
    required this.currencyId,
    required this.drAmount,
    required this.crAmount,
    required this.narration,
    required this.isOpening,
    required this.balance,
    required this.id,
  });

  factory Ledger.fromJson(Map<String, dynamic> json) {
    return Ledger(
      type: json['Type'] ?? '',
      featureId: json['FeatureId'] ?? 0,
      docNbr: json['DocNbr'],
      docDate: json['DocDate'] ?? '',
      accountId: json['AccountId'] ?? 0,
      account: json['Account'] != null
          ? Account.fromJson(json['Account'])
          : null,
      finYearId: json['FinYearId'] ?? 0,
      finYear: FinYear.fromJson(json['FinYear']),
      partyId: json['PartyId'],
      currencyId: json['CurrencyId'] ?? 0,
      drAmount: (json['DrAmount'] ?? 0).toDouble(),
      crAmount: (json['CrAmount'] ?? 0).toDouble(),
      narration: json['Narration'] ?? '',
      isOpening: json['IsOpening'] ?? false,
      balance: (json['Balance'] ?? 0).toDouble(),
      id: json['Id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "Type": type,
    "FeatureId": featureId,
    "DocNbr": docNbr,
    "DocDate": docDate,
    "AccountId": accountId,
    "Account": account?.toJson(),
    "FinYearId": finYearId,
    "FinYear": finYear.toJson(),
    "PartyId": partyId,
    "CurrencyId": currencyId,
    "DrAmount": drAmount,
    "CrAmount": crAmount,
    "Narration": narration,
    "IsOpening": isOpening,
    "Balance": balance,
    "Id": id,
  };
}

class Account {
  final String name;
  final int accTypeId;
  final int groupId;
  final int currencyId;
  final AccType accType;
  final Group group;
  final bool flgControlledAcc;
  final int id;

  Account({
    required this.name,
    required this.accTypeId,
    required this.groupId,
    required this.currencyId,
    required this.accType,
    required this.group,
    required this.flgControlledAcc,
    required this.id,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      name: json['Name'] ?? '',
      accTypeId: json['AccTypeId'] ?? 0,
      groupId: json['GroupId'] ?? 0,
      currencyId: json['CurrencyId'] ?? 0,
      accType: AccType.fromJson(json['AccType']),
      group: Group.fromJson(json['Group']),
      flgControlledAcc: json['FlgControlledAcc'] ?? false,
      id: json['Id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "Name": name,
    "AccTypeId": accTypeId,
    "GroupId": groupId,
    "CurrencyId": currencyId,
    "AccType": accType.toJson(),
    "Group": group.toJson(),
    "FlgControlledAcc": flgControlledAcc,
    "Id": id,
  };
}

class AccType {
  final String name;
  final String sysKey;
  final String breadcrumb;
  final int parentId;
  final int id;

  AccType({
    required this.name,
    required this.sysKey,
    required this.breadcrumb,
    required this.parentId,
    required this.id,
  });

  factory AccType.fromJson(Map<String, dynamic> json) {
    return AccType(
      name: json['Name'] ?? '',
      sysKey: json['SysKey'] ?? '',
      breadcrumb: json['Breadcrumb'] ?? '',
      parentId: json['ParentId'] ?? 0,
      id: json['Id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "Name": name,
    "SysKey": sysKey,
    "Breadcrumb": breadcrumb,
    "ParentId": parentId,
    "Id": id,
  };
}

class Group {
  final String name;
  final String breadcrumb;
  final int groupTypeId;
  final int depth;
  final int parentId;
  final String sortingId;
  final GroupType groupType;
  final int id;

  Group({
    required this.name,
    required this.breadcrumb,
    required this.groupTypeId,
    required this.depth,
    required this.parentId,
    required this.sortingId,
    required this.groupType,
    required this.id,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      name: json['Name'] ?? '',
      breadcrumb: json['Breadcrumb'] ?? '',
      groupTypeId: json['GroupTypeId'] ?? 0,
      depth: json['Depth'] ?? 0,
      parentId: json['ParentId'] ?? 0,
      sortingId: json['SortingId'] ?? '',
      groupType: GroupType.fromJson(json['GroupType']),
      id: json['Id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Breadcrumb": breadcrumb,
    "GroupTypeId": groupTypeId,
    "Depth": depth,
    "ParentId": parentId,
    "SortingId": sortingId,
    "GroupType": groupType.toJson(),
    "Id": id,
  };
}

class GroupType {
  final String name;
  final String sysKey;
  final String breadcrumb;
  final int id;

  GroupType({
    required this.name,
    required this.sysKey,
    required this.breadcrumb,
    required this.id,
  });

  factory GroupType.fromJson(Map<String, dynamic> json) {
    return GroupType(
      name: json['Name'] ?? '',
      sysKey: json['SysKey'] ?? '',
      breadcrumb: json['Breadcrumb'] ?? '',
      id: json['Id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "Name": name,
    "SysKey": sysKey,
    "Breadcrumb": breadcrumb,
    "Id": id,
  };
}
