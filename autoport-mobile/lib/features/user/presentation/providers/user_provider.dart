import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/user_remote_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/usecases/get_current_user_profile_usecase.dart';
import '../../domain/usecases/update_user_profile_usecase.dart';
import '../bloc/user_bloc.dart';
import '../../../../core/network/api_client.dart';

class UserProvider extends StatelessWidget {
  final Widget child;

  const UserProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRemoteDataSource>(
          create: (context) => UserRemoteDataSourceImpl(apiClient: context.read<ApiClient>()),
        ),
        RepositoryProvider<UserRepositoryImpl>(
          create: (context) => UserRepositoryImpl(remoteDataSource: context.read<UserRemoteDataSource>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(
              getCurrentUserProfileUseCase: GetCurrentUserProfileUseCase(repository: context.read<UserRepositoryImpl>()),
              updateUserProfileUseCase: UpdateUserProfileUseCase(repository: context.read<UserRepositoryImpl>()),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
} 