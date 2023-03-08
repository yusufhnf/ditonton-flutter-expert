import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../search.dart';

class TvSearchPage extends StatelessWidget {
  static const routeName = '/search-tv';

  const TvSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.search),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                context.read<TvSearchBloc>().add(OnGetSearchTv(query));
              },
              decoration: const InputDecoration(
                hintText: StringConstant.searchTitle,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              StringConstant.searchResult,
              style: kHeading6,
            ),
            BlocBuilder<TvSearchBloc, TvSearchState>(
              builder: (context, state) {
                if (state is TvSearchEmpty) {
                  return const Center(child: Text(StringConstant.dataEmpty));
                } else if (state is TvSearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvSearchSuccess) {
                  final result = state.tvResult;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final tv = state.tvResult[index];
                        return TvCard(tv);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
