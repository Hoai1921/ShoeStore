using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGiay.Models;

namespace WebGiay.Controllers
{
    public class AnhController : Controller
    {
        CuaHangGiayEntities db = new CuaHangGiayEntities();
        // GET: Anh
        public ActionResult QLAnh()
        {
            return View(db.AnhSPs.ToList());
        }
    }
}