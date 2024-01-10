namespace Drivers;
using Npgsql;

public class Postgres {
  // Obtain connection string information from the portal
  private static readonly string Host = Config.Environment.EnvVars["HOST"];
  private static readonly string User = Config.Environment.EnvVars["USERNAME"];
  private static readonly string DBname = Config.Environment.EnvVars["DATABASE"];
  private static readonly string Password = Config.Environment.EnvVars["PASSWORD"];
  private static readonly string Port = Config.Environment.EnvVars["PORT"];

  public static NpgsqlConnection Connection { get; }

  public static readonly string ConnectionString =
      string.Format(
          null,
          "Server={0};Username={1};Database={2};Port={3};Password={4};SSLMode=Prefer",
          Host,
          User,
          DBname,
          Port,
          Password);

  static Postgres() {
    Console.Out.WriteLine("Opening connection: Postgres");
    Connection = new NpgsqlConnection(ConnectionString);
    Connection.Open();

    // create the table if not exists
    Console.Out.WriteLine("Creating table if not exists: Products");
    new NpgsqlCommand("CREATE TABLE IF NOT EXISTS Products(Id serial PRIMARY KEY, Name VARCHAR(50), Description VARCHAR(255), Price FLOAT, Quantity INTEGER, TaxRate FLOAT)", Connection)
    .ExecuteNonQuery();

  }

}
