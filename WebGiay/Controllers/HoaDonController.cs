using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGiay.Models;

namespace WebGiay.Controllers
{
    public class HoaDonController : Controller
    {
        // GET: HoaDon
        CuaHangGiayEntities db = new CuaHangGiayEntities();
        public ActionResult QuanLyHoaDon()
        {
            List<KhachHang> dbkh = db.KhachHangs.ToList();
            ViewBag.KhachHang = dbkh;
            return View(db.HoaDons.ToList());
        }
        public ViewResult ChiTietHoaDon(int SoHD = 1)
        {
            var cthd = db.ChiTietHoaDons.Where(n => n.SoHD == SoHD).ToList();
            if (cthd == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<SanPham> dbsp = db.SanPhams.ToList();
            ViewBag.SanPham = dbsp;
            ViewBag.ma = SoHD;
            return View(cthd);
        }
    }
}