//
//  PageControl.swift
//  Landmarks
//
//  Created by Gustavo Amaral on 23/11/23.
//

import SwiftUI

struct PageControl: View, UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(_:)),
            for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let pageControl = uiView as? UIPageControl else { return }
        pageControl.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(_ sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
