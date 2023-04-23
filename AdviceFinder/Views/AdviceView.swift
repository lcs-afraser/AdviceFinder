import SwiftUI

struct AdviceView: View {
    
    //MARK: Stored properties
    
    //0.0 is invisible, 1.0 is visible
    @State var adviceOpacity = 0.0
    
    //The current joke to display
    @State var currentAdvice: Advice?
    
    //MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                if let currentAdvice = currentAdvice {
                    Button(action:  {
                        withAnimation(.easeIn(duration: 1.0)) {
                            adviceOpacity = 1.0
                        }
                    }, label: {
                        Image(systemName: "arrow.down.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .tint(.black)
                    })
                    Text(currentAdvice.slip.advice)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .opacity(adviceOpacity)
                    
                } else {
                    //Show a spinning wheel indicator until the joke is loaded
                  ProgressView()
                }
                
                Spacer()
                Button(action: {
                    // Reset the interface
                    adviceOpacity = 0.0

                    Task {
                        // Get another joke
                        withAnimation {
                            currentAdvice = nil
                        }
                        currentAdvice = await NetworkService.fetch()
                    }
                }, label: {
                    Text("Fetch another one")
                })
                .disabled(adviceOpacity == 0.0 ? true : false)
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Random Advice")
        }
        //Create an asynchronous task to be performed as this view appears
        .task {
            currentAdvice = await NetworkService.fetch()
        }
    }
}

struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
    }
}
