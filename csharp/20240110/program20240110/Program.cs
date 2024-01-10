namespace Program;

using Npgsql;

public static class Program {
  public static void Main() {
    Console.Out.WriteLine("Opening connection");
    var psqlConnection = new NpgsqlConnection(Drivers.Postgres.ConnectionString);
    psqlConnection.Open();



    // insert some data
    var insert = new NpgsqlCommand(@"
    INSERT INTO Products (Name, Description, Price, Quantity, TaxRate)
    VALUES (@n1, @d1, @p1, @q1, @t1), (@n1, @d1, @p1, @q1, @t1), (@n1, @d1, @p1, @q1, @t1)
    ", psqlConnection);

    insert.Parameters.AddWithValue("n1", "banana");
    insert.Parameters.AddWithValue("d1", "banana");
    insert.Parameters.AddWithValue("p1", 5.99);
    insert.Parameters.AddWithValue("q1", 15);
    insert.Parameters.AddWithValue("t1", 0.15);

    var nRows = insert.ExecuteNonQuery();

    Console.WriteLine(string.Format(null, "Number of rows inserted={0}", nRows));

    // read data
    var readCommand = new NpgsqlCommand("SELECT * FROM Products", psqlConnection);
    var reader = readCommand.ExecuteReader();
    Console.WriteLine("Reading data");
    while (reader.Read()) {
      Console.WriteLine(
          string.Format(
              null,
              @"Product number {0} [
                name: {1},
                Description: {2},
                price: {3},
                quantity: {4},
                taxrate: {5})
                ]",
              reader.GetInt32(0).ToString(),
              reader.GetString(1),
              reader.GetString(2),
              reader.GetFloat(3).ToString(),
              reader.GetInt32(4).ToString(),
              reader.GetFloat(5).ToString()
              )
          );
    }

    // close the connection
    reader.Close();


    Console.WriteLine("Closing connection");
    psqlConnection.Close();
  }

}
