class ResponseObject {
  String status;
  String message;
  dynamic data;

  ResponseObject({required this.status, required this.message, required this.data});

  factory ResponseObject.fromJson(Map<String, dynamic> json) {
    return ResponseObject(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}

