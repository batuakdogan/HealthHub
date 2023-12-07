//
//  ExerciseViewModel.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 7.12.2023.
//

import Foundation
import Firebase

class ExerciseViewModel {
    private var exercises: [Exercise] = []

    func fetchExercises(completion: @escaping () -> Void) {
        let db = Firestore.firestore()
        db.collection("exercises").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting exercises: \(error.localizedDescription)")
            } else {
                self.exercises.removeAll()
                for document in querySnapshot!.documents {
                    if let name = document["name"] as? String,
                       let caloriesBurned = document["caloriesBurned"] as? Int {
                        let exercise = Exercise(name: name, caloriesBurned: caloriesBurned)
                        self.exercises.append(exercise)
                    }
                }
                completion()
            }
        }
    }

    func generateRandomWorkout(calorieGoal: Int) -> [Exercise] {
        var remainingCalories = calorieGoal
        var workout: [Exercise] = []

        var availableExercises = exercises

        while remainingCalories > 0 && availableExercises.count > 0 {
            let randomIndex = Int.random(in: 0..<availableExercises.count)
            let selectedExercise = availableExercises[randomIndex]

            workout.append(selectedExercise)
            remainingCalories -= selectedExercise.caloriesBurned

            availableExercises.remove(at: randomIndex)
        }

        return workout
    }
}
