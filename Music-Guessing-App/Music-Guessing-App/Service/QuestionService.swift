//
//  QuestionService.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 7/16/25.
//

import SwiftUI
import Swift

class QuestionService {
    func fetchQuestions(completion: @escaping ([AudioQuestion]) -> Void) {
        guard let url = URL(string: "http://localhost:5179/api/questions") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let questions = try JSONDecoder().decode([AudioQuestion].self, from: data)
                DispatchQueue.main.async {
                    completion(questions)
                }
            } catch {
                print("Failed to decode:", error)
            }
        }.resume()
    }
}
