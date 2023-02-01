//
//  BagisNoktaDAO.swift
//  Kan App
//
//  Created by Hüdahan Altun on 18.12.2022.
//

import Foundation


class BagisNoktaDAO{
    
    
    var dbBagisNokta:FMDatabase? //veritabanı değişkeni
    
    init(){
        
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let veritabanıURL = URL(filePath: hedefYol).appending(path: "bagisNoktalari.sqlite")
        
        
        dbBagisNokta = FMDatabase(path: veritabanıURL.path)
    }
    
    func tümNoktalariAl()->[BagisNokta]{
        
        
        var gelenBagisNoktalarListesi:[BagisNokta] = [BagisNokta]()
        dbBagisNokta?.open()
        
        do{
            
            
            let rs = try dbBagisNokta!.executeQuery("SELECT * FROM BagisNokta", values: nil)
            
            while(rs.next()){
                

                let gelenNokta = BagisNokta(id: Int(rs.string(forColumn: "id"))!, b_name: rs.string(forColumn: "b_name")!, b_lati: Double(rs.string(forColumn: "b_lati"))!, b_longi: Double(rs.string(forColumn: "b_longi"))!, b_image: rs.string(forColumn: "b_image")!, b_il: rs.string(forColumn: "b_il")!, b_ilce: rs.string(forColumn: "b_ilce")!)
               
                gelenBagisNoktalarListesi.append(gelenNokta)
            }
            
            print("BagisNoktaDAO tüm noktalar getirme başarılı!")
        }catch{
            
            print("bagisNoktalarDAO tüm noktalar getirme başarısız!")
        }
        
        dbBagisNokta?.close()
        
        return gelenBagisNoktalarListesi
    }
    
    
    func bagisNoktaGetir(id:Int)->BagisNokta{
        
        
        var gelenBagisNoktasi:BagisNokta = BagisNokta()
        
        dbBagisNokta?.open()
        
        do{
            
            
            let rs = try dbBagisNokta!.executeQuery("SELECT * FROM BagisNokta WHERE id = ? ", values: [id])
            
            while(rs.next()){
                

                let gelenNokta = BagisNokta(id: Int(rs.string(forColumn: "id"))!, b_name: rs.string(forColumn: "b_name")!, b_lati: Double(rs.string(forColumn: "b_lati"))!, b_longi: Double(rs.string(forColumn: "b_longi"))!, b_image: rs.string(forColumn: "b_image")!, b_il: rs.string(forColumn: "b_il")!, b_ilce: rs.string(forColumn: "b_ilce")!)
               
                gelenBagisNoktasi = gelenNokta
            }
            
            print("BagisNoktaDAO tüm noktalar getirme başarılı!")
        }catch{
            
            print("bagisNoktalarDAO tüm noktalar getirme başarısız!")
        }
        
        dbBagisNokta?.close()
        
        return gelenBagisNoktasi
    }
    
}
