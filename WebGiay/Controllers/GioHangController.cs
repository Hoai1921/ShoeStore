using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGiay.Models;

namespace WebGiay.Controllers
{
    public class GioHangController : Controller
    {
        CuaHangGiayEntities db = new CuaHangGiayEntities();

        #region Giỏ hàng
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        public ActionResult ThemGioHang(int sMaSP, string strUrl)
        {
            SanPham sanpham = db.SanPhams.SingleOrDefault(n => n.MaSP == sMaSP);
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang spgh = lstGioHang.Find(n => n.sMaSP == sMaSP);
            if (spgh == null)
            {
                spgh = new GioHang(sMaSP);
                lstGioHang.Add(spgh);
                return Redirect(strUrl);
            }
            else
            {
                spgh.SoLuong++;
                return Redirect(strUrl);
            }
        }
        public ActionResult GioHang()
        {
            if (Session["GioHang"] == null)
            {
                RedirectToAction("TrangChu", "SanPham");
            }
            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }
        private int TongSoLuong()
        {
            int iTongSL = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                iTongSL = (int)lstGioHang.Sum(n => n.SoLuong);
            }
            return iTongSL;
        }
        private double TongTien()
        {
            double dTongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                dTongTien = lstGioHang.Sum(n => n.ThanhTien);
            }
            return dTongTien;
        }
        public ActionResult GioHangPartial()
        {
            if (TongSoLuong() != 0)
            {
                ViewBag.TongSoLuong = TongSoLuong();
            }
            return PartialView();
        }
        public ActionResult SuaGioHang()
        {
            if (Session["GioHang"] == null)
            {
                RedirectToAction("TrangChu", "SanPham");
            }
            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }
        public ActionResult CapNhatGioHang(int sMaSP, FormCollection f)
        {
            SanPham sanpham = db.SanPhams.SingleOrDefault(n => n.MaSP == sMaSP);
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            //kiểm tra sản phẩm có trong giỏ hàng không
            GioHang sp = lstGioHang.SingleOrDefault(n => n.sMaSP == sMaSP);
            if (sp != null)
            {
                sp.SoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("SuaGioHang","GioHang");
        }
        public ActionResult XoaGioHang(int sMaSP, FormCollection f)
        {
            SanPham sanpham = db.SanPhams.SingleOrDefault(n => n.MaSP == sMaSP);
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            //kiểm tra sản phẩm có trong giỏ hàng không
            GioHang sp = lstGioHang.SingleOrDefault(n => n.sMaSP == sMaSP);
            if (sp != null)
            {
                lstGioHang.RemoveAll(n => n.sMaSP == sMaSP);
            }
            if (lstGioHang.Count == 0)
            {
                RedirectToAction("TrangChu", "SanPham");
            }
            return RedirectToAction("SuaGioHang");
        }

        #endregion

        public ActionResult DatHang()
        {
            //kiểm tra đăng nhập
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            if (Session["GioHang"] == null)
            {
                RedirectToAction("TrangChu", "SanPham");
            }
            //lưu thông tin vào bảng hóa đơn
            HoaDon hdb = new HoaDon();
            hdb.NgayBan = DateTime.Now;
            KhachHang kh = (KhachHang)Session["TaiKhoan"];
            hdb.MaKH = kh.MaKH;
            hdb.TongTien = (int)TongTien();
            db.HoaDons.Add(hdb);
            db.SaveChanges();
            // lưu thông tin vào chi tiết hóa đơn
            List<GioHang> lstGioHang = LayGioHang();
            foreach (var item in lstGioHang)
            {
                ChiTietHoaDon cthd = new ChiTietHoaDon();
                cthd.SoHD = hdb.SoHD;
                cthd.MaSP = item.sMaSP;
                cthd.SoLuong = item.SoLuong;
                cthd.Gia = int.Parse(item.Gia.ToString());
                cthd.ThanhTien = int.Parse(item.ThanhTien.ToString());
                db.ChiTietHoaDons.Add(cthd);
            }
            db.SaveChanges();
            Session["GioHang"] = null;
            return RedirectToAction("TrangChu", "SanPham");
        }
    }
}