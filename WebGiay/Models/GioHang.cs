using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebGiay.Models
{
    public class GioHang
    {
        CuaHangGiayEntities db = new CuaHangGiayEntities();
        
        public int sMaSP { get; set; }
        public string TenSP { get; set; }
        public Nullable<int> MaTH { get; set; }
        public Nullable<double> Gia { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public string Anh { get; set; }
        public double ThanhTien
        {
            get { return (double)(Gia * SoLuong); }
        }

        public GioHang(int MaSP)
        {
            sMaSP = MaSP;
            SanPham sanpham = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSP);
            var anh = db.AnhSPs.Where(n => n.MaSP == MaSP).ToList();
            TenSP = sanpham.TenSP;
            MaTH = sanpham.MaTH;
            if (anh.Count != 0) { Anh = anh[1].URL; }
            else { Anh = null; }
            Gia = double.Parse(sanpham.Gia.ToString());
            SoLuong = 1;
        }
    }
}