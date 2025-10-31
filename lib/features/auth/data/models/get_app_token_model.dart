// To parse this JSON data, do
//
//     final getAppToken = getAppTokenFromJson(jsonString);

import 'dart:convert';

GetAppToken getAppTokenFromJson(String str) => GetAppToken.fromJson(json.decode(str));

String getAppTokenToJson(GetAppToken data) => json.encode(data.toJson());

class GetAppToken {
    final int? misUserId;
    final String? firstName;
    final String? lastName;
    final String? email;
    final Language? language;
    final List<Organization>? organizations;

    GetAppToken({
        this.misUserId,
        this.firstName,
        this.lastName,
        this.email,
        this.language,
        this.organizations,
    });

    GetAppToken copyWith({
        int? misUserId,
        String? firstName,
        String? lastName,
        String? email,
        Language? language,
        List<Organization>? organizations,
    }) => 
        GetAppToken(
            misUserId: misUserId ?? this.misUserId,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            language: language ?? this.language,
            organizations: organizations ?? this.organizations,
        );

    factory GetAppToken.fromJson(Map<String, dynamic> json) => GetAppToken(
        misUserId: json["MisUserId"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        email: json["Email"],
        language: json["Language"] == null ? null : Language.fromJson(json["Language"]),
        organizations: json["Organizations"] == null ? [] : List<Organization>.from(json["Organizations"]!.map((x) => Organization.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "MisUserId": misUserId,
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "Language": language?.toJson(),
        "Organizations": organizations == null ? [] : List<dynamic>.from(organizations!.map((x) => x.toJson())),
    };
}

class Language {
    final String? name;
    final int? id;

    Language({
        this.name,
        this.id,
    });

    Language copyWith({
        String? name,
        int? id,
    }) => 
        Language(
            name: name ?? this.name,
            id: id ?? this.id,
        );

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["Name"],
        id: json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Id": id,
    };
}

class Organization {
    final Tenant? tenant;
    final Country? country;
    final Language? language;
    final Currency? currency;
    final Product? product;
    final List<Branch>? branches;
    final bool? flgImporting;
    final String? name;
    final int? misTenantId;
    final int? countryId;
    final int? currencyId;
    final int? languageId;
    final int? productId;
    final bool? archived;
    final Log? log;
    final int? id;

    Organization({
        this.tenant,
        this.country,
        this.language,
        this.currency,
        this.product,
        this.branches,
        this.flgImporting,
        this.name,
        this.misTenantId,
        this.countryId,
        this.currencyId,
        this.languageId,
        this.productId,
        this.archived,
        this.log,
        this.id,
    });

    Organization copyWith({
        Tenant? tenant,
        Country? country,
        Language? language,
        Currency? currency,
        Product? product,
        List<Branch>? branches,
        bool? flgImporting,
        String? name,
        int? misTenantId,
        int? countryId,
        int? currencyId,
        int? languageId,
        int? productId,
        bool? archived,
        Log? log,
        int? id,
    }) => 
        Organization(
            tenant: tenant ?? this.tenant,
            country: country ?? this.country,
            language: language ?? this.language,
            currency: currency ?? this.currency,
            product: product ?? this.product,
            branches: branches ?? this.branches,
            flgImporting: flgImporting ?? this.flgImporting,
            name: name ?? this.name,
            misTenantId: misTenantId ?? this.misTenantId,
            countryId: countryId ?? this.countryId,
            currencyId: currencyId ?? this.currencyId,
            languageId: languageId ?? this.languageId,
            productId: productId ?? this.productId,
            archived: archived ?? this.archived,
            log: log ?? this.log,
            id: id ?? this.id,
        );

    factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        tenant: json["Tenant"] == null ? null : Tenant.fromJson(json["Tenant"]),
        country: json["Country"] == null ? null : Country.fromJson(json["Country"]),
        language: json["Language"] == null ? null : Language.fromJson(json["Language"]),
        currency: json["Currency"] == null ? null : Currency.fromJson(json["Currency"]),
        product: json["Product"] == null ? null : Product.fromJson(json["Product"]),
        branches: json["Branches"] == null ? [] : List<Branch>.from(json["Branches"]!.map((x) => Branch.fromJson(x))),
        flgImporting: json["FlgImporting"],
        name: json["Name"],
        misTenantId: json["MisTenantId"],
        countryId: json["CountryId"],
        currencyId: json["CurrencyId"],
        languageId: json["LanguageId"],
        productId: json["ProductId"],
        archived: json["Archived"],
        log: json["Log"] == null ? null : Log.fromJson(json["Log"]),
        id: json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Tenant": tenant?.toJson(),
        "Country": country?.toJson(),
        "Language": language?.toJson(),
        "Currency": currency?.toJson(),
        "Product": product?.toJson(),
        "Branches": branches == null ? [] : List<dynamic>.from(branches!.map((x) => x.toJson())),
        "FlgImporting": flgImporting,
        "Name": name,
        "MisTenantId": misTenantId,
        "CountryId": countryId,
        "CurrencyId": currencyId,
        "LanguageId": languageId,
        "ProductId": productId,
        "Archived": archived,
        "Log": log?.toJson(),
        "Id": id,
    };
}

class Branch {
    final AuthToken? authToken;
    final String? name;
    final int? misOrganizationId;
    final int? locationId;
    final bool? archived;
    final Log? log;
    final int? id;

