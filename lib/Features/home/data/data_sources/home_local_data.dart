import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource{
  List<BookEntity>fetchFeaturedBook();
  List<BookEntity>fetchNewestBooks();
}
class HomeLocalDataSourceIml extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBook() {
    // TODO: implement fetchFeaturedBook
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}