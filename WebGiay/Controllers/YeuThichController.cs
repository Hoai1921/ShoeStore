using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGiay.Models;

namespace WebGiay.Controllers
{
    public class YeuThichController : Controller
    {
        CuaHangGiayEntities db = new CuaHangGiayEntities();
        // GET: YeuThich
        #region Yeu Thich
        public List<YeuThich> LayYeuThich()
        {
            List<YeuThich> lstYeuThich = Session["YeuThich"] as List<YeuThich>;
            if (lstYeuThich == null)
            {
                lstYeuThich = new List<YeuThich>();
                Session["YeuThich"] = lstYeuThich;
            }
            return lstYeuThich;
        }
        public ActionResult ThemYeuThich(int sMaSP, string strUrl)
        {
            SanPham sanpham = db.SanPhams.SingleOrDefault(n => n.MaSP == sMaSP);
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<YeuThich> lstYeuThich = LayYeuThich();
            YeuThich spyt = lstYeuThich.Find(n => n.sMaSP == sMaSP);
            if (spyt == null)
            {
                spyt = new YeuThich(sMaSP);
                lstYeuThich.Add(spyt);
                return Redirect(strUrl);
            }
            return Redirect(strUrl);
        }
        public ActionResult YeuThich()
        {
            if (Session["YeuThich"] == null)
            {
                RedirectToAction("TrangChu", "SanPham");
            }
            List<YeuThich> lstYeuThich = LayYeuThich();
            return View(lstYeuThich);
        }
        public ActionResult XoaYeuThich(int sMaSP, FormCollection f)
        {
            SanPham sanpham = db.SanPhams.SingleOrDefault(n => n.MaSP == sMaSP);
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<YeuThich> lstYeuThich = LayYeuThich();
            //kiểm tra sản phẩm có trong giỏ hàng không
            YeuThich yt = lstYeuThich.SingleOrDefault(n => n.sMaSP == sMaSP);
            if (yt != null)
            {
                lstYeuThich.RemoveAll(n => n.sMaSP == sMaSP);
            }
            if (lstYeuThich.Count == 0)
            {
                RedirectToAction("TrangChu", "SanPham");
            }
            return RedirectToAction("YeuThich");
        }
        #endregion

    }
}