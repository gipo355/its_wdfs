namespace Models.Product;
using Drivers;
using Npgsql;

public static partial class Products {
  public static async Task<IProduct?> UpdateOne(
    int id,
    string? name = null,
    string? description = null,
    double? price = null,
    int? quantity = null,
    double? taxRate = null
  ) {
    Console.WriteLine("###### Updating all product ######");
    await Task.Delay(1000);

    // TODO: must check for at least 1 value to update
    if (name is null && description is null && price is null && quantity is null && taxRate is null) {
      Console.WriteLine("No values to update");
      return null;
    }

    Console.WriteLine("###### Updating one product ######");
    await Task.Delay(1000);

    var setQueryList = new List<string>(){
      name != null ? "Name = @n1" : "",
      description != null ? "Description = @d1" : "",
      price != null ? "Price = @p1" : "",
      quantity != null ? "Quantity = @q1" : "",
      taxRate != null ? "TaxRate = @t1" : "",
    };

    var setQueryString = string.Join(", ", setQueryList.Where(x => x != ""));

    // prepare the string, keep comment as reference for multistring ternary
    // var queryString = @$"
    //   UPDATE Products
    //   SET
    //     {(name != null ? "Name = @n1" : "")}
    //     {(description != null ? "Description = @d1" : "")}
    //     {(price != null ? "Price = @p1," : "")}
    //     {(quantity != null ? "Quantity = @q1," : "")}
    //     {(taxRate != null ? "TaxRate = @t1," : "")}
    //   WHERE Id = @id1
    // ";
    var queryString = @$"
      UPDATE Products
      SET {setQueryString}
      WHERE Id = @id1
      RETURNING *;
    ";
    Console.WriteLine(queryString);

    // update data
    var updateCommand = new NpgsqlCommand(queryString, Postgres.Connection);

    updateCommand.Parameters.AddWithValue("id1", id);

    if (name != null)
      updateCommand.Parameters.AddWithValue("n1", name);
    if (description != null)
      updateCommand.Parameters.AddWithValue("d1", description);
    if (price != null)
      updateCommand.Parameters.AddWithValue("p1", price);
    if (quantity != null)
      updateCommand.Parameters.AddWithValue("q1", quantity);
    if (taxRate != null)
      updateCommand.Parameters.AddWithValue("t1", taxRate);

    var reader = await updateCommand.ExecuteReaderAsync();


    var products = new List<IProduct>();

    while (reader.Read()) {
      Console.WriteLine(
          string.Format(
              null,
              @"Product inserted [
                id: {0},
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

      products.Add(new Product(
        id: reader.GetInt32(0),
        name: reader.GetString(1),
        description: reader.GetString(2),
        price: reader.GetFloat(3),
        quantity: reader.GetInt32(4),
        taxRate: reader.GetFloat(5)
      ));
    }

    return products[0];

    // using (var command = new NpgsqlCommand("UPDATE Products SET quantity = @q WHERE name = @n", Postgres.Connection)) {
    //   command.Parameters.AddWithValue("n", "banana");
    //   command.Parameters.AddWithValue("q", 200);
    //   int nRows = command.ExecuteNonQuery();
    //   Console.Out.WriteLine(String.Format("Number of rows updated={0}", nRows));
    // }
  }
}
