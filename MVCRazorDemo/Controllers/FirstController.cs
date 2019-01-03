using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCRazorDemo.Controllers
{
    public class FirstController : Controller
    {
        // GET: First
        public ActionResult Index()
        {
            ViewData["time"] = DateTime.Now.ToString();
            ViewBag.num = 123;
            return View();
        }
    }
}