    Branch({
        this.authToken,
        this.name,
        this.misOrganizationId,
        this.locationId,
        this.archived,
        this.log,
        this.id,
    });

    Branch copyWith({
        AuthToken? authToken,
        String? name,
        int? misOrganizationId,
        int? locationId,
        bool? archived,
        Log? log,
        int? id,
    }) => 
        Branch(
            authToken: authToken ?? this.authToken,
            name: name ?? this.name,
            misOrganizationId: misOrganizationId ?? this.misOrganizationId,
            locationId: locationId ?? this.locationId,
            archived: archived ?? this.archived,
            log: log ?? this.log,
            id: id ?? this.id,
        );

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        authToken: json["AuthToken"] == null ? null : AuthToken.fromJson(json["AuthToken"]),
        name: json["Name"],
        misOrganizationId: json["MisOrganizationId"],
        locationId: json["LocationId"],
        archived: json["Archived"],
        log: json["Log"] == null ? null : Log.fromJson(json["Log"]),
        id: json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "AuthToken": authToken?.toJson(),
        "Name": name,
        "MisOrganizationId": misOrganizationId,
        "LocationId": locationId,
        "Archived": archived,
        "Log": log?.toJson(),
        "Id": id,
    };
}

class AuthToken {
    final String? accessToken;
    final DateTime? expiration;
    final String? refreshToken;

    AuthToken({
        this.accessToken,
        this.expiration,
        this.refreshToken,
    });

    AuthToken copyWith({
        String? accessToken,
        DateTime? expiration,
        String? refreshToken,
    }) => 
        AuthToken(
            accessToken: accessToken ?? this.accessToken,
            expiration: expiration ?? this.expiration,
            refreshToken: refreshToken ?? this.refreshToken,
        );

    factory AuthToken.fromJson(Map<String, dynamic> json) => AuthToken(
        accessToken: json["AccessToken"],
        expiration: json["Expiration"] == null ? null : DateTime.parse(json["Expiration"]),
        refreshToken: json["RefreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "AccessToken": accessToken,
        "Expiration": expiration?.toIso8601String(),
        "RefreshToken": refreshToken,
    };
}

class Log {
    final DateTime? createdOn;
    final String? creator;

    Log({
        this.createdOn,
        this.creator,
    });

    Log copyWith({
        DateTime? createdOn,
        String? creator,
    }) => 
        Log(
            createdOn: createdOn ?? this.createdOn,
            creator: creator ?? this.creator,
        );

