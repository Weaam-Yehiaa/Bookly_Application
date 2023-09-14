import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean_architecture/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,NoParam>{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([Param]) {
    // check permission kan yb2a al case mofeed sa3tha
    return homeRepo.fetchFeaturedBooks();
  }
}
//kda b2olo ana hab3tlk type est3mlo gwa w param
abstract class UseCase<Type,Param>{
  Future<Either<Failure,Type>> call([Param ]);
}
class NoParam{}