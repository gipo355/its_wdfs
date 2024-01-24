using Controllers.Animals;
using Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<AppDbContext>();

// Middlewere
// builder.Services.AddSession(options =>
// {
//   options.Cookie.Name = ".AdventureWorks.Session";
//   options.IdleTimeout = TimeSpan.FromSeconds(10);
//   options.Cookie.IsEssential = true;
// });

var app = builder.Build();

// app.UseSession();
app.UseCors();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
  app.UseSwagger();
  app.UseSwaggerUI();
}

app.UseHttpsRedirection();

var summaries = new[]
{
  "Freezing",
  "Bracing",
  "Chilly",
  "Cool",
  "Mild",
  "Warm",
  "Balmy",
  "Hot",
  "Sweltering",
  "Scorching"
};

app.MapGet(
    "/weatherforecast",
    () =>
    {
      var forecast = Enumerable
        .Range(1, 5)
        .Select(index => new WeatherForecast(
          DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
          Random.Shared.Next(-20, 55),
          summaries[Random.Shared.Next(summaries.Length)]
        ))
        .ToArray();
      return forecast;
    }
  )
  .WithName("GetWeatherForecast")
  .WithOpenApi();

app.MapGroup("/api/v1/animals").MapAnimalsApi();

app.Run();

record WeatherForecast(DateOnly Date, int TemperatureC, string? Summary)
{
  public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}
