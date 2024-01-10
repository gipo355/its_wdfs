namespace Model;

// public class Product {

//   public int Id { get; set; }

//   public string Name { get; set; }

//   public string Description { get; set; }

//   public double Price { get; set; }

//   public int Quantity { get; set; }

//   public double TaxRate { get; set; }

//   public Product() { }
// }

public interface IProduct {
  int Id { get; set; }
  string Name { get; set; }
  string Description { get; set; }
  double Price { get; set; }
  int Quantity { get; set; }
  double TaxRate { get; set; }
}

public class Products {
  public void Get() { }

  public void Get(int id) { }

  public void Create() { }

  public void Update() { }

  public void Delete() { }


}
