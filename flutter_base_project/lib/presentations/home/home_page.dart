import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/data/response_model/anime_model.dart';
import 'package:flutter_base_project/presentations/home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeCubit();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<HomeCubit, HomeCubitState>(
          builder: (context, state) {
            if (state is HomeCubitInitial || state is HomeCubitLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if (state is HomeCubitLoaded) {
              return _buildListAnime(state.data ?? []);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _getData() {
    bloc.getFacts();
  }

  Widget _buildListAnime(List<AnimeModel> data) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = data[index];
          return ListTile(
            title: Text(item.title ?? ''),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: data.length);
  }
}
