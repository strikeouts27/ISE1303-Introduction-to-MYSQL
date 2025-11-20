using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Faqs.Models;
using Microsoft.EntityFrameworkCore;



public class HomeController : Controller
{   
    // Home Controller class must take up the entire file you cannot have classes outside of it. 
    // this code says go get the database information. 
    // we have this get set private will limit the access that this context can be used. 
    private FaqsContext context { get; set; }

    public HomeController(FaqsContext ctx)
    {
        context = ctx;
    }

    // topic and question are passed in as parameters because we need to know what topic and category the user selected for queries. 
    [Route("/")]
    [Route("topic/{topic}")]
    [Route("category/{category}")]
    [Route("topic/{topic}/category/{category}")]

    public IActionResult Index(string topic, string category)
    {
        
        ViewBag.Topics = context.Topics.OrderBy(t => t.Name).ToList();
        ViewBag.Categories = context.Categories.OrderBy(c => c.Name).ToList();
        // Iqueryable sets up the capabilites for Linq search queries. 
        // the f is an alias for the iteration variable. the arrow is a lambda expression that 
        // cycles through each of the topics and categories to find the one the client reuqested.
        // IQueryable search paramater must match the model class it is grabbing data from.  
        IQueryable<FAQ> faqs = context.FAQs
        .Include(f => f.Topic)
        .Include(f => f.Category)
        .OrderBy(f => f.Question);

        if (!string.IsNullOrEmpty(topic))
        {
            // the Where paranthesis must encompass the entire search. otherwise cannot conver ttype string to bool. 
            faqs = faqs.Where(f => f.TopicId == topic);
        }
        if (!string.IsNullOrEmpty(category))
        {
            faqs = faqs.Where(f => f.CategoryId == category);
        }

        return View(faqs.ToList()); 
    }

}
    
    // public IActionResult Privacy()
    // {
    //     return View();
    // }

    // [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    // public IActionResult Error()
    // {
    //     return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    // }

