import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/car_remote_datasource.dart';
import '../../data/repositories/car_repository_impl.dart';
import '../../domain/usecases/add_car_usecase.dart';
import '../../domain/usecases/delete_car_usecase.dart';
import '../../domain/usecases/get_my_cars_usecase.dart';
import '../../domain/usecases/update_car_usecase.dart';
import '../bloc/car_bloc.dart';

class CarProvider extends StatelessWidget {
  final Widget child;

  const CarProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CarRemoteDataSource>(
          create: (context) => CarRemoteDataSourceImpl(
            apiClient: context.read<ApiClient>(),
          ),
        ),
        RepositoryProvider<CarRepositoryImpl>(
          create: (context) => CarRepositoryImpl(
            remoteDataSource: context.read<CarRemoteDataSource>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CarBloc>(
            create: (context) => CarBloc(
              getMyCarsUseCase: GetMyCarsUseCase(
                repository: context.read<CarRepositoryImpl>(),
              ),
              addCarUseCase: AddCarUseCase(
                repository: context.read<CarRepositoryImpl>(),
              ),
              updateCarUseCase: UpdateCarUseCase(
                repository: context.read<CarRepositoryImpl>(),
              ),
              deleteCarUseCase: DeleteCarUseCase(
                repository: context.read<CarRepositoryImpl>(),
              ),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
} 