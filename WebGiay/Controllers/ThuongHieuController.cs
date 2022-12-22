using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGiay.Models;

namespace WebGiay.Controllers
{
    public class ThuongHieuController : Controller
    {
        CuaHangGiayEntities db = new CuaHangGiayEntities();
        // GET: ThuongHieu
        public ActionResult ThuongHieu()
        {
            return View(db.ThuongHieux.ToList());
        }
        // Thêm thương hiệu:
        [HttpGet]
        public ActionResult ThemThuongHieu()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemThuongHieu([Bind(Include = " TenTH ")] ThuongHieu th)
        {

            if (ModelState.IsValid)
            {
                db.ThuongHieux.Add(th);
                db.SaveChanges();
                return RedirectToActionPermanent("ThuongHieu", "ThuongHieu");
            }
            return View(th);
        }

        // Chỉnh sửa thương hiệu:
        [HttpGet]
        public ActionResult ChinhSuaThuongHieu(int MaTH)
        {
            ThuongHieu th = db.ThuongHieux.Find(MaTH);
            if (th == null)
            {
                return HttpNotFound();
            }

            return View(th);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChinhSuaThuongHieu([Bind(Include = " MaTH,TenTH")] ThuongHieu th)
        {
            if (ModelState.IsValid)
            {
                db.Entry(th).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ThuongHieu");
            }
            return RedirectToAction("ThuongHieu");
        }
        public ActionResult XoaThuongHieu(int MaTH)
        {
            ThuongHieu th = db.ThuongHieux.SingleOrDefault(n => n.MaTH == MaTH);
            if (th == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ThuongHieu thuonghieu = db.ThuongHieux.SingleOrDefault(n => n.MaTH == MaTH);
            if (thuonghieu != null)
            {
                db.ThuongHieux.Remove(thuonghieu);
                db.SaveChanges();
            }
            
            return RedirectToAction("ThuongHieu");
        }
        
    }
}