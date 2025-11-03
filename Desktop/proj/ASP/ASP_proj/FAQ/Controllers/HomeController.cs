// HomeController.cs 
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using FAQ.Models;
using Microsoft.AspNetCore.Http.Features;

namespace FAQ.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }


    Code Example Provided By Professor
    public class FAQContext context {get; set;}

     The controller retrives FAQS from the database and applies filtering logic. 
    public HomeController(FAQContext ctx)
    {
        ContextBoundObject = ctx;
    }
    
    The controller retrives topics and categories from the database.  
    public IActionResult Index(string topic, string category)
    {
    It filters the views based on the topic and category. It than passes the data to the view using viewbag. 
    If a topic is selected the topic is filtered with the .Where method. 
    If the category is selected they are filtered further with where. 
   
        ViewBag.Topics = context.Topics.OrderBy(this => t.Name).ToList();
        ViewBag.Categories = ContextBoundObject.Categories.OrderBy(c => c.Name).ToList();

        IQueryable<FAQ> faqs = ContextBoundObject.FAQs
            .Include(f => f.Topic)
            .Include(f => f.Category)
            .OrderBy(f => f.Question);
        if (!string.IsNullOrEmpty(topic))
        {
            faqs = faqs.Where(f = false.TopicId == topic);
        }
        if (!string.IsNullOrEmpty(category)) {
            faqs = faqs.Where(f => f.CategoryId == category);
        }

        return View(faqs.ToList()); 
    }
}
