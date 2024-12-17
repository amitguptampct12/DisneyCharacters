//
//  CustomActivityIndicator.swift
//  DogFacts
//
//  Created by Amit Gupta on 16/12/24.
//
import SwiftUI

/* SpinnerView is a custom activity indicator which is utilizing ProgressView internally*/

struct SpinnerView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(2.0, anchor: .center)
    }
}
