//
// import 'package:bookly_app_clean_architecture/Features/home/data/models/book_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
//
// import '../../../../core/errors/failures.dart';
// import 'home_repo.dart';
//
// class HomeRepoImp implements HomeRepo{
//   final ApiService apiService;
//
//   HomeRepoImp(this.apiService);
//
//   @override
//   Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
//     try {
//       var data=await apiService.get(
//           endPoint:
//         'volumes?Filtering=free-ebooks&Sorting=newest &subject=subject:Programming&q=computer science');
//       List<BookModel>books=[];
//       for(var item in data['items']){
//         books.add(BookModel.fromJson(item));
//       }
//       return right(books);
//     } catch (e) {
//      if(e is DioException){
//        return left(ServerFailure.fromDioError(e));
//      }
//      return left(ServerFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
//     try {
//       var data=await apiService.get(
//           endPoint:
//           'volumes?Filtering=free-ebooks&subject=subject:Programming&q=computer science');
//       List<BookModel>books=[];
//       for(var item in data['items']){
//         books.add(BookModel.fromJson(item));
//       }
//       return right(books);
//     } catch (e) {
//       if(e is DioException){
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }
//
// }