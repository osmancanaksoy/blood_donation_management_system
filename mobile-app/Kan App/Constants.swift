//
//  Constants.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import Foundation


struct K{
    
    //segue identifier
    static let gToSifreUnut:String = "girisToSifreUnut"
    static let gToYasal:String = "girisToYasal"
    static let yToKisi:String = "yasalToKisisel"
    static let kToKayit:String = "kisiseltoKayit"
    static let kToMain:String = "kayitToMain"
    static let gToMain:String = "girisToMain"
    static let bToKan:String = "bagisToKan"
    static let bToKok:String = "bagisToKok"
    static let bToImmun:String = "bagisToImmune"
    static let bToAferez:String = "bagisToAferez"
    static let bToDetay:String = "kanBagisToDetay"
    static let hToHDetay:String = "haritaToHaritaDetay"
    static let mToAyar:String = "mainToAyarlar"
    static let aToSifYen:String = "ayarlarToSifYen"
    static let ha1Toha2:String = "haritaAcilToharitaAcil2"
    static let sifreUnuttum1To2:String = "sifreU1To2"
    //kayitVC güvenlik check
    static let hesapGuv:String = "Mail adresiniz \"@gmail.com\" uzantılı olmalıdır.\nŞifreniz 8-15 karakter aralığında olmalıdır.Ayrıca sifreniz en az bir büyük harf, küçük harf, sayı ve .,$@$#!%*?& içermelidir"
    
    static let guvHata:String = "Lütfen hesap bilgilerinizi kontrol ediniz.Gereksinimler için soru işaretine tıklayabilirsiniz."
    
    static let hesapOlusturma:String = "Girilen mail adresiyle kayıtlı başka bir kullanıcı mevcut.Lütfen farklı mail adresi deneyiniz."
    
    static let bosAlanHata:String = "Boş alan bırakılamaz!"
    static let gmailCheck:[Substring.Element] = ["@", "g", "m", "a", "i", "l", ".", "c", "o", "m"]
    
    
    
    //girisvc
    static let bilgYanlis:String = "Hesabınıza ait  bilgiler yanlış lütfen tekrar deneyiniz."
    static let hesapBulunamadı:String = "Sistemimizde böyle bir hesap kayıtlı olarak bulunmamaktadır"
    static let mevcutSifreYanlis:String = "Mevcut şifreniz yanlış"
    static let sifreEslesmiyor:String = "Girilen şifreler eşleşmiyor"
    static let sifreDeBasarili:String = "Şifreniz başarıyla değiştirildi."
    static let sifreGuv:String = "Şifreniz 8-15 karakter aralığında olmalıdır.Ayrıca sifreniz en az bir büyük harf, küçük harf, sayı ve .,$@$#!%*?& içermelidir"
    
//    kan bagis detay VC
    
    static let yolTarifi:String = "Bağış Noktası harita üzerinde gösterilmektedir.İlgili pin'e tıklayınca bağış noktasına yol tarifi alacaksınız"
    //yasalVC için Yasal Uyarı,KKVC için kullanım kosulları,gizlilikVC için gizlilik koşulları.
    
    static let yasalUyari:String = ""
    static let kullanimKosullari:String = ""
    static let gizlilikKosullari:String = ""
   
    //sifre unuttum VC1 ve VC2
    
    static let mailYanlis:String = "Böyle bir mail adresi sistemimizde bulunmamaktadır."
    static let tcEslesmiyor:String = "İlgili mail adresi ile TC eşleşmemektedir."
    static let bilgilendirme1:String = "Şifrenizi değiştirmek için hesabınız ile TC kimlik numaranız doğrulanmalıdır."
    static let bilgilendirme2:String = "Şifreniz 8-15 karakter aralığında olmalıdır.Ayrıca sifreniz en az bir büyük harf, küçük harf, sayı ve .,$@$#!%*?& içermelidir"
}
