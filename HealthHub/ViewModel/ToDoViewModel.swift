//
//  ToDoViewModel.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 30.10.2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class ToDoViewModel {
    private var toDoItems: [ToDoItem] = []
        private let dbToDo: Firestore
        private let collectionReference: CollectionReference
        
        init() {
            dbToDo = Firestore.firestore()
            collectionReference = dbToDo.collection("toDoItems")
        }
    
    
    func item(at index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    func numberOfItems() -> Int {
        return toDoItems.count
    }

    
    func loadToDoItems(completion: @escaping () -> Void) {
        collectionReference.addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Veri getirme hatası: \(error?.localizedDescription ?? "Bilinmeyen Hata")")
                return
            }
            self.toDoItems = documents.compactMap { document in
                let data = document.data()
                let id = document.documentID
                let title = data["title"] as? String ?? ""
                let isCompleted = data["isCompleted"] as? Bool ?? false
                let date = data["date"] as? Date ?? Date()
                return ToDoItem(id: id, title: title, isCompleted: isCompleted, date: date)
            }
            completion()
        }
    }
    
    func addItem(title: String) {
        collectionReference.addDocument(data: [
            "title": title,
            "isCompleted": false,
            "date": Date()
        ])
    }
    
    func updateItem(_ item: ToDoItem) {
        let documentReference = collectionReference.document(item.id)
        documentReference.updateData([
            "title": item.title,
            "isCompleted": item.isCompleted,
            "date": item.date
        ])
    }
    
    func removeItem(at index: Int) {
        let item = toDoItems[index]
        let documentReference = collectionReference.document(item.id)
        documentReference.delete()
    }
}


