//
//  DisMissButton.swift
//  team-comit
//
//  Created by 홍승재 on 2022/10/20.
//

import SwiftUI

struct DismissButton: View {
    @Environment(\.colorScheme) var scheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(Theme.fontColor(forScheme: scheme))
                    .fontWeight(.medium)
                    .frame(width: 8.87, height: 15.59)
                Spacer()
            }
        }
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
