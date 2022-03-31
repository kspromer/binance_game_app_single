class BasePageDto {
  int page;
  int limit;
  int totalPages;

  BasePageDto({
      this.page,
      this.totalPages,
      this.limit});

  BasePageDto.fromJson(dynamic json) {
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['page'] = page;
    map['limit'] = limit;
    map['totalPages'] = totalPages;
    return map;
  }

}
