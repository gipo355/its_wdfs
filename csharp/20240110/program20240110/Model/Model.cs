namespace Models;
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
public static class Products {

  public static void GetAll() {

    // read data
    var readCommand = new NpgsqlCommand("SELECT * FROM Products", Drivers.Postgres.Connection);
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
    var readCommand = new NpgsqlCommand("SELECT * FROM Products WHERE Id = @id1 ", Drivers.Postgres.Connection);

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

  public static void Update() { }

  public static void Delete() { }
}
