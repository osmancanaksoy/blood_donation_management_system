//
//  KullanicilarDAO.swift
//  Kan App
//
//  Created by Hüdahan Altun on 14.12.2022.
//

import Foundation


class kullanicilarDAO{
    
    var db:FMDatabase? //veritabanı değişkeni
    init(){
        
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let veritabanıURL = URL(filePath: hedefYol).appending(path: "bagiscilar.sqlite")
        
        
        db = FMDatabase(path: veritabanıURL.path)
        
        
    }
    
    
    
    
    func mobilKullaniciEkle(k_mail:String,k_sifre:String,k_ad:String,k_soyad:String,k_tc:String,k_tel:String,k_dogumgunu:String,k_kilo:Int,k_boy:Int,k_cinsiyet:String,k_kangrup:String)->Bool{
        
        db?.open()
        
        
        do{
            
            try db!.executeUpdate("INSERT INTO  Kullanicilar(k_mail,k_sifre,k_ad,k_soyad,k_tc,k_tel,k_dogumgunu,k_kilo,k_boy,k_cinsiyet,k_kangrup) VALUES(?,?,?,?,?,?,?,?,?,?,?)", values: [k_mail,k_sifre,k_ad,k_soyad,k_tc,k_tel,k_dogumgunu,k_kilo,k_boy,k_cinsiyet,k_kangrup])
            
            print(" Mobil kullanici ekleme başarılı!")

            db!.close()
            
            return true
            
        }catch{
            
            print("mobil kullanici ekleme başarısız!")
            
            db!.close()
            
            return false
            
        }
    
        
        
    }
    
    
    
    func MobilKullaniciGetir(k_mail:String)->mobilKullanicilar{//kullanıcı doğrulama ve diğer doğrulamalar için
        
        var gelenMobilKullanici:mobilKullanicilar = mobilKullanicilar()
        
        db?.open()
        
        do{
            
            
            let rs = try db!.executeQuery("SELECT * FROM Kullanicilar WHERE k_mail = ?", values: [k_mail])
            
            while(rs.next()){
                
                let mobilKTemp = mobilKullanicilar(k_mail: rs.string(forColumn: "k_mail")!, k_sifre: rs.string(forColumn: "k_sifre")!, k_ad: rs.string(forColumn: "k_ad")!, k_soyad: rs.string(forColumn: "k_soyad")!, k_tc: rs.string(forColumn: "k_tc")!, k_tel: rs.string(forColumn: "k_tel")!, k_dogumgunu: rs.string(forColumn: "k_dogumgunu")!, k_kilo: Int(rs.string(forColumn: "k_kilo"))!, k_boy: Int(rs.string(forColumn: "k_boy"))!, k_cinsiyet: rs.string(forColumn: "k_cinsiyet")!, k_kangrup: rs.string(forColumn: "k_kangrup")!)
               
                gelenMobilKullanici = mobilKTemp
                
            }
            
            print("KullanicilarDAO  mobilKullanici getirme başarılı!")
        }catch{
            
            print("kullanicilarDao mobilKullanici  getirme BAŞARISIZZ!")
        }
        
        db?.close()
        
        return gelenMobilKullanici
    }

    func MobilKullanıcıSifreGunc(yeni_sifre:String,k_mail:String)->Bool{
        
        db?.open()
        
        
        do{
            
            try db!.executeUpdate("UPDATE Kullanicilar SET k_sifre = ? WHERE k_mail = ?", values: [yeni_sifre,k_mail])
            
            print("Kullanıcılar DAO sifre Güncelleme başarılı!")

            db?.close()
            return true
        }catch{
            
            print("Kullanıcılar DAO sifre Güncelleme başarısız!")
            
            db?.close()
            return false
        }
        
    }
    
    
    
}


class ortakKullanıcılarDAO{
    
    var db:FMDatabase? //veritabanı değişkeni
    init(){
        
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let veritabanıURL = URL(filePath: hedefYol).appending(path: "db.sqlite3")
        
        
        db = FMDatabase(path: veritabanıURL.path)
        
        
    }
    
    func ortakKullaniciEkle(donor_name:String,donor_surname:String,id_number:String,date_of_birth:String,weight:Int,height:Int,gender:String,blood_type:String,phone:String,email:String){
        
        
        
        db?.open()
        
        
        do{
           
            try db!.executeUpdate("INSERT INTO  app_donor(donor_name,donor_surname,id_number,date_of_birth,weight,height,gender,blood_type,phone,email) VALUES(?,?,?,?,?,?,?,?,?,?)", values: [donor_name,donor_surname,id_number,date_of_birth,weight,height,gender,blood_type,phone,email])
            
            
            print("KullanicilarDAO ortak kullanici eklemek başarılı!")

           
            
        }catch{
            
            print("KullanicilarDAO ortak kullanici eklemek başarısız!")
            
           
            
        }
        
        db!.close()
    }
}
