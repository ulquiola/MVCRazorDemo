using MVCRazorDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace MVCRazorDemo.Controllers
{
    public class UseInfoController : Controller
    {
        testEntities myContext = new testEntities();
        // GET: UseInfo
        public ActionResult Index1( string searchString, int page = 1)
        {
            var list = from n in myContext.UserInfo
                       select n;

            ViewBag.SearchString = searchString;

            if (!string.IsNullOrEmpty(searchString))
            {
                list = list.Where(s => s.UName.ToUpper().Contains(searchString.ToUpper()));
            }
            list = list.OrderBy(s => s.UID);
            int pageSize =5;

            return View(list.ToPagedList(page, pageSize)); ;
        }
        public ActionResult Index()
        {
          //  testEntities myContext = new testEntities();

            var list = from n in myContext.UserInfo
                       select n;
            //var list = from n in myContext.UserInfo
            //           select n.UName;
            ////表达式语法
            //var list = from n in myContext.UserInfo
            //           select new UserInfoViewModel
            //           {
            //               Uid = n.UID,
            //               Uname=n.UName
            //           };
            ////select * from userinfo

            //var list = from n in myContext.UserInfo
            //           where n.UID > 5
            //           select n;

            //var list = from n in myContext.UserInfo
            //           where n.UID > 5 && n.UName.Length>2
            //           select n;

            //方法语法
            //var list = myContext.UserInfo.Select(n => n); 
            //var list = myContext.UserInfo.Where(n=> n.UID > 5);
            // var list = myContext.UserInfo.Where(n =>(n.UID > 5 || n.UName.Length > 2));
            //var list = myContext.UserInfo.Where(n => n.UID > 5).Where(n=> n.UName.Length > 2);  //只有且可以使用这种方式
            //var list = myContext.UserInfo.Where(n => n.UID > 5).Select(n => n.UName);

            //var list = myContext.UserInfo.Select(n =>
            //               new UserInfoViewModel
            //               {
            //                   Uid = n.UID,
            //                   Uname = n.UName
            //               });
          //  var list = myContext.UserInfo.OrderBy(n=>n.UID).Skip(2).Take(3);  //可以实现分页

            return View(list);
        }

        //Get
        public ActionResult Add()
        {
            
            return View();
        }

        [HttpPost]
        public ActionResult Add(UserInfo  us)
        {
           myContext.UserInfo.Add(us);
           int result= myContext.SaveChanges();
            if (result >0)
            { return RedirectToAction("Index"); }
            else
            {
                return RedirectToAction("Add");
            }
           
        }

        //Get
        public ActionResult Edit(int id)
        {
            UserInfo us= myContext.UserInfo.Where(n => n.UID == id).FirstOrDefault() ;
            return View(us);
        }
        [HttpPost ]
        public ActionResult Edit(UserInfo us)
        {
            UserInfo user1= myContext.UserInfo.Where(n => n.UID == us.UID).First();
            user1.UName = us.UName;
            user1.UPassWord = us.UPassWord;
            int result = myContext.SaveChanges();
            if (result>0)
            { return RedirectToAction("index"); }
            else
            { return RedirectToAction("Edit","UseInfo",new { id = us.UID }); }
            
        }

        public ActionResult Remove(int id)
        {
            UserInfo us = myContext.UserInfo.Where(n => n.UID == id).FirstOrDefault();
            myContext.UserInfo.Remove(us);
            myContext.SaveChanges();
            return RedirectToAction ("index");
        }
    }
}