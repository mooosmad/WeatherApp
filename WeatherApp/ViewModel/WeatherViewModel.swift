//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mo Smad on 21/08/2022.
//

import Foundation


class WeatherViewModel:ObservableObject{
    
    
    @Published var currentWeather:Currentweather?
    
    
    func getCurrentTemp(city: String){
        
        
        guard let url = URL(string: "http://api.weatherstack.com/current?access_key=4027946a41d41e8b057481889bd4123d&query=\(city)")
        else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, reponse, error in
            
            if let error = error {
                print("Request erro:", error.localizedDescription)
                return
            }
            
            guard let reponse = reponse as? HTTPURLResponse else {
                return
            }
            
            if reponse.statusCode == 200{
                guard let data = data else {
                    return
                }
                
                DispatchQueue.main.async {
                    
                    do{
                        
                        
                        let currentItem = try JSONDecoder().decode(Currentweather.self,from:data)
                        
                        self.currentWeather = currentItem
                        
                        
                    }catch let DecodingError.dataCorrupted(context) {
                        print(context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("la cle '\(key)' n'est pas trouvé:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("la valeur'\(value)' n'est pas trouvé:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error.localizedDescription)
                    }
                }
                    
                
            }
            
        }
        
    }
}
