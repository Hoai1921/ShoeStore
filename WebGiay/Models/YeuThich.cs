using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebGiay.Models
{
    public class YeuThich
    {
        CuaHangGiayEntities db = new CuaHangGiayEntities();

        public int sMaSP { get; set; }
        public string TenSP { get; set; }
        public Nullable<int> MaTH { get; set; }
        public Nullable<double> Gia { get; set; }
        public string Anh { get; set; }
        public YeuThich(int MaSP)
        {
            sMaSP = MaSP;
            SanPham sanpham = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSP);
            var anh = db.AnhSPs.Where(n => n.MaSP == MaSP).ToList();
            TenSP = sanpham.TenSP;
            MaTH = sanpham.MaTH;
            Anh = anh[0].URL;
            Gia = double.Parse(sanpham.Gia.ToString());
        }
    }
}