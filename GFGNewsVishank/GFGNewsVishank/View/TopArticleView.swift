import SwiftUI

struct TopArticleView: View {
    let article: Item!
    var body: some View {
        ZStack {
            Color(AppConstants.bgGrey)
            VStack(alignment: .leading, spacing: 0) {
                if let link = article.enclosure?.link?.components(separatedBy: "?")[0]  {
                    AsyncImage(url: URL(string: link)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Text("")
                    }
                }
                if let title = article.title, let pubDate = article.pubDate {
                    Text(title)
                        .font(.title3)
                        .titleModifier()
                        .padding()
                    Divider()
                        .padding(.horizontal)
                    HStack {
                        Text(pubDate.getDate())
                            .dateModifier()
                        Text(pubDate.getTime())
                            .timeModifier()
                    }
                    .padding()
                }
            }
            .rowModifier()
            .padding(.top)
        }
    }
}

struct TopArticleView_Previews: PreviewProvider {
    static var previews: some View {
        TopArticleView(article: APIService.shared.items[0])
            .previewLayout(.sizeThatFits)
    }
}
