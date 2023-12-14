//
//  BookList.swift
//  Reese-ources
//
//  Created by Jessi on 6/8/23.
//

import SwiftUI
import Foundation

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
    var url: URL?
    
    init(category: String, author: String, title: String, description: String, url: URL? = URL(string:"https://yellowbird.dev")) {
        self.category = category
        self.author = author
        self.title = title
        self.description = description
        self.id = UUID()
        self.url = url
    }
   
}
extension Book {
    static let shelf: [Book] = [
        Book(
            category: "\(Category.one.rawValue)",
            author: "Blabey, Aaron",
            title: "Pearl Barley and Charlie Parseley",
            description: "A short, sweet story about how two very different people can be good friends.",
             url: URL(string: "https://www.amazon.com/Pearl-Barley-Charlie-Parsley-Blabey/dp/1590785967")),
        Book(
            category: "\(Category.one.rawValue)",
            author: "Cave, Kathryn",
            title: "Something Else",
            description: "Something Else wants to be like everybody else but finds he isn’t. This is a lovely story about accepting people’s differences.",
            url: URL(string: "https://www.amazon.com/Something-Else-Kathryn-Cave/dp/1572555637")),
        Book(
            category: "\(Category.one.rawValue)",
            author: "Jenkins, Emily",
            title: "The Little Bit Scary People",
            description: "A lovely little story about how some people look or at a little bit scary, but if you’d get to know them better, you’d find out they’re really not. A great vehicle for enhance perspective taking for little ones.",
             url: URL(string: "https://www.amazon.com/Little-Bit-Scary-People/dp/1423100751/ref=sr_1_1?crid=3H9USSX6BBUH2&keywords=emily+jenkins+the+little+bit+scary+people&qid=1702562914&s=books&sprefix=emily+jenkins+the+little+bit+scary+peop%2Cstripbooks%2C210&sr=1-1")),
        Book(
            category: "\(Category.one.rawValue)",
            author: "Leonni, Leo",
            title: "Swimmy",
            description: "This classic story shows how being different can be a strength and how friends can band together to protect one another.",
             url: URL(string: "https://www.amazon.com/Swimmy-Leo-Lionni/dp/0399555501/ref=sr_1_1?crid=2HQAVERO52PH&keywords=Leo+leoni+swimmy&qid=1702562970&s=books&sprefix=leo+leoni+swimm%2Cstripbooks%2C234&sr=1-1")),
        Book(
            category: "\(Category.one.rawValue)",
            author: "Lovell, Patty",
            title: "Stand Tall, Molly Lou Melon",
            description: "When the class bully at her new school makes fun of her, Molly remembers what her grandmother told her and she feels good about herself.",
             url: URL(string: "https://www.amazon.com/Stand-Tall-Molly-Lou-Melon/dp/0399234160/ref=sr_1_1?crid=1OE6JU3RTHRM4&keywords=patty+lovell+stand+tall&qid=1702563023&s=books&sprefix=patty+lovell+stand+tal%2Cstripbooks%2C245&sr=1-1")),
        Book(
            category: "\(Category.one.rawValue)",
            author: "McCain, Becky",
            title: "Nobody Knew What To Do: A Story About Bullying",
            description: "This story delivers the important message that bystanders can make a difference.",
            url: URL(string: "https://www.amazon.com/Nobody-Knew-What-Do-Bullying/dp/0807557137/ref=sr_1_1?crid=1CC0GOEIYSM6K&keywords=becky+mccain+nobody+knew+what+to+do&qid=1702563180&s=books&sprefix=becky+mccain+nobody+knew+what+to+do%2Cstripbooks%2C240&sr=1-1")
        ),
        Book(
            category: "\(Category.one.rawValue)",
            author: "Nickle, John",
            title: "Ant Bully",
            description: "Lucas is picked on by Sid, the neighborhood bully, and takes his anger out on a colony of ants. The ants retaliate and teach him a lesson about empathy.",
            url: URL(string: "https://www.amazon.com/Ant-Bully-Scholastic-Bookshelf/dp/0439851165/ref=sr_1_1?crid=1UG7IT8SETJ2N&keywords=john+nickle+ant+bully&qid=1702563281&s=books&sprefix=john+nickle+ant+bull%2Cstripbooks%2C253&sr=1-1")),
        Book(
            category: "\(Category.one.rawValue)",
            author: "Otoshi, Kathryn",
            title: "One",
            description: "This is a lovely story for preschoolers about how, when you stand up for others who aren’t treated well, you can make a positive difference.",
            url: URL(string: "https://www.amazon.com/One-Kathryn-Otoshi/dp/0972394648/ref=sr_1_1?crid=282HBJ8W6B1T1&keywords=kathryn+otoshi+one&qid=1702563498&s=books&sprefix=kathryn+otashi+on%2Cstripbooks%2C275&sr=1-1")),
        Book(
            category: "\(Category.one.rawValue)",
            author: "Otoshi, Kathryn",
            title: "Zero",
            description: "A great book that shows how everyone has value.",
            url: URL(string: "https://www.amazon.com/Zero-Kathryn-Otoshi/dp/097239463X/ref=sr_1_1?crid=2AZMKVCX1IZ8Z&keywords=kathryn+otoshi+zero&qid=1702563573&s=books&sprefix=kathryn+otoshi+zero%2Cstripbooks%2C444&sr=1-1")),
        Book(
            category: "\(Category.one.rawValue)",
            author: "Seskin, Steve and Allen Shambli",
            title: "Don’t Laugh At Me",
            description: "This picture book helps kids think twice about teasing and name-calling.!",
            url: URL(string: "https://www.amazon.com/Dont-Laugh-Me-Reading-Rainbow/dp/1582460582/ref=sr_1_1?crid=3BLK4AIWWE6K3&keywords=don%27t+laugh+at+me+steve+seskin&qid=1702563716&s=books&sprefix=don%27t+laugh+at+me+steve+seskin%2Cstripbooks%2C231&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Bosch, Carl",
            title: "Bully on the Bus",
            description: "Here, the reader gets to choose the outcome of the story when the protagonist is confronted by a bully on the school bus.",
            url: URL(string: "https://www.amazon.com/Bully-Decision-Yours-Carl-Bosch/dp/0943990432/ref=sr_1_1?crid=M14592Y1YJNZ&keywords=carl+bosch+bully+on+the+bus&qid=1702563834&s=books&sprefix=carl+bosch+bully+on+the+bu%2Cstripbooks%2C213&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Burnett, Karen Gedig",
            title: "Simon’s Hook; A Story About Teases and Put-downs",
            description: "When Simon gets teased Grandma Rose teaches him how to refuse to “take the hook.”",
            url: URL(string: "https://www.amazon.com/Simons-Story-About-Teases-Put-downs/dp/0966853016/ref=sr_1_1?crid=24V61EP9QQP39&keywords=karen+gedib+burnett+simon%27s+hook&qid=1702564159&s=books&sprefix=karen+gedib+burneett+simon%27s+hook%2Cstripbooks%2C186&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Clements, Andrew",
            title: "Jake Drake, Bully Buster",
            description: "In the fourth grade, Jake encounters Link Baxter, SuperBully. Jake learns how to deal with this bully even though Link never stops being one.",
            url: URL(string: "https://www.amazon.com/Drake-Bully-Buster-Andrew-Clements/dp/1416939334/ref=sr_1_4?crid=2TXAO7KQKK0Y0&keywords=andrew+clements+jake+drake&qid=1702564077&s=books&sprefix=andrew+clements+jake+d%2Cstripbooks%2C204&sr=1-4")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "DePino, Catherine",
            title: "Blue Cheese Breath and Stinky Feet",
            description: "Steve is picked on by a bully and is afraid things will get worse if he tells asks for help. His parents come up with a plan to help their son.",
            url: URL(string: "https://www.amazon.com/Blue-Cheese-Breath-Stinky-Feet/dp/1591471117/ref=sr_1_1?crid=1B6963QCHE0JF&keywords=catherine+depino+blue+cheese+breath&qid=1702564223&s=books&sprefix=catherine+depino+blue+cheese+breat%2Cstripbooks%2C177&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Howe, James",
            title: "PINKY, REX and the BULLY",
            description: "Seven-year-old Pinky learns the importance of identity as he defends his favorite color, pink, and his friendship with a girl, Rex, from the neighborhood bully.",
            url: URL(string: "https://www.amazon.com/Pinky-Bully-Ready-Read-Level/dp/0689808348/ref=sr_1_1?crid=3S5KCESAZ3H77&keywords=james+howe+pinky+rex+and+the+bully&qid=1702564476&s=books&sprefix=james+howe+pinky+rex+and+the+bully%2Cstripbooks%2C194&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Hoose, Phillip and Hannah Hoose",
            title: "Hey Little Ant",
            description: "A little ant tries to!convince a boy not to squish him because he has feelings and a family, too. The book allows the reader to determine the outcome of the story - great opportunities for discussion!",
            url: URL(string: "https://www.amazon.com/Hey-Little-Ant-Phillip-Hoose/dp/1883672546/ref=sr_1_1?crid=PXRKGVH4I5CU&keywords=phillip+hoose+hey+little+ant&qid=1702564553&s=books&sprefix=phillip+hoose+hey+little+an%2Cstripbooks%2C185&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Lombard, Jenny",
            title: "Drita My Homegirl",
            description: "Drita escapes war-torn Kosovo and ends up going to a New York public school. Maxie, an African-American student there, doesn’t want to have anything to do with her until they’re paired up for a school project. A great story about how friendship can bloom and overcome two very different cultures.",
            url: URL(string: "https://www.amazon.com/s?k=jenny+lombard+drita+my+homegirl&i=stripbooks&crid=17YGTO6W0H0MS&sprefix=jenny+lombard+drita+my+homegirl%2Cstripbooks%2C192&ref=nb_sb_noss")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Ludwig, Trudy",
            title: "Better Than You",
            description: "This story shows kids how adopting a “better than you” boastful attitude can break friendships rather than build them.",
            url: URL(string: "https://www.amazon.com/Better-Than-You-Trudy-Ludwig/dp/1582463808/ref=sr_1_1?crid=36YCGJ6ISKVNN&keywords=trudy+ludwig+better+than+you&qid=1702564673&s=books&sprefix=trudy+ludwig+better+than+you%2Cstripbooks%2C165&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Ludwig, Trudy",
            title: "Just Kidding",
            description: "A joke that has a sharp edge to it can cut you to pieces. That’s what D.J. finds out from his encounters with a smart-aleck classmate. With the help of grownups he trusts, D.J. learns how to stand up to put downs and make healthier friendship choices",
            url: URL(string: "https://www.amazon.com/Just-Kidding-Trudy-Ludwig/dp/1582461635/ref=sr_1_1?crid=1B09CBXGW1W9D&keywords=trudy+ludwig+just+kidding&qid=1702564638&s=books&sprefix=trudy+ludwig+just+kiddin%2Cstripbooks%2C178&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Ludwig, Trudy",
            title: "My Secret Bully",
            description: "Monica is emotionally bullied by her friend Katie and learns how to cope and thrive with the help of her mother. The book also includes helpful tips, discussion questions and additional resources for parents, teachers and counseling professionals.",
            url: URL(string: "https://www.amazon.com/My-Secret-Bully-Trudy-Ludwig/dp/0553509403/ref=sr_1_1?crid=24FZZEZWG3Q32&keywords=trudy+ludwig+my+secret+bully&qid=1702564709&s=books&sprefix=trudy+ludwig+my+secret+bull%2Cstripbooks%2C168&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Ludwig, Trudy",
            title: "Sorry!",
            description: "Jack learns that there’s a whole lot more to a real apology than a simple “sorry!” This story illustrates how a child can take ownership of hurtful behavior and make right his/her wrongs.", 
            url: URL(string: "https://www.amazon.com/Sorry-Trudy-Ludwig/dp/1582461732/ref=sr_1_1?crid=1D1KWAWCQC6RB&keywords=trudy+ludwig+sorry&qid=1702564737&s=books&sprefix=trudy+ludwig+sorry%2Cstripbooks%2C161&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Ludwig, Trudy",
            title: "Too Perfect",
            description: "At first, Maisie thinks Kayla is perfect. But the more she gets to know Kayla, the more she begins to question whether being perfect is really so wonderful. This book will raise meaningful discussions on working to your potential, not to perfection.",
            url: URL(string: "https://www.amazon.com/Too-Perfect-Trudy-Ludwig/dp/1582462585/ref=sr_1_1?crid=2RRCPC2W08ELU&keywords=trudy+ludwig+too+perfect&qid=1702564761&s=books&sprefix=trudy+ludwig+too+perfec%2Cstripbooks%2C171&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Ludwig, Trudy",
            title: "Trouble Talk®",
            description: "Bailey loves to talk and everything - including everyone is fair game. Bailey soon learns that her “trouble talk” (gossiping, spreading hurtful rumors, sharing other’s information, etc.) is not the way to win lasting friendships.",
            url: URL(string: "https://www.amazon.com/Trouble-Talk-Trudy-Ludwig/dp/1582462402/ref=sr_1_1?crid=2IFMQF3JZ1Y56&keywords=trudy+ludwig+trouble+talk&qid=1702564837&s=books&sprefix=trudy+ludwig+trouble+tal%2Cstripbooks%2C191&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Madonna",
            title: "The English Roses",
            description: "An exclusive girls’ club learns a lesson about judging their peers before really getting to know them.", url: URL(string: "https://www.amazon.com/English-Roses-Madonna/dp/0935112103/ref=sr_1_1?crid=CFKGIN3Y4O8V&keywords=madonna+the+english+roses&qid=1702564865&s=books&sprefix=madonna+the+engl%2Cstripbooks%2C172&sr=1-1")),
        Book(
            category: "\(Category.two.rawValue)",
            author: "Madonna",
            title: "Mr. Peabody's Apples",
            description: "A young boy learns the power of words when spreading a rumor about his teacher and baseball coach Mr. Peabody.", url: URL(string: "https://www.amazon.com/Mr-Peabodys-Apples-Madonna/dp/0670058831/ref=sr_1_1?crid=HDWZTIM45INA&keywords=madonna+mr+peabodys+apples&qid=1702564916&s=books&sprefix=madonna+mr+peabodys+apple%2Cstripbooks%2C186&sr=1-1")),
        Book(
            category: "\(Category.three.rawValue)",
            author: "Blume, Judy",
            title: "Blubber",
            description: "A realistic story about bullying that takes place among fifth grade girls.", 
            url: URL(string: "https://www.amazon.com/Blubber-Judy-Blume/dp/148141013X/ref=sr_1_1?crid=3OEOA58AAP3L6&keywords=blubber&qid=1702565067&s=books&sprefix=blubbe%2Cstripbooks%2C278&sr=1-1")),
        Book(
            category: "\(Category.three.rawValue)",
            author: "Codell, Esme Raji",
            title: "Sahara Special",
            description: "While no longer in Special Ed, Sahara Junes has to repeat fifth grade. Her new, unconventional teacher opens up her world and her heart to celebrate her uniqueness and strengths.", 
            url: URL(string: "https://www.amazon.com/Sahara-Special-Esme-Raji-Codell/dp/0786816112/ref=sr_1_1?crid=2ESHLP2HF02P0&keywords=sahara+special&qid=1702565181&s=books&sprefix=sahara+special%2Cstripbooks%2C225&sr=1-1")),
        Book(
            category: "\(Category.three.rawValue)",
            author: "Codell, Esme Raji",
            title: "Vive La Paris",
            description: "Fifth grader Paris McCray's older brother is being bullied by a younger girl. In her eager efforts to right some wrongs, Paris learns a powerful lesson on the dangers of ignorance.", 
            url: URL(string: "https://www.amazon.com/Vive-Paris-Esme-Raji-Codell/dp/0786851244/ref=sr_1_1?crid=TMAM9915SZ35&keywords=vive+la+paris&qid=1702565199&s=books&sprefix=vive+la+pari%2Cstripbooks%2C164&sr=1-1")),
        Book(
            category: "\(Category.three.rawValue)",
            author: "Dowell, Frances O’Roark",
            title: "The Secret Language of Girls",
            description: "Eleven-year-old Kate can’t understand why her best friend Marylin starts treating her like an enemy.", 
            url: URL(string: "https://www.amazon.com/Secret-Language-Girls-Trilogy/dp/1416907173/ref=tmm_pap_swatch_0?_encoding=UTF8&qid=1702565219&sr=1-1")),
        Book(
            category: "\(Category.three.rawValue)",
            author: "DeClements, Barthe",
            title: "Nothing’s Fair in Fifth Grade",
            description: "A fifth grade class, repelled by the overweight new student who has serious home problems, finally learns to accept her.", 
            url: URL(string: "https://www.amazon.com/Nothings-Fifth-Grade-Barthe-DeClements/dp/0142413496/ref=sr_1_1?crid=2BYGOHAPZXXP2&keywords=nothing%27s+fair+in+5th+grade&qid=1702565262&s=books&sprefix=nothing%27s+fair+%2Cstripbooks%2C166&sr=1-1")),
        Book(
            category: "\(Category.three.rawValue)",
            author: "Estes, Eleanor",
            title: "The Hundred Dresses",
            description: "A Newberry Honor’s classic about a group of who pick on someone who is a little different. Told from the perspective of the bully’s best friend.", 
            url: URL(string: "https://www.amazon.com/Hundred-Dresses-Eleanor-Estes/dp/0152052607/ref=sr_1_1?crid=3UFVDG76F6F29&keywords=the+hundred+dresses&qid=1702565280&s=books&sprefix=the+hundred+d%2Cstripbooks%2C168&sr=1-1")),
        Book(
            category: "\(Category.three.rawValue)",
            author: "Flake, Sharon",
            title: "The Skin I’m In",
            description: "Seventh grader Maleeka, with the guidance of her teacher, overcomes low self-esteem and the bullying behaviors of peers.",
            url: URL(string: "https://www.amazon.com/SKIN-IM-20th-Anniversary/dp/1368019439/ref=sr_1_1?crid=29YK34BOHWSLQ&keywords=the+skin+i%27m+in+sharon+flake&qid=1702565322&s=books&sprefix=the+skin+i%27m+in+sharon+flak%2Cstripbooks%2C163&sr=1-1")),
        Book(
            category: "\(Category.three.rawValue)",
            author: "Gervay, Susanne",
            title: "I am Jack",
            description: "Jack, an eleven-year-old boy, is being bullied at school. Caring bystanders and grown-ups come to his rescue.", 
            url: URL(string: "https://www.amazon.com/Am-Jack-Susanne-Gerbay/dp/1610671287/ref=sr_1_1?crid=3A307UY1HNE5T&keywords=i+am+jack&qid=1702565338&s=books&sprefix=i+am+jack%2Cstripbooks%2C183&sr=1-1")),
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

struct BookList: View {
    var shelf = Book.shelf
    var body: some View {
        ScrollView{
            VStack{
                Text("Book List").font(.custom("DancingScript-Bold", size: 70)).foregroundColor(Color.accentColor).padding(15)
                Section("Pre-School/Elementary"){
                    ForEach(shelf) { book in
                        if (book.category == "Pre-School/Elementary"){
                            VStack{
                                HStack{
                                    Text(book.author).font(.custom("DancingScript-Bold", size: 24)).foregroundColor(.white)
                                    Link(destination: book.url!){
                                        Image(systemName: "bag.badge.plus.fill").font(.custom("DancingScript-Bold", size: 24)).foregroundColor(Color.accentColor)
                                    }
                                }
                                Text(book.title).font(.custom("Gabriela-Regular", size: 20)).underline().foregroundColor(.white)
                                Text(book.description).font(.custom("Gabriela-Regular", size: 18)).foregroundColor(.white)
                                
                                
                            }
                        }
                    }
                }
                .font(.custom("DancingScript-Bold", size: 34)).foregroundColor(.white).padding(5)
                Section("Elementary School"){
                    ForEach(shelf) { book in
                        if (book.category == "Elementary School"){
                            VStack{
                                HStack{
                                    Text(book.author).font(.custom("DancingScript-Bold", size: 24)).foregroundColor(.white)
                                    Link(destination: book.url!){
                                        Image(systemName: "bag.badge.plus.fill").font(.custom("DancingScript-Bold", size: 24)).foregroundColor(Color.accentColor)
                                    }
                                }
                                Text(book.title).font(.custom("Gabriela-Regular", size: 20)).underline().foregroundColor(.white)
                                Text(book.description).font(.custom("Gabriela-Regular", size: 18)).foregroundColor(.white)
                                
                                
                            }
                        }
                    }
                }
                .font(.custom("DancingScript-Bold", size: 34)).foregroundColor(.white).padding(5)
                
                Section("Elementary/Middle School"){
                    ForEach(shelf) { book in
                        if (book.category == "Elementary/Middle School"){
                            VStack{
                                HStack{
                                    Text(book.author).font(.custom("DancingScript-Bold", size: 24)).foregroundColor(.white)
                                    Link(destination: book.url!){
                                        Image(systemName: "bag.badge.plus.fill").font(.custom("DancingScript-Bold", size: 24)).foregroundColor(Color.accentColor)
                                    }
                                }
                                Text(book.title).font(.custom("Gabriela-Regular", size: 20)).underline().foregroundColor(.white)
                                Text(book.description).font(.custom("Gabriela-Regular", size: 18)).foregroundColor(.white)
                                
                                
                            }
                        }
                    }
                }
                .font(.custom("DancingScript-Bold", size: 34)).foregroundColor(.white).padding(5)
            }
            .padding(5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("reeseblue"))
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
    }
}
