namespace Config;
using dotenv.net;

public class Environment {
  public static IDictionary<string, string> EnvVars { get; }

  private static void LoadEnv() => DotEnv.Load(options: new DotEnvOptions(envFilePaths: new[] { "../.env" }));

  static Environment() {
    LoadEnv();
    EnvVars = DotEnv.Read();
  }

}
