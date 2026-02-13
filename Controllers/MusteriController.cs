using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mağaza_Ürün_Takip_Sistemi.Models.Entity;
using PagedList;
using PagedList.Mvc;

namespace Mağaza_Ürün_Takip_Sistemi.Controllers
{
    [Authorize]
    public class MusteriController : Controller
    {
        
        // GET: Musteri
        MagazaUrunStokMVCEntities db = new MagazaUrunStokMVCEntities();
        [AllowAnonymous]
        public ActionResult Index(string p,int sayfa = 1)
        {
            var musteri = db.MUSTERILER.Where(x => x.durum == true);

            if(!string.IsNullOrEmpty(p))
            {
                musteri = musteri.Where(m => ((m.ad + " " + m.soyad).Contains(p) || m.ad.Contains(p) || m.soyad.Contains(p)) && m.durum == true); 
            }
            return View(musteri.ToList().ToPagedList(sayfa, 2));
        }

        
        [HttpGet]
        public ActionResult YeniMusteriEklemeSayfasi()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YeniMusteriyiEkle(MUSTERILER m)
        {
            if (!ModelState.IsValid)  //required in çalışması için56
            {
                
                return View("YeniMusteriEklemeSayfasi"); 
            }
            m.durum = true;
            db.MUSTERILER.Add(m);
            db.SaveChanges();  
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult MusteriSil(int id)
        {
            var musteri = db.MUSTERILER.Find(id);
            musteri.durum = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        /* public ActionResult MusteriSil(MUSTERILER m)    // Böyle de silme mümkün ancak httpget ile entity göndermek mantıksız ;
                                                              entityleri sadece post işlemlerinde gönder ,                                                  
        {                                                     zaten sadece her türlü id yi kullanıcaz . 
                                                              Bir de silme işlemi de post ile yapılmalıymış.
            var musteri = db.MUSTERILER.Find(m.id);
        musteri.durum = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }*/

       
        public ActionResult MusteriGetir(int id)
        {
            var musteri = db.MUSTERILER.Find(id);
            return View(musteri);
        }

        [HttpPost]
        public ActionResult MusteriGuncelle(MUSTERILER m)
        {
            if(!ModelState.IsValid)  //required in çalışması için
            {
                
                return View("MusteriGetir",m); //m ile yani model ile geri döndürme yapmazsan hata alırsın , çünkü refresh yapınca eski bilgilerimizi
                                                           // yeniden kullanıcaz.Musterigetir id bekliyor ya hangi müşteriyi getireceğini bilemez.
            }

            var musteri = db.MUSTERILER.Find(m.id);
            musteri.ad = m.ad;
            musteri.soyad = m.soyad;
            musteri.sehir = m.sehir;
            musteri.bakiye = m.bakiye;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}