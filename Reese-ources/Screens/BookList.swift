struct IdentifiableURL: Identifiable {
    let id = UUID()
    let url: URL
}
//
//  BookList.swift
//  Reese-ources
//
//  Created by Jessi on 6/8/23.
//

import SwiftUI
import Foundation
import SafariServices


enum Category: String{
    case one = "Pre-School/Elementary";
    case two = "Elementary School";
    case three = "Elementary/Middle School";
}
struct Book: Identifiable {
    var id: UUID
    
    var category: String
    var author: String
    var title: String
    var description: String
    
    init(category: String, author: String, title: String, description: String) {
        self.category = category
        self.author = author
        self.title = title
        self.description = description
        self.id = UUID()
    }
}
extension Book {
    static let shelf: [Book] = [
        Book(category: "\(Category.one.rawValue)", author: "Blabey, Aaron", title: "Pearl Barley and Charlie Parseley", description: "A short, sweet story about how two very different people can be good friends."),
        Book(category: "\(Category.one.rawValue)", author: "Cave, Kathryn", title: "Something Else", description: "Something Else wants to be like everybody else but finds he isn’t. This is a lovely story about accepting people’s differences."),
        Book(category: "\(Category.one.rawValue)",
        author: "Blabey, Aaron",
        title: "Pearl Barley and Charlie Parseley",
        description: "A short, sweet story about how two very different people can be good friends."),
        Book(category: "\(Category.one.rawValue)",
        author: "Cave, Kathryn",
        title: "Something Else",
        description: "Something Else wants to be like everybody else but finds he isn’t. This is a lovely story about accepting people’s differences."),
        Book(category: "\(Category.one.rawValue)",
        author: "Jenkins, Emily",
        title: "The Little Bit Scary People",
        description: "A lovely little story about how some people look or at a little bit scary, but if you’d get to know them better, you’d find out they’re really not. A great vehicle for enhance perspective taking for little ones."),
        Book(category: "\(Category.one.rawValue)",
        author: "Leoni, Leo",
        title: "Swimmy",
        description: "This classic story shows how being different can be a strength and how friends can band together to protect one another."),
        Book(category: "\(Category.one.rawValue)",
        author: "Lovell, Patty",
        title: "Stand Tall, Molly Lou Melon",
        description: "When the class bully at her new school makes fun of her, Molly remembers what her grandmother told her and she feels good about herself."),
        Book(category: "\(Category.one.rawValue)",
        author: "McCain, Becky",
        title: "Nobody Knew What To Do: A Story About Bullying",
        description: "This story delivers the important message that bystanders can make a difference."),
        Book(category: "\(Category.one.rawValue)",
        author: "Nickle, John",
        title: "Ant Bully",
        description: "Lucas is picked on by Sid, the neighborhood bully, and takes his anger out on a colony of ants. The ants retaliate and teach him a lesson about empathy."),
        Book(category: "\(Category.one.rawValue)",
        author: "Otoshi, Kathryn",
        title: "One",
        description: "This is a lovely story for preschoolers about how, when you stand up for others who aren’t treated well, you can make a positive difference."),
        Book(category: "\(Category.one.rawValue)",
        author: "Otoshi, Kathryn",
        title: "Zero",
        description: "A great book that shows how everyone has value."),
        Book(category: "\(Category.one.rawValue)",
        author: "Seskin, Steve and Allen Shambli",
        title: "Don’t Laugh At Me",
        description: "This picture book helps kids think twice about teasing and name-calling.!"),
        Book(category: "\(Category.two.rawValue)",
        author: "Bosch, Carl",
        title: "Bully on the Bus",
        description: "Here, the reader gets to choose the outcome of the story when the protagonist is confronted by a bully on the school bus."),
        Book(category: "\(Category.two.rawValue)",
        author: "Burnett, Karen Gedig",
        title: "Simon’s Hook; A Story About Teases and Put-downs",
        description: "When Simon gets teased Grandma Rose teaches him how to refuse to “take the hook.”"),
        Book(category: "\(Category.two.rawValue)",
        author: "Clements, Andrew",
        title: "Jake Drake, Bully Buster",
        description: "In the fourth grade, Jake encounters Link Baxter, SuperBully. Jake learns how to deal with this bully even though Link never stops being one."),
        Book(category: "\(Category.two.rawValue)",
        author: "DePino, Catherine",
        title: "Blue Cheese Breath and Stinky Feet",
        description: "Steve is picked on by a bully and is afraid things will get worse if he tells asks for help. His parents come up with a plan to help their son."),
        Book(category: "\(Category.two.rawValue)",
        author: "Howe, James",
        title: "PINKY, REX and the BULLY",
        description: "Seven-year-old Pinky learns the importance of identity as he defends his favorite color, pink, and his friendship with a girl, Rex, from the neighborhood bully."),
        Book(category: "\(Category.two.rawValue)",
        author: "Hoose, Phillip and Hannah Hoose",
        title: "Hey Little Ant",
        description: "A little ant tries to!convince a boy not to squish him because he has feelings and a family, too. The book allows the reader to determine the outcome of the story - great opportunities for discussion!"),
        Book(category: "\(Category.two.rawValue)",
        author: "Lombard, Jenny",
        title: "Drita My Homegirl",
        description: "Drita escapes war-torn Kosovo and ends up going to a New York public school. Maxie, an African-American student there, doesn’t want to have anything to do with her until they’re paired up for a school project. A great story about how friendship can bloom and overcome two very different cultures."),
        Book(category: "\(Category.two.rawValue)",
        author: "Ludwig, Trudy",
        title: "Better Than You",
        description: "This story shows kids how adopting a “better than you” boastful attitude can break friendships rather than build them."),
        Book(category: "\(Category.two.rawValue)",
        author: "Ludwig, Trudy",
        title: "Just Kidding",
        description: "A joke that has a sharp edge to it can cut you to pieces. That’s what D.J. finds out from his encounters with a smart-aleck classmate. With the help of grownups he trusts, D.J. learns how to stand up to put downs and make healthier friendship choices"),
        Book(category: "\(Category.two.rawValue)",
        author: "Ludwig, Trudy",
        title: "My Secret Bully",
        description: "Monica is emotionally bullied by her friend Katie and learns how to cope and thrive with the help of her mother. The book also includes helpful tips, discussion questions and additional resources for parents, teachers and counseling professionals."),
        Book(category: "\(Category.two.rawValue)",
        author: "Ludwig, Trudy",
        title: "Sorry!",
        description: "Jack learns that there’s a whole lot more to a real apology than a simple “sorry!” This story illustrates how a child can take ownership of hurtful behavior and make right his/her wrongs."),
        Book(category: "\(Category.two.rawValue)",
        author: "Ludwig, Trudy",
        title: "Too Perfect",
        description: "At first, Maisie thinks Kayla is perfect. But the more she gets to know Kayla, the more she begins to question whether being perfect is really so wonderful. This book will raise meaningful discussions on working to your potential, not to perfection."),
        Book(category: "\(Category.two.rawValue)",
        author: "Ludwig, Trudy",
        title: "Trouble Talk®",
        description: "Bailey loves to talk and everything - including everyone is fair game. Bailey soon learns that her “trouble talk” (gossiping, spreading hurtful rumors, sharing other’s information, etc.) is not the way to win lasting friendships."),
        Book(category: "\(Category.two.rawValue)",
        author: "Madonna",
        title: "The English Roses",
        description: "An exclusive girls’ club learns a lesson about judging their peers before really getting to know them."),
        Book(category: "\(Category.two.rawValue)",
        author: "Madonna",
        title: "Mr. Peabody's Apples",
        description: "A young boy learns the power of words when spreading a rumor about his teacher and baseball coach Mr. Peabody."),
        Book(category: "\(Category.three.rawValue)",
        author: "Blume, Judy",
        title: "Blubber",
        description: "A realistic story about bullying that takes place among fifth grade girls."),
        Book(category: "\(Category.three.rawValue)",
        author: "Codell, Esme Raji",
        title: "Sahara Special",
        description: "While no longer in Special Ed, Sahara Junes has to repeat fifth grade. Her new, unconventional teacher opens up her world and her heart to celebrate her uniqueness and strengths."),
        Book(category: "\(Category.three.rawValue)",
        author: "Codell, Esme Raji",
        title: "Vive La Paris",
        description: "Fifth grader Paris McCray's older brother is being bullied by a younger girl. In her eager efforts to right some wrongs, Paris learns a powerful lesson on the dangers of ignorance."),
        Book(category: "\(Category.three.rawValue)",
        author: "Dowell, Frances O’Roark",
        title: "The Secret Language of Girls",
        description: "Eleven-year-old Kate can’t understand why her best friend Marylin starts treating her like an enemy."),
        Book(category: "\(Category.three.rawValue)",
        author: "DeClements, Barthe",
        title: "Nothing’s Fair in Fifth Grade",
        description: "A fifth grade class, repelled by the overweight new student who has serious home problems, finally learns to accept her."),
        Book(category: "\(Category.three.rawValue)",
        author: "Estes, Eleanor",
        title: "The Hundred Dresses",
        description: "A Newberry Honor’s classic about a group of who pick on someone who is a little different. Told from the perspective of the bully’s best friend."),
        Book(category: "\(Category.three.rawValue)",
        author: "Flake, Sharon",
        title: "The Skin I’m In",
        description: "Seventh grader Maleeka, with the guidance of her teacher, overcomes low self-esteem and the bullying behaviors of peers."),
        Book(category: "\(Category.three.rawValue)",
        author: "Gervay, Susanne",
        title: "I am Jack",
        description: "Jack, an eleven-year-old boy, is being bullied at school. Caring bystanders and grown-ups come to his rescue."),
    ]
    struct Data {
            var category: String = ""
            var author: String = ""
            var title: String = ""
            var description: String = ""
            var id = UUID()
        }
        var data : Data {
            Data(category: category, author: author, title: title, description: description)
        }
        mutating func update(from data: Data) {
            category = data.category
            author = data.author
            title = data.title
            description = data.description
            id = data.id
        }
        
