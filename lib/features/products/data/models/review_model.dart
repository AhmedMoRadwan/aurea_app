class ReviewResponse {
  final dynamic message;
  final dynamic averageRating;
  final dynamic reviewsCount;
  final ReviewList reviews;

  ReviewResponse({
    required this.message,
    required this.averageRating,
    required this.reviewsCount,
    required this.reviews,
  });

  factory ReviewResponse.fromJson(Map<String, dynamic> json) {
    return ReviewResponse(
      message: json['message'],
      averageRating: json['averageRating'],
      reviewsCount: json['reviewsCount'],
      reviews: ReviewList.fromJson(json['reviews']),
    );
  }
}

class ReviewList {
  final List<ReviewItem> items;
  final int page;
  final int pageSize;
  final int totalCount;
  final bool hasNextPage;
  final bool hasPreviousPage;

  ReviewList({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory ReviewList.fromJson(Map<String, dynamic> json) {
    return ReviewList(
      items: (json['items'] as List).map((e) => ReviewItem.fromJson(e)).toList(),
      page: json['page'],
      pageSize: json['pageSize'],
      totalCount: json['totalCount'],
      hasNextPage: json['hasNextPage'],
      hasPreviousPage: json['hasPreviousPage'],
    );
  }
}

class ReviewItem {
  final String comment;
  final int rating;
  final String createdAt;
  final String userName;
  final dynamic userPicture;

  ReviewItem({
    required this.comment,
    required this.rating,
    required this.createdAt,
    required this.userName,
    required this.userPicture,
  });

  factory ReviewItem.fromJson(Map<String, dynamic> json) {
    return ReviewItem(
      comment: json['comment'],
      rating: json['rating'],
      createdAt: json['createdAt'],
      userName: json['userName'],
      userPicture: json['userPicture'],
    );
  }
}
