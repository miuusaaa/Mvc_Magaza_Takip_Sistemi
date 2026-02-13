using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mağaza_Ürün_Takip_Sistemi.Models.Entity;

namespace Mağaza_Ürün_Takip_Sistemi.Controllers
{
    [Authorize]
    public class SatisController : Controller
    {
        // GET: Satis
        MagazaUrunStokMVCEntities db = new MagazaUrunStokMVCEntities();
        public ActionResult Index()
        {
            var satislar = db.SATISLAR.ToList();
            return View(satislar);
        }

        [HttpGet]
        public ActionResult YeniSatis()
        {
            List<SelectListItem> urun = (from u in db.URUNLER.Where(x => x.durum == true).ToList()
                                         select new SelectListItem
                                         {
                                             Text = u.ad,
                                             Value = u.id.ToString()
                                         }).ToList();
            ViewBag.ddlurun = urun;

            List<SelectListItem> personel = (from p in db.PERSONELLER.Where(x => x.durum == true).ToList()
                                             select new SelectListItem
                                             {
                                                 Text = p.ad + " " + p.soyad,
                                                 Value = p.id.ToString()
                                             }).ToList();
            ViewBag.ddlpersonel = personel;

            List<SelectListItem> musteri = (from m in db.MUSTERILER.Where(x => x.durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = m.ad + " " + m.soyad,
                                                Value = m.id.ToString()
                                            }).ToList();
            ViewBag.ddlmusteri = musteri;

            return View();
        }

        [HttpPost]
        public ActionResult YeniSatis(SATISLAR s)
        {

            var urun = db.URUNLER.Where(u => u.id == s.URUNLER.id).FirstOrDefault();
            var personel = db.PERSONELLER.Where(p => p.id == s.PERSONELLER.id).FirstOrDefault();
            var musteri = db.MUSTERILER.Where(m => m.id == s.MUSTERILER.id).FirstOrDefault();
            s.URUNLER = urun;
            s.PERSONELLER = personel;
            s.MUSTERILER = musteri;
            s.tarih = DateTime.Now;
            db.SATISLAR.Add(s);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}