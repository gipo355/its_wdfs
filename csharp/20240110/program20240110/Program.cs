namespace Program;

using Models.Product;

public static class Program {
  public static async Task Main() {

    // TODO: add command line commands for CRUD

    Console.WriteLine("Init");

    await Products.GetAll();
    await Products.GetOne(id: 1);
    await Products.DeleteOne(id: 2);
    await Products.CreateOne(name: "new", description: "new", price: 1.99, quantity: 1, taxRate: 0.22);
    await Products.UpdateOne(id: 1, name: "changed", description: "changed", price: 1.99, quantity: 1, taxRate: 0.22);

  }

}
