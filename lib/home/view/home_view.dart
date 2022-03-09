import 'package:bloc_example/core/constans/string_constans.dart';
import 'package:bloc_example/home/service/home_service.dart';
import 'package:bloc_example/home/viewmodel/home_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
          homeService:
              HomeService(Dio(BaseOptions(baseUrl: StringConstans.baseUrl)))),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: context.read<HomeCubit>().isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 700,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount:
                              context.read<HomeCubit>().model?.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 10,
                              child: Column(
                                children: [
                                  Text(context
                                          .read<HomeCubit>()
                                          .model
                                          ?.data?[index]
                                          .firstName ??
                                      '1'),
                                  Text(context
                                          .read<HomeCubit>()
                                          .model
                                          ?.data?[index]
                                          .lastName ??
                                      ''),
                                  Image(
                                      fit: BoxFit.scaleDown,
                                      image: NetworkImage(context
                                              .read<HomeCubit>()
                                              .model
                                              ?.data?[index]
                                              .avatar ??
                                          ''))
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
