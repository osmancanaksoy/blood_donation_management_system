//
//  Kullanicilar.swift
//  Kan App
//
//  Created by Hüdahan Altun on 14.12.2022.
//

import Foundation

class mobilKullanicilar{
 
    private var k_mail:String?
    private var k_sifre:String?
    private var k_ad:String?
    private var k_soyad:String?
    private var k_tc:String?
    private var k_tel:String?
    private var k_dogumgunu:String?
    private var k_kilo:Int?
    private var k_boy:Int?
    private var k_cinsiyet:String?
    private var k_kangrup:String?

    
    init(){
        
        
    }
    
    init(k_mail:String,k_sifre:String,k_ad:String,k_soyad:String,k_tc:String,k_tel:String,k_dogumgunu:String,k_kilo:Int,k_boy:Int,k_cinsiyet:String,k_kangrup:String){
        
      
        self.k_mail = k_mail
        self.k_sifre = k_sifre
        self.k_ad = k_ad
        self.k_soyad = k_soyad
        self.k_tc = k_tc
        self.k_tel = k_tel
        self.k_dogumgunu = k_dogumgunu
        self.k_kilo = k_kilo
        self.k_boy = k_boy
        self.k_cinsiyet = k_cinsiyet
        self.k_kangrup = k_kangrup
       
    }
    
    

    func getK_Mail()->String?{
        return k_mail
    }
    func getK_Sifre()->String{
        return k_sifre!
    }
    func getK_Ad()->String{
        return k_ad!
    }
    func getK_Soyad()->String{
        return k_soyad!
    }
    func getK_TC()->String{
        return k_tc!
    }
    func getK_Tel()->String{
        return k_tel!
    }
    func getK_dogumgunu()->String{
        return k_dogumgunu!
    }
    func getK_Kilo()->Int{
        return k_kilo!
    }
    func getK_Boy()->Int{
        return k_boy!
    }
    func getK_Cinsiyet()->String{
        return k_cinsiyet!
    }
    func getK_Kangrup()->String{
        return k_kangrup!
    }

}

class ortakKullanıcılar{
    
    private var donor_name:String?
    private var donor_surname:String?
    private var id_number:String?
    private var date_of_birth:String?
    private var weight:Int?
    private var height:Int?
    private var gender:String?
    private var blood_type:String?
    private var phone:String?
    private var mail:String?
    
    
    init(){
        
        
    }
    init(donor_name:String,donor_surname:String,id_number:String,date_of_birth:String,weight:Int,height:Int,gender:String,blood_type:String,phone:String,mail:String){
        
        self.donor_name = donor_name
        self.donor_surname = donor_surname
        self.id_number = id_number
        self.date_of_birth = date_of_birth
        self.weight = weight
        self.height = height
        self.gender = gender
        self.blood_type = blood_type
        self.phone = phone
        self.mail = mail
        
    }
    
}

