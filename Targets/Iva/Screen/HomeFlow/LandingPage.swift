import SwiftUI

struct LandingPage: View {
    @Binding var selectedCategory: Category
    var body: some View {
        VStack(spacing: 15){
            
            HStack{
                
                Button(action: {}, label: {
                    
                    Image(systemName: "circle.grid.2x2")
                        .font(.title2)
                        .padding(10)
                        .background(Color("pink").opacity(0.12))
                        .foregroundColor(Color("pink"))
                        .cornerRadius(8)
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding(10)
                        .background(Color.black.opacity(0.08))
                        .foregroundColor(Color("pink"))
                        .cornerRadius(8)
                })
            }
            .overlay(
            
                HStack(spacing: 4){
                    
                    Image("mapmarker")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color("pink"))
                    
                    Text("California, US")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            )
            .padding()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    // Top View...
                    
                    HStack(spacing: 20){
                        
                        VStack(alignment: .leading, spacing: 12, content: {
                            (
                            
                                Text("The Fastest in Delivery ")
                                +
                                Text("Food")
                                    .foregroundColor(Color("pink"))
                            )
                            .font(.title2)
                            .fontWeight(.bold)
                            
                            // Button
                            
                            Button(action: {}, label: {
                                Text("Order Now")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Color("pink"))
                                    .clipShape(Capsule())
                            })
                        })
                        .padding(.leading)
                        
                        Spacer(minLength: 0)
                        
                        Image("delivery-man")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getRect().width / 3)
                    }
                    .padding()
                    .background(Color("lightYellow"))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    // Categories View...
                    Text("Categories")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding([.horizontal,.top])
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        HStack(spacing: 15){
                            
                            ForEach(categories){category in
                                
                                HStack(spacing: 12){
                                    
                                    Image(category.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 18, height: 18)
                                        .padding(6)
                                        .background(selectedCategory.id == category.id ? Color.white : Color.clear)
                                        .clipShape(Circle())
                                    
                                    Text(category.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(selectedCategory.id == category.id ? .white : .black)
                                }
                                .padding(.vertical,12)
                                .padding(.horizontal)
                                .background(selectedCategory.id == category.id ? Color("pink") : Color.gray.opacity(0.06))
                                .clipShape(Capsule())
                                // Shadows...
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        selectedCategory = category
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top,10)
                    })
                    
                    HStack{
                        
                        Text("Popular Now")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            
                            HStack(spacing: 6){
                                
                                Text("View All")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("pink"))
                                
                                Image(systemName: "chevron.right")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.vertical,4)
                                    .padding(.horizontal,6)
                                    .background(Color("pink"))
                                    .cornerRadius(5)
                            }
                        })
                    }
                    .padding(.horizontal)
                    .padding(.top,10)
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        HStack(spacing: 25){
                            
                            ForEach(popular_Items){item in
                                
                                PopularItemRowView(item: item)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.leading,10)
                        .padding(.top,10)
                    })
                }
                .padding(.vertical)
                .padding(.bottom,20)
            })
        }
        // Light BG COlor..
        .background(Color.black.opacity(0.03).ignoresSafeArea())
    }
}
