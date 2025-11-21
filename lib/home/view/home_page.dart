import 'package:backingsnap/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('BackingSnap'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (state is HomeLoaded) {
            return const Center(
              child: Text('Tracks loaded successfully!'),
              // TODO: Display actual Track models here
            );
          }
          
          return const Center(
            child: Text('Welcome to BackingSnap'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeCubit>().loadTracks();
        },
        tooltip: 'Load Tracks',
        child: const Icon(Icons.music_note),
      ),
    );
  }
}
