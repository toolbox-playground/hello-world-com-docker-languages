using dotnet.Models;

var builder = WebApplication.CreateBuilder(args); // Cria uma instância do WebApplicationBuilder usando os argumentos fornecidos

var app = builder.Build(); // Constrói a aplicação web com base na instância do WebApplicationBuilder

app.UseStaticFiles(); // Configura a aplicação para usar arquivos estáticos, como arquivos CSS, JavaScript e imagens

app.MapGet("/", () => Results.Redirect("/index.html")); // Mapeia a rota raiz ("/") para redirecionar para a página "index.html"

app.MapGet("/api/customers", () =>
{
    Customer[] customers = [ new Customer(1, "Thiago", DateTime.Now.AddYears(-30)) ];

    return Results.Ok(customers);
});

app.MapGet("/api/customers/{id}", (int id) =>
{
    Customer[] customers = [new Customer(1, "Thiago", DateTime.Now.AddYears(-30))];

    var customer = customers.SingleOrDefault(c => c.Id == id);

    if (customer is null)
        return Results.NotFound();

    return Results.Ok(customer);
});

app.Run(); // Executa a aplicação web