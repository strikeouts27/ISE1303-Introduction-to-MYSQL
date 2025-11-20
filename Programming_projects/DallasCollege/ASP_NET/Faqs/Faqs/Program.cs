using Microsoft.EntityFrameworkCore;
using Faqs.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Add EF Core DI 
builder.Services.AddDbContext<FaqsContext>(options => options.UseSqlServer(
    builder.Configuration.GetConnectionString("FaqsContext"))); 

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseRouting();

app.UseAuthorization();

app.MapStaticAssets();

// The default way of doing things. 
// app.MapControllerRoute(
//     name: "default",
//     pattern: "{controller=Home}/{action=Index}/{id?}")
//     .WithStaticAssets();

// The updated way of doing things. 
// In Program.cs we also have to update endpoints so that it understands what to do. 
// This is where we can update what the default route is by well.... default. In this case 
// we made it where the topic and category don't have to be required for the website to be in default mode. 
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{topic?}/{category?}")
    .WithStaticAssets();

app.Run();
