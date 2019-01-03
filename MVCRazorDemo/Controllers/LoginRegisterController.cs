using MVCRazorDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCRazorDemo.Controllers
{
    public class LoginRegisterController : Controller
    {
        testEntities myContext = new testEntities();
        // GET: LoginRegisterController
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(userViewModel userInfo, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                
                string vCode = Request.Form["txtverifcode1"];
                
                if (vCode != Session["ValidateCode"].ToString())
                {
                    return Content("<script>;alert('验证码错误！');history.go(-1)</script>");
                }

                var user = myContext.UserInfo.Where(u => u.UName == userInfo.Uname).FirstOrDefault();
                if (user != null)
                    return Content("<script>;alert('用户名已被占用！');history.go(-1)</script>");

                UserInfo userNew = new UserInfo();
                userNew.UID = userInfo.Uid;
                userNew.UName = userInfo.Uname;
                userNew.UPassWord = userInfo.UPassWord;
                myContext.UserInfo.Add(userNew);
                myContext.SaveChanges();
                return Content("<script>;alert('注册成功!正在跳转到首页..');window.location.href='/Home/Index'</script>");
            }
            else
                return View();
        }
    }
}