namespace Models.Product;
using Drivers;
using Npgsql;

public static partial class Products {
  public static async Task<IProduct> CreateOne(
  string name,
  string description,
  double price,
  int quantity,
  double taxRate

) {
    // TODO: must check for at least 1 value to update

    // prepare the string, keep comment as reference for multistring ternary
    var insertQuery = @$"
      INSERT INTO Products
        ( Name, Description, Price, Quantity, TaxRate )
      VALUES
        (
          @n1,
          @d1,
          @p1,
          @q1,
          @t1
        )
      RETURNING *;
    ";
    Console.WriteLine(insertQuery);

    // update data
    var updateCommand = new NpgsqlCommand(insertQuery, Postgres.Connection);


    updateCommand.Parameters.AddWithValue("n1", name);
    updateCommand.Parameters.AddWithValue("d1", description);
    updateCommand.Parameters.AddWithValue("p1", price);
    updateCommand.Parameters.AddWithValue("q1", quantity);
    updateCommand.Parameters.AddWithValue("t1", taxRate);

    var reader = await updateCommand.ExecuteReaderAsync();

    var products = new List<IProduct>();

    while (reader.Read()) {
      // Console.WriteLine(
      //     string.Format(
      //         null,
      //         @"Product inserted [
      //           id: {0},
      //           name: {1},
      //           Description: {2},
      //           price: {3},
      //           quantity: {4},
      //           taxrate: {5})
      //         ]",
      //         reader.GetInt32(0).ToString(),
      //         reader.GetString(1),
      //         reader.GetString(2),
      //         reader.GetFloat(3).ToString(),
      //         reader.GetInt32(4).ToString(),
      //         reader.GetFloat(5).ToString()
      //         )
      //     );

      var product = new Product(
        id: reader.GetInt32(0),
        name: reader.GetString(1),
        description: reader.GetString(2),
        price: reader.GetFloat(3),
        quantity: reader.GetInt32(4),
        taxRate: reader.GetFloat(5)
      );

      products.Add(product);

    }

    reader.Close();

    return products[0];

    // using (var command = new NpgsqlCommand("UPDATE Products SET quantity = @q WHERE name = @n", Postgres.Connection)) {
    //   command.Parameters.AddWithValue("n", "banana");
    //   command.Parameters.AddWithValue("q", 200);
    //   int nRows = command.ExecuteNonQuery();
    //   Console.Out.WriteLine(String.Format("Number of rows updated={0}", nRows));
    // }

  }

}
