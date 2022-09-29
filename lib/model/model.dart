class BooksApiModel {
  String? error;
  String? total;
  List<Books>? books;

  BooksApiModel({this.error, this.total, this.books});

  BooksApiModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    total = json['total'];
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = error;
    data['total'] = total;
    if (books != null) {
      data['books'] = books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  String? title;
  String? subtitle;
  String? isbn13;
  String? price;
  String? image;
  String? url;

  Books(
      {this.title,
      this.subtitle,
      this.isbn13,
      this.price,
      this.image,
      this.url});

  Books.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    isbn13 = json['isbn13'];
    price = json['price'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['isbn13'] = isbn13;
    data['price'] = price;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}

class DetailBookData {
  String? error;
  String? title;
  String? subtitle;
  String? authors;
  String? publisher;
  String? language;
  String? isbn10;
  String? isbn13;
  String? pages;
  String? year;
  String? rating;
  String? desc;
  String? price;
  String? image;
  String? url;
  Pdf? pdf;

  DetailBookData(
      {this.error,
      this.title,
      this.subtitle,
      this.authors,
      this.publisher,
      this.language,
      this.isbn10,
      this.isbn13,
      this.pages,
      this.year,
      this.rating,
      this.desc,
      this.price,
      this.image,
      this.url,
      this.pdf});

  DetailBookData.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    title = json['title'];
    subtitle = json['subtitle'];
    authors = json['authors'];
    publisher = json['publisher'];
    language = json['language'];
    isbn10 = json['isbn10'];
    isbn13 = json['isbn13'];
    pages = json['pages'];
    year = json['year'];
    rating = json['rating'];
    desc = json['desc'];
    price = json['price'];
    image = json['image'];
    url = json['url'];
    pdf = json['pdf'] != null ? new Pdf.fromJson(json['pdf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = error;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['authors'] = authors;
    data['publisher'] = publisher;
    data['language'] = language;
    data['isbn10'] = isbn10;
    data['isbn13'] = isbn13;
    data['pages'] = pages;
    data['year'] = year;
    data['rating'] = rating;
    data['desc'] = desc;
    data['price'] = price;
    data['image'] = image;
    data['url'] = url;
    if (pdf != null) {
      data['pdf'] = pdf!.toJson();
    }
    return data;
  }
}

class Pdf {
  String? freeEBook;

  Pdf({this.freeEBook});

  Pdf.fromJson(Map<String, dynamic> json) {
    freeEBook = json['Free eBook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Free eBook'] = freeEBook;
    return data;
  }
}
