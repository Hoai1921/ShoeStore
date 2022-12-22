using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGiay.Models;

namespace WebGiay.Controllers
{
    public class NguoiDungController : Controller
    {
        // GET: NguoiDung
        CuaHangGiayEntities db = new CuaHangGiayEntities();
        // Đăng ký là mặc định tài khoản của khách hàng còn tài khoản của Admin thì chỉ có 1
        public ActionResult DangKy(int id = 0)
        {
            KhachHang user = new KhachHang();
            return View(user);
        }

        [HttpPost]

        public ActionResult DangKy(KhachHang kh)
        {
            // Kiểm tra tuoi nho hơn 18:
            if (db.KhachHangs.Any(n => n.Tuoi <18))
            {
                ViewBag.TuoiNho = "Tuổi dưới 18 không thể tạo tài khoản";
                return View("DangKy", kh);
            }
            else
            {
                // Kiểm tra nếu tên đăng nhập đã tồn tại:
                if (db.KhachHangs.Any(n => n.TaiKhoan == kh.TaiKhoan))
                {
                    ViewBag.TrungTaiKhoan = "Tên tài khoản đã tồn tại , xin thử tên khác";
                    return View("DangKy", kh);
                }
                else
                {
                    KhachHang khachhang = new KhachHang();
                    kh.MaKH = khachhang.MaKH;
                    kh.Admin = 0;
                    db.KhachHangs.Add(kh);
                    db.SaveChanges();
                    ModelState.Clear();
                    ViewBag.ThanhCong = "Đăng ký tài khoản thành công";
                }
            }

            return View("DangNhap");
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(KhachHang kh, FormCollection account)
        {
            string TaiKhoan = account["TaiKhoan"].ToString();
            string PassWord = account["MatKhau"].ToString();
            kh = db.KhachHangs.SingleOrDefault(x => x.TaiKhoan.Equals(TaiKhoan) && x.MatKhau.Equals(PassWord));
            if (kh != null)
            {
                Session["MaKH"] = kh.MaKH;
                Session["TenTaiKhoan"] = kh.TaiKhoan;
                Session["TaiKhoan"] = kh;
                Session["Admin"] = kh.Admin;
                return RedirectToAction("TrangChu", "SanPham");
            }
            ViewBag.DangNhapSai = "Thông tin tài khoản hoặc mật khẩu không chính xác, xin kiểm tra lại!";
            return View("DangNhap");
        }
        // Chỉnh sửa Thông tin tài khoản
        [HttpGet]
        public ActionResult ChinhSuaKhachHang()
        {
            //kiểm tra đăng nhập
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            //KHACHHANG khachhang = db.KHACHHANGs.Find(MaKH);
            int tdn = (int)Session["MaKH"];
            KhachHang khachhang = db.KhachHangs.SingleOrDefault(n=>n.MaKH==tdn);
            if (khachhang == null)
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            return View(khachhang);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChinhSuaKhachHang([Bind(Include = " MaKH,HoTen , GioiTinh , Tuoi , Email , SDT , TaiKhoan,MatKhau,DiaChi,Admin")] KhachHang khachhang)
        {
            if (ModelState.IsValid)
            {
                khachhang.Admin = (byte?)Session["Admin"];
                khachhang.MaKH = (int)Session["MaKH"];
                db.Entry(khachhang).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("TrangChu","SanPham");
            }
            return RedirectToAction("TrangChu", "SanPham");
        }
        public ActionResult QuanLyKhachHang()
        {
            return View(db.KhachHangs.ToList());
        }
    }
}