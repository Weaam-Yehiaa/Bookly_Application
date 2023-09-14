import 'package:bookly_app_clean_architecture/Features/home/data/models/book_model.dart';
import 'package:bookly_app_clean_architecture/constants.dart';
import 'package:bookly_app_clean_architecture/core/utils/functions/save_books.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/api_services.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>>fetchFeaturedBook();
  Future<List<BookEntity>>fetchNewestBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBook() async {
    var data =await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=computer science');
    List<BookEntity> books = getBooksList(data);

    saveBooksData(books,kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data =await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity>books=[];
    for(var bookMap in data['items'])
    {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

}