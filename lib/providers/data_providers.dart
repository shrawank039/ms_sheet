import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/agents_repository.dart';

final agentsDataProvider = FutureProvider<AgentsRepository>((ref) async {
  return ref.read(agentsProvider);
});
