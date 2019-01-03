using MVCRazorDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCRazorDemo.Controllers
{
    public class NewsInfoController : Controller
    {
        testEntities myContext = new Models.testEntities();
        // GET: NewsInfo
        public ActionResult Index()
        {
            
            //连接查询的Linq语句
            //var list = from n in myContext.NewsInfo
            //           join m in myContext.NewsType
            //           on n.nTid equals m.tid
            //           select new NewsInfoViewModel
            //           {
            //               NID = n.nid,
            //               NTitle = n.nTitle,
            //               TTitle = m.tTitle
            //           };


            //多from 语句第er个from 子句的in后面要是个集合
            //var list=from n in myContext.NewsType  
            //         from m in n.NewsInfo 
            //         select  new NewsInfoViewModel
            //         {
            //             NID = m.nid,
            //             NTitle = m.nTitle,
            //             TTitle = n.tTitle
            //         };

            //直接用导航属性查询，导航属性一定是建立在有主外键的字段
            var list = from n in myContext.NewsInfo
                       where n.nid>3
                       select new NewsInfoViewModel
                       {
                           NID = n.nid,
                           NTitle = n.nTitle,
                           TTitle = n.NewsType.tTitle 
                       };



            return View(list);
        }

        public ActionResult index1()
        {
            var list = from ns in myContext.NewsInfo
                        select ns;
            return View(list);
        }

        public ActionResult Add()
        {
            var list = myContext.NewsType.Select(n => n);
            var selectlist = new SelectList(list, "tid", "tTitle", "1");
            ViewBag.Type = selectlist;
            return View();
        }
        [HttpPost ]
        public ActionResult Add(NewsInfo ns)
        {
            myContext.NewsInfo.Add(ns);
            myContext.SaveChanges();
            return RedirectToAction("index1");
        }
        
        public ActionResult Edit(int id)
        {
            var list = myContext.NewsInfo.Where(n => n.nid == id).FirstOrDefault();

            var listType = myContext.NewsType.Select(n => n);
            var selectlist = new SelectList(listType, "tid", "tTitle", "1");
            ViewBag.Type = selectlist;
            return View(list);
        }
        [HttpPost ]
        public ActionResult Edit(NewsInfo ns)
        {
            //NewsInfo newsinfo = myContext.NewsInfo.Where(n => n.nid == ns.nid).FirstOrDefault();
            //newsinfo.nid = ns.nid;
            //newsinfo.nTitle = ns.nTitle;
            //newsinfo.nTid = ns.nTid;
            //myContext.SaveChanges();
            //return RedirectToAction("index1");


            //通过修改对象状态的方式来进行修改，使本质使用方式
            myContext.NewsInfo.Attach(ns);
            myContext.Entry(ns).State = System.Data.Entity.EntityState.Modified;
            myContext.SaveChanges();
            return RedirectToAction("index1");
        }

        public ActionResult Remove(int id)
        {
            var us = myContext.NewsInfo.Where(n => n.nid == id).FirstOrDefault();
            myContext.NewsInfo.Remove(us);
            myContext.SaveChanges();
            return RedirectToAction("index1");
        }
    }
}