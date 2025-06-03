import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/search_result_entity.dart';
import '../entities/search_params.dart';
import '../repositories/trip_repository.dart';

class SearchTripsUseCase implements UseCase<SearchResultEntity, SearchTripsParams> {
  final TripRepository repository;
  
  const SearchTripsUseCase({required this.repository});
  
  @override
  Future<Either<Failure, SearchResultEntity>> call(SearchTripsParams params) async {
    return await repository.searchTrips(params);
  }
} 