        init(data: Data) {
            category = data.category
            author = data.author
            title = data.title
            description = data.description
            id = data.id
        }
}

enum SortOption {
    case title
    case author
}

struct BookList: View {
    @State private var showSafari = false
    @State private var selectedURL: IdentifiableURL? = nil
    @State private var searchText = ""
    @State private var selectedCategory: Category? = nil
    @State private var sortOption: SortOption = .title
    
    var shelf = Book.shelf
    
    // Refactor the filtering and sorting logic
    var filteredBooks: [Book] {
        shelf
            .filter {
                (searchText.isEmpty ||
                 $0.title.localizedCaseInsensitiveContains(searchText) ||
                 $0.author.localizedCaseInsensitiveContains(searchText)) &&
                (selectedCategory == nil || $0.category == selectedCategory!.rawValue)
            }
            .sorted(by: { sortOption == .title ? $0.title < $1.title : $0.author < $1.author })
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Picker("Category", selection: $selectedCategory) {
                        Text("All").tag(nil as Category?)
                        ForEach([Category.one, Category.two, Category.three], id: \.self) { category in
                            Text(category.rawValue).tag(Optional(category))
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .padding()

                    // Add sort option Picker
                    Picker("Sort by", selection: $sortOption) {
                        Text("Title").tag(SortOption.title)
                        Text("Author").tag(SortOption.author)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)

                    // Use filteredBooks directly here
                    Section(header: Text("Pre-School/Elementary")
                        .font(.custom("DancingScript-Bold", size: 34))
                        .foregroundColor(.white)
                        .padding(5)) {
                        ForEach(filteredBooks.filter { $0.category == Category.one.rawValue }) { category in
                            BookCardView(book: category, showSafari: $showSafari, selectedURL: $selectedURL)
                        }
                    }

                    Section(header: Text("Elementary School")
                        .font(.custom("DancingScript-Bold", size: 34))
                        .foregroundColor(.white)
                        .padding(5)) {
                        ForEach(filteredBooks.filter { $0.category == Category.two.rawValue }) { category in
                            BookCardView(book: category, showSafari: $showSafari, selectedURL: $selectedURL)
                        }
                    }

                    Section(header: Text("Elementary/Middle School")
                        .font(.custom("DancingScript-Bold", size: 34))
                        .foregroundColor(.white)
                        .padding(5)) {
                        ForEach(filteredBooks.filter { $0.category == Category.three.rawValue }) { category in
                            BookCardView(book: category, showSafari: $showSafari, selectedURL: $selectedURL)
                        }
                    }
                }
                .padding(5)
            }
            .navigationTitle("Books")
            .searchable(text: $searchText)
            .background(Color("reeseblue"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(item: $selectedURL) { identifiableURL in
            SafariView(url: identifiableURL.url)
        }
    }
}


struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ vc: SFSafariViewController, context: Context) {}
}

