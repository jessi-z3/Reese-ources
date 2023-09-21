//
//  SwiftUIView.swift
//  Reese-ources
//
//  Created by Jessi on 6/7/23.
//

import SwiftUI
import PDFKit

struct PDFViewView: View {
    var name: String
    // Creating a URL for the PDF and saving it in the pdfUrl variable
    var body: some View {
        let pdfUrl = Bundle.main.url(forResource: name, withExtension: "pdf")
        
        HStack{
            VStack{
                
                // Using the PDFKitView and passing the previously created pdfURL
                PDFKitView(url: pdfUrl!)
                    .scaledToFill()
                ShareLink(item: pdfUrl!).font(.custom("Gabriela-Regular", size: 18)).frame(width: 100, height: 30).background(Color("reeselightblue")).cornerRadius(9).padding(5)

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("reeseblue"))
    }
}
struct PDFKitView: UIViewRepresentable {
    let url: URL // new variable to get the URL of the document

    func makeUIView(context: UIViewRepresentableContext<PDFKitView>) -> PDFView {
        // Creating a new PDFVIew and adding a document to it
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        pdfView.scaleFactor = 0.7
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFKitView>) {
        // we will leave this empty as we don't need to update the PDF
    }
}
struct PDFViewView_Preview: PreviewProvider {
    static var previews: some View {
        PDFViewView(name: "Mission")
    }
}
