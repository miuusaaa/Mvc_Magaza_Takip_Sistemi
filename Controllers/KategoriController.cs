using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mağaza_Ürün_Takip_Sistemi.Models.Entity;

namespace Mağaza_Ürün_Takip_Sistemi.Controllers
{
    public class KategoriController : Controller
    {
        // GET: Kategori
        MagazaUrunStokMVCEntities db = new MagazaUrunStokMVCEntities();
        public ActionResult Index()
        {
            var kategoriler = db.KATEGORILER.Where(x => x.durum == true).ToList();
            return View(kategoriler);
        }

        [HttpGet]
        public ActionResult YeniKategori()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YeniKategori(KATEGORILER k)
        {
            k.durum = true;
            db.KATEGORILER.Add(k);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KategoriSil(KATEGORILER k)
        {
            var kategori = db.KATEGORILER.Find(k.id);
            kategori.durum = false;

            var urunler = db.URUNLER.Where(x => x.kategori == k.id).ToList();
            foreach(var urun in urunler)
            {
                urun.durum = false;
            }

            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KategoriGetir(int id)
        {
            var kategori = db.KATEGORILER.Find(id);
            return View(kategori);
        }

        public ActionResult KategoriGuncelle(KATEGORILER k)
        {
            var kategori = db.KATEGORILER.Find(k.id);
            kategori.ad = k.ad;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}