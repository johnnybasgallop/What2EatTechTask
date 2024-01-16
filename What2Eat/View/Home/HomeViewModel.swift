import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var randomRecipe: RecipeModel?
    @Published var errorMessage: String?
    
    func fetchRandomRecipe() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else {
            errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            
            guard let data = data else {
                self.errorMessage = "No data received"
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([String: [RecipeModel]].self, from: data)
                
                if let meals = result["meals"], let firstMeal = meals.first {
                    DispatchQueue.main.async {
                        self.randomRecipe = firstMeal
                        self.errorMessage = nil
                    }
                } 
                else {self.errorMessage = "Invalid JSON format"}
                
            } catch {self.errorMessage = error.localizedDescription}
        }.resume()
    }
}
