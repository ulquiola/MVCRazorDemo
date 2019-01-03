using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCRazorDemo.Models;

namespace MVCRazorDemo.Controllers
{
    public class SecondController : Controller
    {
        // GET: Second
        public ActionResult Index()
        {
            ViewData["city"] = new List<SelectListItem>()
            {
                new SelectListItem() {Selected=false ,Text="北京",Value ="1" },
                 new SelectListItem() {Selected=false ,Text="上海",Value ="2" },
                  new SelectListItem() {Selected=false ,Text="广州",Value ="3" },
            };
            ViewBag.num = 123;

            person p = new Models.person();
            p.id = 1;p.QQ = 123456;
          //  ViewData.Model = p;
            return View(p);
        }
    }
}