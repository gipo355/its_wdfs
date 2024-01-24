namespace Controllers.Animals;

public static partial class AnimalsController
{
  public static RouteGroupBuilder MapAnimalsApi(this RouteGroupBuilder group)
  {
    group.MapGet("/", GetAllAnimals);
    group.MapGet("/{id}", GetOneAnimal);
    group.MapPost("/", CreateOneAnimal);
    group.MapPatch("/{id}", UpdateOneAnimal);
    group.MapDelete("/{id}", DeleteOneAnimal);

    return group;
  }
}
