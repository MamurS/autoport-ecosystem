import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/search_result_entity.dart';
import '../entities/search_params.dart';
import '../repositories/trip_repository.dart';

class GetMyTripsUseCase implements UseCase<SearchResultEntity, MyTripsParams> {
  final TripRepository repository;
  
  const GetMyTripsUseCase({required this.repository});
  
  @override
  Future<Either<Failure, SearchResultEntity>> call(MyTripsParams params) async {
    return await repository.getMyTrips(params);
  }
} 