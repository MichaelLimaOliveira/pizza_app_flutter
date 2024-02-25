import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/app.dart';
import 'package:pizza_app/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

import 'firebase_options.dart';

void main() async {
// A função WidgetsFlutterBinding.ensureInitialized() é utilizada no Flutter para garantir que a infraestrutura
// básica do framework esteja inicializada antes de executar o restante do código.
// Quando você utiliza essa função, você está garantindo que o sistema de bindings do Flutter
// (responsável por conectar o código Dart ao ambiente de execução do Flutter) esteja totalmente inicializado e
// pronto para ser utilizado. Isso é particularmente útil quando você precisa inicializar recursos que dependem do
// ambiente de execução do Flutter, como plugins, serviços nativos, ou até mesmo recursos do Flutter em si.
// Um cenário comum onde isso é utilizado é ao inicializar plugins que dependem do contexto da aplicação ou
// do ambiente nativo, como plugins que lidam com permissões, sensores, etc.
// Em resumo, WidgetsFlutterBinding.ensureInitialized() é uma prática comum para garantir que o ambiente do Flutter
// esteja totalmente preparado antes de iniciar a execução do restante do código da aplicação.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}
