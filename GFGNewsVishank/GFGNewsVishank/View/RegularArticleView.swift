import SwiftUI

struct RegularArticleView: View {
    
    let article: Item!
    
    var body: some View {
        
        ZStack {
            Color(AppConstants.bgGrey)
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    if let title = article.title, let pubDate = article.pubDate {
                        Text(title)
                            .font(.headline)
                            .titleModifier()
                        Spacer()
                        HStack {
                            Text(pubDate.getDate())
                                .dateModifier()
                            Text(pubDate.getTime())
                                .timeModifier()
                        }
                    }
                }
                .padding()
                Spacer(minLength: 5)
                if let link = article.thumbnail?.components(separatedBy: "?")[0] {
                    AsyncImage(url: URL(string: link)) { image in
                        image
                            .resizable()
                            .frame(width: 120, height: 130)
                    } placeholder: {
                        Text("")
                    }
                }
            }
            .rowModifier()
        }
    }
}

struct RegularArticleView_Previews: PreviewProvider {
    static var previews: some View {
        RegularArticleView(article: APIService.shared.items[0])
            .previewLayout(.sizeThatFits)
    }
}
