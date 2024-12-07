//
//  Interactor.swift
//  ViperCryptoCrazy
//
//  Created by Alperen KARACA on 7.12.2024.
//

import Foundation

// Talks to -> Presenter

protocol AnyInteractor {
    var presenter : AnyPresenter? { get set}
    
    func downloadCryptos()
}

class CryptoInteractor: AnyInteractor {
    var presenter: (any AnyPresenter)?
    
    func downloadCryptos() {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") else { return
        }
            
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data , error == nil else {
                self.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
                return
            }
            
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            } catch {
                self.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
            }
            
            
        }
        
        task.resume()
        
    }
    
    
}
