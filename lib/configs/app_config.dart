

enum EnvType { DEV, PROD }

class AppEnvConfig {
  factory AppEnvConfig({required EnvType envType}) {
    instance.envType = envType;
    switch (envType) {
      case EnvType.DEV:
        break;
      case EnvType.PROD:
        break;
      default:
    }
    return instance;
  }

  AppEnvConfig._private();

  static final AppEnvConfig instance = AppEnvConfig._private();

  EnvType envType = EnvType.DEV;

}