struct BookCardView: View {
    var book: Book
    @Binding var showSafari: Bool
    @Binding var selectedURL: IdentifiableURL?

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "book.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.white)

                let formattedAuthor = book.author
                    .components(separatedBy: ", ")
                    .reversed()
                    .joined(separator: " ")

                Text(formattedAuthor)
                    .font(.custom("DancingScript-Bold", size: 24))
                    .foregroundColor(.white)
                    .padding(5)

                Text(book.title)
                    .font(.custom("Gabriela-Regular", size: 20))
                    .underline()
                    .foregroundColor(.white)

                Text(book.description)
                    .font(.custom("Gabriela-Regular", size: 18))
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(10)

            Button(action: {
                let formattedAuthor = book.author.components(separatedBy: ", ").reversed().joined(separator: " ")
                let query = "\(book.title) \(formattedAuthor)"
                if let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                   let url = URL(string: "https://www.amazon.com/s?k=\(encoded)") {
                    selectedURL = IdentifiableURL(url: url) // This will trigger the Safari sheet
                }
            }) {
                Text("Buy Book")
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .foregroundColor(.accentColor)
                    .cornerRadius(25)
                    .shadow(radius: 2)
            }
            .padding(.bottom, 10)
        }
        .padding(.bottom, 15) // Added padding for spacing between cards
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
    }
}
