import 'package:bytes_delivery_app/features/catgegory/data/i_category_facade.dart';
import 'package:bytes_delivery_app/features/catgegory/presentation/provider/category_provider.dart';
import 'package:bytes_delivery_app/features/splash/presentation/view/splash_screen.dart';
import 'package:bytes_delivery_app/general/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                CategoryProvider(iCategoryFacade: sl<ICategoryFacade>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
