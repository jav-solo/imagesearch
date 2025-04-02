//
//  HTTPAuthorization.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/2/25.
//

protocol HTTPAuthorization {
    var fieldKey: String { get }
    var value: String { get }
}
