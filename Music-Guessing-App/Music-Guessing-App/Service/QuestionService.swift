//
//  QuestionService.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 7/16/25.
//

import Foundation

class QuestionService {
    func fetchQuestions(completion: @escaping ([AudioQuestion]) -> Void) {
        guard let url = URL(string: "http://10.0.0.113:5179/api/questions") else {
            print("Invalid URL")
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching questions:", error)
                completion([])
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let questions = try decoder.decode([AudioQuestion].self, from: data)
                DispatchQueue.main.async {
                    completion(questions)
                }
            } catch {
                print("Failed to decode JSON:", error)
                completion([])
            }
        }.resume()
    }
}