    factory Log.fromJson(Map<String, dynamic> json) => Log(
        createdOn: json["CreatedOn"] == null ? null : DateTime.parse(json["CreatedOn"]),
        creator: json["Creator"],
    );

    Map<String, dynamic> toJson() => {
        "CreatedOn": createdOn?.toIso8601String(),
        "Creator": creator,
    };
}

class Country {
    final String? name;
    final String? iso3;
    final String? iso2;
    final bool? archived;
    final int? id;

    Country({
        this.name,
        this.iso3,
        this.iso2,
        this.archived,
        this.id,
    });

    Country copyWith({
        String? name,
        String? iso3,
        String? iso2,
        bool? archived,
        int? id,
    }) => 
        Country(
            name: name ?? this.name,
            iso3: iso3 ?? this.iso3,
            iso2: iso2 ?? this.iso2,
            archived: archived ?? this.archived,
            id: id ?? this.id,
        );

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["Name"],
        iso3: json["Iso3"],
        iso2: json["Iso2"],
        archived: json["Archived"],
        id: json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Iso3": iso3,
        "Iso2": iso2,
        "Archived": archived,
        "Id": id,
    };
}

class Currency {
    final String? code;
    final String? symbol;
    final int? decimals;
    final int? id;

    Currency({
        this.code,
        this.symbol,
        this.decimals,
        this.id,
    });

    Currency copyWith({
        String? code,
        String? symbol,
        int? decimals,
        int? id,
    }) => 
        Currency(
            code: code ?? this.code,
            symbol: symbol ?? this.symbol,
            decimals: decimals ?? this.decimals,
            id: id ?? this.id,
        );

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["Code"],
        symbol: json["Symbol"],
        decimals: json["Decimals"],
        id: json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Code": code,
        "Symbol": symbol,
        "Decimals": decimals,
        "Id": id,
    };
}

class Product {
    final Software? software;
    final int? softwareId;
    final String? name;
    final String? sysKey;
    final bool? archived;
    final int? id;

    Product({
        this.software,
        this.softwareId,
        this.name,
        this.sysKey,
        this.archived,
        this.id,
    });

    Product copyWith({
        Software? software,
        int? softwareId,
        String? name,
        String? sysKey,
        bool? archived,
        int? id,
    }) => 
        Product(
            software: software ?? this.software,
            softwareId: softwareId ?? this.softwareId,
            name: name ?? this.name,
            sysKey: sysKey ?? this.sysKey,
            archived: archived ?? this.archived,
            id: id ?? this.id,
        );

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        software: json["Software"] == null ? null : Software.fromJson(json["Software"]),
        softwareId: json["SoftwareId"],
        name: json["Name"],
        sysKey: json["SysKey"],
        archived: json["Archived"],
        id: json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Software": software?.toJson(),
        "SoftwareId": softwareId,
        "Name": name,
        "SysKey": sysKey,
        "Archived": archived,
        "Id": id,
    };
}

class Software {
    final String? name;
    final String? sysKey;
    final int? id;

    Software({
        this.name,
        this.sysKey,
        this.id,
    });

    Software copyWith({
        String? name,
        String? sysKey,
        int? id,
    }) => 
        Software(
            name: name ?? this.name,
            sysKey: sysKey ?? this.sysKey,
            id: id ?? this.id,
        );

    factory Software.fromJson(Map<String, dynamic> json) => Software(
        name: json["Name"],
        sysKey: json["SysKey"],
        id: json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "SysKey": sysKey,
        "Id": id,
    };
}

class Tenant {
    final String? name;
    final int? dbId;
    final int? id;

    Tenant({
        this.name,
        this.dbId,
        this.id,
    });

    Tenant copyWith({
        String? name,
        int? dbId,
        int? id,
    }) => 
        Tenant(
            name: name ?? this.name,
            dbId: dbId ?? this.dbId,
            id: id ?? this.id,
        );

    factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
        name: json["Name"],
        dbId: json["DBId"],
        id: json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "DBId": dbId,
        "Id": id,
    };
}
