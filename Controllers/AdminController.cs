using Mağaza_Ürün_Takip_Sistemi.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Mağaza_Ürün_Takip_Sistemi.Controllers
{
    public class AdminController : Controller
    {
        MagazaUrunStokMVCEntities db = new MagazaUrunStokMVCEntities();
        
        [HttpGet]
        public ActionResult Giris()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Giris(string KullaniciAdi, string Sifre)
        {
            var kullanici = db.ADMIN_GIRIS
                .FirstOrDefault(x => x.kullanici == KullaniciAdi && x.sifre == Sifre);

            if (kullanici != null)
            {
                FormsAuthentication.SetAuthCookie(kullanici.kullanici, false);
                Session["Kullanici"] = kullanici.kullanici;

                return RedirectToAction("Index", "Anasayfa");
            }

            ViewBag.Hata = "Kullanıcı adı veya şifre hatalı!";
            return View();

        }

        [HttpGet]
        public ActionResult YeniAdmin()
        {
             return View();
        }
        [HttpPost]
        public ActionResult YeniAdmin(ADMIN_GIRIS a)
        {
            return View();
        }
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut(); // Kimlik doğrulama biletini siler  //bu metodu yazmamaın sebebbi çıkış yapmama rağmen authorize ile kilitli yerlerin yine açılabilmesiydi. bunu eklelemle çıkışl yapınca artık kitli yerlere girilemicez ve authorize tam anlamıyla çalışıcak.
            Session.Abandon(); // Sunucu tarafındaki oturumu sonlandırır
            return RedirectToAction("Giris", "Admin"); // Giriş sayfasına yönlendirir
        }
    }
}