//
//  CreateProfileWaitingView.swift
//  FRW
//
//  Created by cat on 2024/6/5.
//

import SwiftUI
import SwiftUIPager
import SwiftUIX

struct CreateProfileWaitingView: RouteableView {
    @StateObject var viewModel: CreateProfileWaitingViewModel
    
    var title: String {
        return ""
    }
    
    var isNavigationBarHidden: Bool {
        true
    }
    
    init(_ viewModel: CreateProfileWaitingViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            bodyContainer
                .overlay(alignment: .bottomTrailing) {
                    HStack {
                        Spacer()
                        HStack(spacing: 15) {
                            ForEach(items.indices, id: \.self) { index in
                                let item = items[viewModel.currentPage]
                                Capsule()
                                    .fill(viewModel.currentPage == index ? item.color : Color.Theme.Line.line)
                                    .frame(width: viewModel.currentPage == index ? 20 : 7, height: 7)
                            }
                        }
                        .overlay(alignment: .leading) {
                            let item = items[viewModel.currentPage]
                            Capsule()
                                .fill(item.color)
                                .frame(width: 20, height: 7)
                                .offset(x: getOffset())
                        }
                        Color.clear
                            .frame(width: 48, height: 1)
                    }
                    .padding(.bottom, 150)
                }
        }
        .padding(.top, 40)
        .padding(.leading, 32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundFill(Color.Theme.Background.grey)
        .applyRouteable(self)
    }
    
    func getOffset() -> CGFloat {
        return CGFloat(22 * viewModel.currentPage)
    }
    
    var items: [CreateProfileWaitingView.Item] {
        CreateProfileWaitingView.Item.default()
    }
    
    var spinnerSubModel: VSpinnerModelContinous {
        var model: VSpinnerModelContinous = .init()
        model.colors.spinner = Color.Theme.Accent.green
        return model
    }
}

extension CreateProfileWaitingView {
    var bodyContainer: some View {
        Pager(page: viewModel.page, data: CreateProfileWaitingView.Item.default(), id: \.self) { item in
            createPageView(item: item)
        }
        .bounces(false)
        .onDraggingBegan {
            viewModel.onPageDrag(true)
        }
        .onDraggingEnded {
            viewModel.onPageDrag(false)
        }
        .onPageWillChange { willIndex in
            viewModel.onPageIndexChangeAction(willIndex)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func createPageView(item: CreateProfileWaitingView.Item) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image("lilico-app-icon")
                    .resizable()
                    .frame(width: 32, height: 32)
                Text("app_name_full".localized)
                    .font(.inter(size: 18, weight: .semibold))
                    .foregroundStyle(Color.Theme.Text.black)
                Spacer()
            }
            Spacer()
            VStack(alignment: .leading, spacing: 25) {
                HStack(alignment: .top) {
                    VStack {
                        Text(item.title)
                            .font(.montserrat(size: 48, weight: .light))
                            .fontWeight(.thin)
                            .foregroundStyle(Color.Theme.Text.black)
                            .padding(.trailing, 32)

                        Spacer()
                    }
                    Spacer()
                }
                .frame(height: 318)
                .background {
                    VStack {
                        HStack {
                            Spacer()
                            Image(item.image)
                                .offset(y: 10)
                        }
                    }
                }
                
                Text(item.desc)
                    .font(.inter(size: 18, weight: .light))
                    .foregroundStyle(Color.Theme.Text.black8)
                    .padding(.trailing, 32)
            }
            
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                if viewModel.createFinished {
                    Button {
                        viewModel.onConfirm()
                    } label: {
                        HStack {
                            Text("Go with the FLOW")
                                .font(.inter(size: 14, weight: .bold))
                                .foregroundStyle(Color.Theme.Text.white9)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                        .background(Color.Theme.Accent.green)
                        .cornerRadius(16)
                    }
                } else {
                    VStack {
                        HStack {
                            Text("😃")
                                .font(.inter(size: 14, weight: .bold))
                            Text("take_mins".localized)
                                .font(.inter(size: 14))
                                .foregroundStyle(Color.Theme.Accent.green)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.Theme.Accent.green.opacity(0.12))
                        .cornerRadius(8)
                        
                        HStack {
                            Text("Creating your Profile")
                                .font(.inter(size: 14, weight: .bold))
                                .foregroundStyle(Color.Theme.Accent.green)
                            ActivityIndicator()
                        }
                        .frame(width: 220, height: 56)
                        .border(Color.Theme.Accent.green, cornerRadius: 16)
                    }
                    
                }
                Spacer()
            }
            .padding(.bottom, 30)
        }
    }
}

extension CreateProfileWaitingView {
    struct Item: Equatable, Hashable {
        let title: String
        let desc: String
        let image: String
        let color: Color
        
        static func `default`() -> [CreateProfileWaitingView.Item] {
            return [
                Item(title: "security,\npowered by\nSecure\nEnclave.", desc: "Flow Wallet uses your device’s Secure Enclave to secure your Flow account.", image: "create_profile_bg_0", color: Color.Theme.Accent.green),
                Item(title: "your device,\nis now a\nHardware\nWallet.", desc: "Secure Enclave is special hardware on your device that Flow Wallet uses to turn your device into a hardware wallet.", image: "create_profile_bg_1", color: Color.Theme.Accent.purple),
                Item(title: "you just,\nunlocked\nTrue\nOwnership.", desc: "Your assets are secured by your device, unlocking true ownership of your assets on Flow.", image: "create_profile_bg_2", color: Color.Theme.Accent.blue)
            ]
        }
    }
}

#Preview {
    CreateProfileWaitingView(CreateProfileWaitingViewModel(txId: "", callback: { _ in
        
    }))
}
