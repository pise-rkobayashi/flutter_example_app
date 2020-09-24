import 'package:flutter_sample_app/data/network/api.dart';
import 'package:flutter_sample_app/repository/precious_data_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final repositoryComponents = <SingleChildWidget>[
  Provider(
    create: (context) => PreciousDataRepository(
      context.read<Api>(),
    ),
  ),
];
