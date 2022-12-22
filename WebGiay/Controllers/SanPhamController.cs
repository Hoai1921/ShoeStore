using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGiay.Models;

namespace WebGiay.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: SanPham
        CuaHangGiayEntities db = new CuaHangGiayEntities();
        public ActionResult TrangChu()
        {
            return View(db.SanPhams.ToList());
        }
        public ActionResult QuanLySanPham()
        {
            List<ThuongHieu> dbth = db.ThuongHieux.ToList();
            ViewBag.ThuongHieu = dbth;
            return View(db.SanPhams.ToList());
        }
        public PartialViewResult ChuDePartial()
        {
            return PartialView(db.ThuongHieux.ToList());
        }
        public ViewResult SanPhamTheoLoai(int MaTH = 1)
        {
           
            ThuongHieu lsp = db.ThuongHieux.SingleOrDefault(n => n.MaTH == MaTH);
            if (lsp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<SanPham> lstSanPham = db.SanPhams.Where(n => n.MaTH == MaTH).OrderBy(n => n.TenSP).ToList();
            if (lstSanPham.Count == 0)
            {
                ViewBag.lstSanPham = "Không có sản phẩm nào thuộc loại này";
            }
            ViewBag.MaTH = MaTH;
            ViewBag.lstSanPham = db.SanPhams.ToList();
            return View(lstSanPham);
        }
        public ViewResult ChiTietSanPham(int MaSP = 1)
        {
            SanPham sanpham = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSP);
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sanpham);
        }
        // Thêm sản phẩm:
        [HttpGet]
        public ActionResult Add()
        {
            ViewBag.ThuongHieu = new SelectList(db.ThuongHieux.ToList().OrderBy(n => n.TenTH), "MaTH","TenTH");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add([Bind(Include ="MaSP,TenSP , MaTH , GTSP , Gia")] SanPham sp)
        {
            if (ModelState.IsValid)
            {
                db.SanPhams.Add(sp);
                db.SaveChanges();
                return RedirectToAction("QuanLySanPham", "SanPham");
            }

            else
            {
                ViewBag.ThuongHieu = new SelectList(db.ThuongHieux.ToList().OrderBy(n => n.TenTH), "MaTH","TenTH");
            }

            return View(sp);
        }

        // chỉnh sửa sản phẩm
        // Chỉnh sửa sản phẩm:
        [HttpGet]
        public ActionResult Update(int MaSP)
        {
            Session["MaSP"] = MaSP;
            SanPham sanPham = db.SanPhams.Find(MaSP);
            if (sanPham == null)
            {
                return HttpNotFound();
            }

            ViewBag.ThuongHieu = new SelectList(db.ThuongHieux.ToList().OrderBy(n => n.TenTH), "MaTH","TenTH");
            return View(sanPham);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update([Bind(Include = "MaSP, TenSP, MaTH, GTSP, Gia")] SanPham sanpham)
        {
            if (ModelState.IsValid)
            {
                sanpham.MaSP = (int)Session["MaSP"];
                db.Entry(sanpham).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("QuanLySanPham","SanPham");
            }
            else
            {
                ViewBag.ThuongHieu = new SelectList(db.ThuongHieux.ToList().OrderBy(n => n.TenTH), "MaTH","TenTH");
            }
            return RedirectToAction("QuanLySanPham","SanPham");
        }
    }
}