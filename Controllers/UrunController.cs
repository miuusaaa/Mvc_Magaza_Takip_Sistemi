using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mağaza_Ürün_Takip_Sistemi.Models.Entity;


namespace Mağaza_Ürün_Takip_Sistemi.Controllers
{
    [Authorize]
    public class UrunController : Controller
    {
        MagazaUrunStokMVCEntities db = new MagazaUrunStokMVCEntities();
        public ActionResult Index(string p)
        {
            var urun = db.URUNLER.Where(x=>x.durum == true && x.KATEGORILER.durum == true);

            if(!string.IsNullOrEmpty(p))
            {
                urun = urun.Where(u=>u.ad.Contains(p) && u.durum == true);
            }
            return View(urun.ToList());
        }

       
        [HttpGet]
        public ActionResult YeniUrun()
        {
            List<SelectListItem> kategoriler = (from ktg in db.KATEGORILER.Where(x => x.durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = ktg.ad,
                                                    Value = ktg.id.ToString()
                                                }).ToList();
            ViewBag.ktg = kategoriler;
            return View();
        }

        [HttpPost]
        public ActionResult YeniUrun(URUNLER u)
        {
            var kategori = db.KATEGORILER.Where(k => k.id == u.KATEGORILER.id).FirstOrDefault();
            u.KATEGORILER = kategori;
            u.durum = true;
            db.URUNLER.Add(u);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UrunGetir(int id)
        {
            List<SelectListItem> kategoriler = (from ktg in db.KATEGORILER.Where(x=>x.durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = ktg.ad,
                                                    Value = ktg.id.ToString()
                                                }).ToList();
            ViewBag.kat = kategoriler;

            var urun = db.URUNLER.Find(id);
            return View(urun);
        }

        public ActionResult UrunGuncelle(URUNLER u)
        {
            var urun = db.URUNLER.Find(u.id);
            urun.ad = u.ad;
            urun.marka = u.marka;
            urun.stok = u.stok;
            urun.alisfiyat = u.alisfiyat;
            urun.satisfiyat= u.satisfiyat;

            var kategori = db.KATEGORILER.Where(k => k.id == u.KATEGORILER.id).FirstOrDefault();
            urun.kategori = kategori.id;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UrunSil(URUNLER u)
        {
            var urun = db.URUNLER.Find(u.id);
            urun.durum = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}