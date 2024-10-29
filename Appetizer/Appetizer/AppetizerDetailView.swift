import SwiftUI
struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @EnvironmentObject var order: Order
    @Binding var isShowingDetail:  Bool
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
               
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            HStack(spacing: 40){
                VStack{
                    Text("Clories")
                        .font(.caption)
                        .bold()
                        
                    Text("\(appetizer.calories,specifier: "%.0f")")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }

                VStack{
                    Text("Carbs")
                        .font(.caption)
                        .bold()
                        
                    Text("\(appetizer.carbs,specifier: "%.0f")")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }

                VStack{
                    Text("Protien")
                        .font(.caption)
                        .bold()
                        
                    Text("\(appetizer.protein,specifier: "%.0f")")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color.PrimaryColor)
                    .cornerRadius(10)
                
            }
            .padding(.bottom, 30)
        }
            .frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button{
                isShowingDetail = false
            }
                     label:{
                ZStack{
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    
                    Image(systemName: "xmark")
                        .frame(width: 44, height: 44)
                        .imageScale(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                        .frame(width: 44, height: 44)
                        .foregroundColor(.black)
                }
            }
                     ,alignment: .topTrailing)
        
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
    }
}
