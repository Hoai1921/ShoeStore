using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGiay.Models;

namespace WebGiay.Controllers
{
    public class TimKiemController : Controller
    {
        // GET: TimKiem
        CuaHangGiayEntities db = new CuaHangGiayEntities();
        [HttpPost]
        public ActionResult Searching(FormCollection f)
        {
            string searchkey = f["txtKeyWord"].ToString();
            ViewBag.keyword = searchkey;
            List<SanPham> lstKQ = db.SanPhams.Where(n => n.TenSP.Contains(searchkey)).ToList();
            if (lstKQ.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy sản phẩm nào, bạn có thể tham khảo các sản phẩm dưới đây";
                return View(db.SanPhams.OrderBy(n => n.TenSP).ToList());
            }
            ViewBag.ThongBao = "Đã tìm thấy " + lstKQ.Count + " kết quả";
            return View(lstKQ.OrderBy(n => n.TenSP).ToList());
        }
        [HttpGet]
        public ActionResult Searching( string searchkey)
        {
            ViewBag.keyword = searchkey;
            List<SanPham> lstKQ = db.SanPhams.Where(n => n.TenSP.Contains(searchkey)).ToList();
            if (lstKQ.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy sản phẩm nào";
                return View(db.SanPhams.OrderBy(n => n.TenSP).ToList());
            }
            ViewBag.ThongBao = "Đã tìm thấy " + lstKQ.Count + " kết quả";
            return View(lstKQ.OrderBy(n => n.TenSP).ToList());
        }
    }
}