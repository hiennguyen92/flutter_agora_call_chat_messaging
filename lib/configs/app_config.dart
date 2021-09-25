
import 'package:flutter_hiennv/services/network/network_config.dart';

enum EnvType { DEV, PROD }

class AppEnvConfig {
  factory AppEnvConfig({required EnvType envType}) {
    instance.envType = envType;
    switch (envType) {
      case EnvType.DEV:
        instance.networkConfig =
            NetworkConfig(baseUrl: 'https://hiennv-fake-api.herokuapp.com');
        break;
      case EnvType.PROD:
        instance.networkConfig =
            NetworkConfig(baseUrl: 'https://fake-api.hiennv.com');
        break;
      default:
        instance.networkConfig = NetworkConfig();
    }
    return instance;
  }

  AppEnvConfig._private();

  static final AppEnvConfig instance = AppEnvConfig._private();

  EnvType envType = EnvType.DEV;

  NetworkConfig networkConfig = NetworkConfig();
}