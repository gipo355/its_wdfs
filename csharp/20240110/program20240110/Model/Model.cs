namespace Model;

public class Product {

  public int Id { get; set; }

  public string Name { get; set; }

  public string Description { get; set; }

  public double Price { get; set; }

  public int Quantity { get; set; }

  public double TaxRate { get; set; }

  public Product() { }
}

// using System.Collections.Generic;
// using Microsoft.EntityFrameworkCore;

// // namespace ConsoleApp.PostgreSQL {
// //
// public class BloggingContext : DbContext {
//   public DbSet<Blog> Blogs { get; set; }
//   public DbSet<Post> Posts { get; set; }

//   protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//       => optionsBuilder.UseNpgsql("Host=127.0.0.1;Database=csharp;Username=postgres;Password=admin123456");
// }

// public class Blog {
//   public int BlogId { get; set; }
//   public string Url { get; set; }

//   public List<Post> Posts { get; set; }
// }

// public class Post {
//   public int PostId { get; set; }
//   public string Title { get; set; }
//   public string Content { get; set; }

//   public int BlogId { get; set; }
//   public Blog Blog { get; set; }
// }
// }
