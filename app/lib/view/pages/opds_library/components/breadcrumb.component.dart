import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viev_model/opds_library.cubit.dart';


class Breadcrumb extends StatelessWidget {
  const Breadcrumb({super.key});
  
  @override
  Widget build(BuildContext context) {
    final history = context.watch<OpdsLibraryCubit>().state.history;
    
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: history.length,
      itemBuilder: _buildLink,
      separatorBuilder: _buildSeparator,
    );
  }
  
  Widget _buildLink(BuildContext context, int index) {
    final history = context.watch<OpdsLibraryCubit>().state.history;
    final goToInHistory = context.read<OpdsLibraryCubit>().goToInHistory;
    final record = history[index];

    handleClick() {
        goToInHistory(index);
    }

    return InkWell(
      onTap: handleClick,
      child: Text(record.title),
    );
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Text('/'),
    );
  }
}