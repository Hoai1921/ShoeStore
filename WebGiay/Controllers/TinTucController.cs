using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Ajax.Utilities;
using WebGiay.Models;
namespace WebGiay.Controllers
{
    public class TinTucController : Controller
    {
        // GET: TinTuc
        CuaHangGiayEntities db = new CuaHangGiayEntities();
        public ActionResult TinTuc()
        {
            return View(db.TinTucs.ToList());
        }
        public ViewResult ChiTietTinTuc(int MaTT = 2)
        {
            TinTuc tintuc = db.TinTucs.SingleOrDefault(n => n.MaTT == MaTT);
            if (tintuc == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(tintuc);
        }
        public ActionResult QLTinTuc()
        {
            return View(db.TinTucs.ToList());
        }
        
    }
}