class EventResponse {
  List<Data>? data;
  Meta? meta;

  EventResponse({this.data, this.meta});

  EventResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Attributes? attributes;

  Data({this.id, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? eventName;
  String? description;
  String? content;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  Status? status;
  Status? avatar;
  Videos? videos;
  Imgs? imgs;

  Attributes(
      {this.eventName,
      this.description,
      this.content,
      this.startTime,
      this.endTime,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.status,
      this.avatar,
      this.videos,
      this.imgs});

  Attributes.fromJson(Map<String, dynamic> json) {
    eventName = json['EventName'];
    description = json['Description'];
    content = json['content'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    avatar =
        json['avatar'] != null ? new Status.fromJson(json['avatar']) : null;
    videos =
        json['Videos'] != null ? new Videos.fromJson(json['Videos']) : null;
    imgs = json['Imgs'] != null ? new Imgs.fromJson(json['Imgs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EventName'] = this.eventName;
    data['Description'] = this.description;
    data['content'] = this.content;
    data['StartTime'] = this.startTime;
    data['EndTime'] = this.endTime;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['publishedAt'] = this.publishedAt;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.avatar != null) {
      data['avatar'] = this.avatar!.toJson();
    }
    if (this.videos != null) {
      data['Videos'] = this.videos!.toJson();
    }
    if (this.imgs != null) {
      data['Imgs'] = this.imgs!.toJson();
    }
    return data;
  }
}

class DataStatus {
  int? id;
  AttributesStatus? attributes;

  DataStatus({this.id, this.attributes});

  DataStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? new AttributesStatus.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Status {
  DataStatus? data;

  Status({this.data});

  Status.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataStatus.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AttributesStatus {
  String? statusName;
  Null? statusEnum;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  AttributesStatus(
      {this.statusName,
      this.statusEnum,
      this.createdAt,
      this.updatedAt,
      this.publishedAt});

  AttributesStatus.fromJson(Map<String, dynamic> json) {
    statusName = json['StatusName'];
    statusEnum = json['StatusEnum'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusName'] = this.statusName;
    data['StatusEnum'] = this.statusEnum;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['publishedAt'] = this.publishedAt;
    return data;
  }
}

class AttributesImg {
  String? name;
  Null? alternativeText;
  Null? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  Null? previewUrl;
  String? provider;
  Null? providerMetadata;
  String? createdAt;
  String? updatedAt;

  AttributesImg(
      {this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.formats,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.previewUrl,
      this.provider,
      this.providerMetadata,
      this.createdAt,
      this.updatedAt});

  AttributesImg.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? new Formats.fromJson(json['formats']) : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    providerMetadata = json['provider_metadata'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alternativeText'] = this.alternativeText;
    data['caption'] = this.caption;
    data['width'] = this.width;
    data['height'] = this.height;
    if (this.formats != null) {
      data['formats'] = this.formats!.toJson();
    }
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['size'] = this.size;
    data['url'] = this.url;
    data['previewUrl'] = this.previewUrl;
    data['provider'] = this.provider;
    data['provider_metadata'] = this.providerMetadata;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Formats {
  Thumbnail? thumbnail;
  Thumbnail? small;

  Formats({this.thumbnail, this.small});

  Formats.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    small =
        json['small'] != null ? new Thumbnail.fromJson(json['small']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    if (this.small != null) {
      data['small'] = this.small!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  Null? path;
  int? width;
  int? height;
  double? size;
  String? url;

  Thumbnail(
      {this.name,
      this.hash,
      this.ext,
      this.mime,
      this.path,
      this.width,
      this.height,
      this.size,
      this.url});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    path = json['path'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['width'] = this.width;
    data['height'] = this.height;
    data['size'] = this.size;
    data['url'] = this.url;
    return data;
  }
}

class Videos {
  Null? data;

  Videos({this.data});

  Videos.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
}

class Imgs {
  List<Data>? data;

  Imgs({this.data});

  Imgs.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({this.page, this.pageSize, this.pageCount, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    pageCount = json['pageCount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    data['pageCount'] = this.pageCount;
    data['total'] = this.total;
    return data;
  }
}
