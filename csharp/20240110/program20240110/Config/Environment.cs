namespace Config;
using dotenv.net;

public static class Environment {
  public static IDictionary<string, string> EnvVars { get; }

  private static void LoadEnv() => DotEnv.Load(options: new DotEnvOptions(envFilePaths: new[] { "../.env" }));

  // public static Load() {
  //   LoadEnv();
  //   EnvVars = DotEnv.Read();
  // }


  // public void Load() {
  //   LoadEnv();
  //   EnvVars = DotEnv.Read();
  // }

  static Environment() {
    LoadEnv();
    EnvVars = DotEnv.Read();
  }

}
