import SwiftUI

struct ParalaxView: View {
    /// View Properties
    @Binding var selectedCategory: Category
    @State private var searchText: String = ""
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {

                    Text("Меню")
                    .font(.callout)
                    
                    HStack(spacing: 12) {
                        TextField("Поиск по меню", text: $searchText)
                            
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial, in: .capsule)
                
                Text("Where do you want to \ntravel?")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                
                // Categories View...
                Text("Categories")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
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
                
                
                
                /// Parallax Carousel
                GeometryReader(content: { geometry in
                    let size = geometry.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(tripCards) { card in
                                /// In order to Move the Card in Reverse Direction (Parallax Effect)
                                GeometryReader(content: { proxy in
                                    let cardSize = proxy.size
                                    /// Simple Parallax Effect (Type 2)
                                     //let minX = proxy.frame(in: .scrollView).minX - 30.0
                                    /// Moving Parallax Effect (Type 1)
                                    let minX = min((proxy.frame(in: .scrollView).minX - 30.0) * 1.4, size.width * 1.4)
                                    
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        /// Or You can simply Use scaling
                                        //.scaleEffect(1.25)
                                        .offset(x: -minX)
                                        /// Disable this for Type one Effect
                                        .frame(width: proxy.size.width * 2.5)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .overlay {
                                            OverlayView(card)
                                        }
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
                                })
                                .frame(width: size.width - 60, height: size.height - 50)
                                /// Scroll Animation
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view
                                        .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                })
                .frame(height: 300)
                .padding(.horizontal, -15)
                .padding(.top, 10)
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
    
    /// Overlay View
    @ViewBuilder
    func OverlayView(_ card: TripCard) -> some View {
        ZStack(alignment: .bottomLeading, content: {
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                .clear,
                .clear,
                .black.opacity(0.1),
                .black.opacity(0.5),
                .black
            ], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(card.title)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                
                Text(card.subTitle)
                    .font(.callout)
                    .foregroundStyle(.white.opacity(0.8))
            })
            .padding(20)
        })
    }
}
