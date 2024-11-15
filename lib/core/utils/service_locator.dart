import 'package:get_it/get_it.dart';
import 'package:masroofy/features/overview/data/repos/overview_repo_impl.dart';
import 'package:masroofy/features/wallet/data/repos/wallet_repo_impl.dart';

import '../../features/add_categorie/data/repo/add_category_repo_impl.dart';
import '../../features/add_transaction/data/repos/add_transaction_repo_impl.dart';
import '../../features/categories/data/repos/categories_repo_impl.dart';
import '../../features/goals/data/repos/goal_repo_impl.dart';
import 'database_service.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<DatabaseService>(DatabaseService());
  getIt.registerSingleton<OverviewRepoImpl>(OverviewRepoImpl(getIt.get<DatabaseService>()));
  getIt.registerSingleton<WalletRepoImpl>(WalletRepoImpl(getIt.get<DatabaseService>()));
  getIt.registerSingleton<GoalRepoImpl>(GoalRepoImpl(getIt.get<DatabaseService>()));
  getIt.registerSingleton<CategoriesRepoImpl>(CategoriesRepoImpl(getIt.get<DatabaseService>()));
  getIt.registerSingleton<AddCategoryRepoImpl>(AddCategoryRepoImpl(getIt.get<DatabaseService>()));
  getIt.registerSingleton<AddTransactionRepoImpl>(AddTransactionRepoImpl(getIt.get<DatabaseService>()));
}