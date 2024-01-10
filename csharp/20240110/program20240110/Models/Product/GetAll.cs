namespace Models.Product;
using Drivers;
using Npgsql;

public static partial class Products {
  public static async Task<List<IProduct>> GetAll() {
    // read data
    var readCommand = new NpgsqlCommand("SELECT * FROM Products", Postgres.Connection);
    var reader = await readCommand.ExecuteReaderAsync();
    Console.WriteLine("Reading data");

    var products = new List<IProduct>();
    while (await reader.ReadAsync()) {
      // Console.WriteLine(
      //     string.Format(
      //         null,
      //         @"Product number {0} [
      //           name: {1},
      //           Description: {2},
      //           price: {3},
      //           quantity: {4},
      //           taxrate: {5})
      //           ]",
      //         reader.GetInt32(0).ToString(),
      //         reader.GetString(1),
      //         reader.GetString(2),
      //         reader.GetFloat(3).ToString(),
      //         reader.GetInt32(4).ToString(),
      //         reader.GetFloat(5).ToString()
      //         )
      //     );

      products.Add(new Product(
        id: reader.GetInt32(0),
        name: reader.GetString(1),
        description: reader.GetString(2),
        price: reader.GetFloat(3),
        quantity: reader.GetInt32(4),
        taxRate: reader.GetFloat(5)
      ));
    }
    // close the connection
    reader.Close();

    return products;
  }

}
