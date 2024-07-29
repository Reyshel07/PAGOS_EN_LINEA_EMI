import 'dart:convert';

PagoServiceApi pagoServiceFromJson(String str) => PagoServiceApi.fromJson(json.decode(str));

String pagoServiceToJson(PagoServiceApi data) => json.encode(data.toJson());

class PagoServiceApi {
    String fechapago;
    int errorCode;
    String message;

    PagoServiceApi({
        required this.fechapago,
        required this.errorCode,
        required this.message,
    });

    factory PagoServiceApi.fromJson(Map<String, dynamic> json) => PagoServiceApi(
        fechapago: json["fechapago"],
        errorCode: json["errorCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "fechapago": fechapago,
        "errorCode": errorCode,
        "message": message,
    };
}
