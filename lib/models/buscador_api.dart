import 'dart:convert';

BuscadorPagosPendientes buscadorPagosPendientesFromJson(String str) => BuscadorPagosPendientes.fromJson(json.decode(str));

String buscadorPagosPendientesToJson(BuscadorPagosPendientes data) => json.encode(data.toJson());

class BuscadorPagosPendientes {
    final String correofacturas;
    final Cliente cliente;
    final List<Item> items;
    final int errorCode;
    final String message;

    BuscadorPagosPendientes({
        required this.correofacturas,
        required this.cliente,
        required this.items,
        required this.errorCode,
        required this.message,
    });

    factory BuscadorPagosPendientes.fromJson(Map<String, dynamic> json) => BuscadorPagosPendientes(
        correofacturas: json["correofacturas"],
        cliente: Cliente.fromJson(json["cliente"]),
        items:  json["items"] == null 
        ? [] 
        : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        errorCode: json["errorCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "correofacturas": correofacturas,
        "cliente": cliente.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "errorCode": errorCode,
        "message": message,
    };
}

class Cliente {
    final String ci;
    final String paterno;
    final String materno;
    final String nombres;
    final String codAlumno;
    final String unidadAcademica;
    final String emailEmi;
    final String eMail;

    Cliente({
        required this.ci,
        required this.paterno,
        required this.materno,
        required this.nombres,
        required this.codAlumno,
        required this.unidadAcademica,
        required this.emailEmi,
        required this.eMail,
    });

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        ci: json["CI"],
        paterno: json["Paterno"],
        materno: json["Materno"],
        nombres: json["Nombres"],
        codAlumno: json["CodAlumno"],
        unidadAcademica: json["UnidadAcademica"],
        emailEmi: json["email_emi"],
        eMail: json["EMail"],
    );

    Map<String, dynamic> toJson() => {
        "CI": ci,
        "Paterno": paterno,
        "Materno": materno,
        "Nombres": nombres,
        "CodAlumno": codAlumno,
        "UnidadAcademica": unidadAcademica,
        "email_emi": emailEmi,
        "EMail": eMail,
    };
}

class Item {
    final String nomFac;
    final String nitCi;
    final String monto;
    final String codges;
    final String item;
    final String carrera;
    final String curso;
    final DateTime feclim;
    final String apu;
    final String codpag;
    final String codcar;
    final String codcur;
    final String coduni;
    final double descuento;
    final String codigopago;
    final double montototal;

    Item({
        required this.nomFac,
        required this.nitCi,
        required this.monto,
        required this.codges,
        required this.item,
        required this.carrera,
        required this.curso,
        required this.feclim,
        required this.apu,
        required this.codpag,
        required this.codcar,
        required this.codcur,
        required this.coduni,
        required this.descuento,
        required this.codigopago,
        required this.montototal,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        nomFac: json["NOM_FAC"],
        nitCi: json["NIT_CI"],
        monto: json["MONTO"],
        codges: json["CODGES"],
        item: json["ITEM"],
        carrera: json["CARRERA"],
        curso: json["CURSO"],
        feclim: DateTime.parse(json["FECLIM"]),
        apu: json["APU"],
        codpag: json["CODPAG"],
        codcar: json["CODCAR"],
        codcur: json["CODCUR"],
        coduni: json["CODUNI"],
        descuento: json["DESCUENTO"]?.toDouble(),
        codigopago: json["CODIGOPAGO"],
        montototal: json["MONTOTOTAL"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "NOM_FAC": nomFac,
        "NIT_CI": nitCi,
        "MONTO": monto,
        "CODGES": codges,
        "ITEM": item,
        "CARRERA": carrera,
        "CURSO": curso,
        "FECLIM": "${feclim.year.toString().padLeft(4, '0')}-${feclim.month.toString().padLeft(2, '0')}-${feclim.day.toString().padLeft(2, '0')}",
        "APU": apu,
        "CODPAG": codpag,
        "CODCAR": codcar,
        "CODCUR": codcur,
        "CODUNI": coduni,
        "DESCUENTO": descuento,
        "CODIGOPAGO": codigopago,
        "MONTOTOTAL": montototal,
    };
}
