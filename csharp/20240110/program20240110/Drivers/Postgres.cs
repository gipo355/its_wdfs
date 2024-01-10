namespace Drivers;
using Npgsql;

public class Postgres {
  // Obtain connection string information from the portal
  private static readonly string Host = Config.Environment.EnvVars["HOST"];
  private static readonly string User = Config.Environment.EnvVars["USERNAME"];
  private static readonly string DBname = Config.Environment.EnvVars["DATABASE"];
  private static readonly string Password = Config.Environment.EnvVars["PASSWORD"];
  private static readonly string Port = Config.Environment.EnvVars["PORT"];

  public static NpgsqlConnection? Connection { get; }

  public static readonly string ConnectionString =
      string.Format(
          null,
          "Server={0};Username={1};Database={2};Port={3};Password={4};SSLMode=Prefer",
          Host,
          User,
          DBname,
          Port,
          Password);

  // drop table for testing
  static Postgres() {
    try {
      Connection = new NpgsqlConnection(ConnectionString);
      Console.Out.WriteLine("Opening connection: Postgres");
      Connection?.Open();

      // non critical exception handling, skip if not dev
      try {
        var isDev = Config.Environment.EnvVars["DEV"];
        if (isDev is "true") {
          var dropTableCommand = new NpgsqlCommand("DROP TABLE IF EXISTS Products", Connection);
          dropTableCommand.ExecuteNonQuery();
          Console.Out.WriteLine("Finished dropping table (if existed)");
        }
      } catch (Exception e) {
        Console.WriteLine(e.Message);
      }

      // create the table if not exists
      Console.Out.WriteLine("Creating table if not exists: Products");
      new NpgsqlCommand("CREATE TABLE IF NOT EXISTS Products(Id serial PRIMARY KEY, Name VARCHAR(50), Description VARCHAR(255), Price FLOAT, Quantity INTEGER, TaxRate FLOAT)", Connection)
      .ExecuteNonQuery();
    } catch (Exception e) {
      Console.WriteLine(e.Message);
    }

    // insert some data
    Console.WriteLine("Inserting dummy data: Postgres");
    var insert = new NpgsqlCommand(@"
    INSERT INTO Products (Name, Description, Price, Quantity, TaxRate)
    VALUES (@n1, @d1, @p1, @q1, @t1), (@n1, @d1, @p1, @q1, @t1), (@n1, @d1, @p1, @q1, @t1)
    ", Connection);

    insert.Parameters.AddWithValue("n1", "banana");
    insert.Parameters.AddWithValue("d1", "banana");
    insert.Parameters.AddWithValue("p1", 5.99);
    insert.Parameters.AddWithValue("q1", 15);
    insert.Parameters.AddWithValue("t1", 0.15);

    var nRows = insert.ExecuteNonQuery();

    Console.WriteLine(string.Format(null, "Number of rows inserted={0}", nRows));

    AppDomain.CurrentDomain.ProcessExit += (s, e) => {
      if (Connection != null) {
        Connection.Close();
        Console.WriteLine("Closing connection Postgres");
      }
    };
  }
}
