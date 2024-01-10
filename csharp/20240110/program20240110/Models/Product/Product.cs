namespace Models.Product;

// TODO: try linq?
// TODO: convert entity framework with migrations?
// TODO: methods should return a struct, record or class

public interface IProductInput {
  string Name { get; set; }
  string Description { get; set; }
  double Price { get; set; }
  int Quantity { get; set; }
  double TaxRate { get; set; }
}
public interface IProduct : IProductInput {
  int Id { get; set; }
}

public class ProductInput(
  string name,
  string description,
  double price,
  int quantity,
  double taxRate
  ) : IProductInput {

  public string Name { get; set; } = name;
  public string Description { get; set; } = description;
  public double Price { get; set; } = price;
  public int Quantity { get; set; } = quantity;
  public double TaxRate { get; set; } = taxRate;
}
public class Product(
  int id,
  string name,
  string description,
  double price,
  int quantity,
  double taxRate
  ) : IProduct {
  public int Id { get; set; } = id;
  public string Name { get; set; } = name;
  public string Description { get; set; } = description;
  public double Price { get; set; } = price;
  public int Quantity { get; set; } = quantity;
  public double TaxRate { get; set; } = taxRate;
}

