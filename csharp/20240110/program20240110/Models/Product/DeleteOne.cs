namespace Models.Product;
using Drivers;
using Npgsql;


public static partial class Products {
  public static async Task DeleteOne(
    int id
  ) {

    Console.WriteLine("###### Deleting one product ######");
    await Task.Delay(1000);
    var deleteCommand = new NpgsqlCommand("DELETE FROM Products WHERE Id = @id1", Postgres.Connection);

    deleteCommand.Parameters.AddWithValue("id1", id);

    var nRows = await deleteCommand.ExecuteNonQueryAsync();

    Console.WriteLine(string.Format(null, "Number of rows deleted={0}", nRows));
  }
}
