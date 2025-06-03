import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../user/presentation/bloc/user_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/domain/entities/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    final user = _getUser(context);
    _nameController = TextEditingController(text: user?.name ?? '');
  }

  User? _getUser(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      return authState.user;
    }
    final userState = context.read<UserBloc>().state;
    if (userState is UserProfileLoaded) {
      return userState.user;
    }
    return null;
  }

  void _onSave() {
    final name = _nameController.text.trim();
    if (name.isNotEmpty) {
      context.read<UserBloc>().add(UpdateUserProfileRequested(name));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully!')),
            );
          } else if (state is UserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final user = _getUser(context);
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                ),
                const SizedBox(height: 16),
                Text('Phone: ${user?.phoneNumber ?? ''}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onSave,
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
} 