namespace Models;

using Drivers;
using Npgsql;

// public class Product {
//   public int Id { get; set; }
//   public string Name { get; set; }
//   public string Description { get; set; }
//   public double Price { get; set; }
//   public int Quantity { get; set; }
//   public double TaxRate { get; set; }
//   public Product() { }
// }

// public interface IProduct {
//   int Id { get; set; }
//   string Name { get; set; }
//   string Description { get; set; }
//   double Price { get; set; }
//   int Quantity { get; set; }
//   double TaxRate { get; set; }
// }
// public record Product {
//   int Id;
//   string Name;
//   string Description;
//   double Price;
//   int Quantity;
//   double TaxRate;
// }

// TODO: try linq?
// TODO: entity framework with migrations?
// TODO: methods should return a struct, record or class
public static class Products {

  public static void GetAll() {

    // read data
    var readCommand = new NpgsqlCommand("SELECT * FROM Products", Postgres.Connection);
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
  }

  public static void GetOne(int id) {
    // read data
    var readCommand = new NpgsqlCommand("SELECT * FROM Products WHERE Id = @id1 ", Postgres.Connection);

    readCommand.Parameters.AddWithValue("id1", id);

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


  }

  public static void Create() { }

  public static void UpdateOne(
    int id,
    string? name = null,
    string? description = null,
    double? price = null,
    int? quantity = null,
    double? taxRate = null
  ) {
    // TODO: must check for at least 1 value to update
    if (name is null && description is null && price is null && quantity is null && taxRate is null) {
      Console.WriteLine("No values to update");
      return;
    }

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

    var nRows = updateCommand.ExecuteNonQuery();

    Console.WriteLine(string.Format(null, "Number of rows updated={0}", nRows));

    // using (var command = new NpgsqlCommand("UPDATE Products SET quantity = @q WHERE name = @n", Postgres.Connection)) {
    //   command.Parameters.AddWithValue("n", "banana");
    //   command.Parameters.AddWithValue("q", 200);
    //   int nRows = command.ExecuteNonQuery();
    //   Console.Out.WriteLine(String.Format("Number of rows updated={0}", nRows));
    // }
  }

  public static void DeleteOne(
    int id
  ) {
    var deleteCommand = new NpgsqlCommand("DELETE FROM Products WHERE Id = @id1", Postgres.Connection);

    deleteCommand.Parameters.AddWithValue("id1", id);

    var nRows = deleteCommand.ExecuteNonQuery();

    Console.WriteLine(string.Format(null, "Number of rows deleted={0}", nRows));
  }
}
