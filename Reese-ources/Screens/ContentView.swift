import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var context

    var body: some View {
        TabView {
            NavigationStack {
                ScrollView {
                    VStack {
                        Image("Logo")
                            .resizable().scaledToFit().frame(height: 195).padding(5)
                        VStack {
                            HStack {
                                NavigationLink {
                                    VStack {
                                        Text("Mission").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 18))
                                        Spacer()
                                        Text("My mission as your Miss Heartland Teen USA is to put an end to bullying once and for all. Bullying has taken many lives, tears, and love from many today. With Reese-ources I want users to acknowledge signs of bullying quicker, learn to use the resources provided to speak up, and make a difference one bully at a time. Reese-ources is activitly it implementing anti-bullying presentations into classrooms by providing many different materials to teachers to provide around the classroom.")
                                            .foregroundColor(Color.accentColor)
                                            .font(.custom("Gabriela-Regular", size: 18))
                                            .padding(15)
                                        Spacer()
                                    }
                                    .background(Color("reeselightblue"))
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 170, height: 100)
                                        Text("Mission").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 20))
                                    }
                                }.padding(5)

                                NavigationLink {
                                    VStack{
                                        Text("Bullying Signs")
                                            .font(.custom("Gabriela-Regular", size: 20))
                                            .foregroundStyle(Color.accentColor)
                                        Spacer()
                                        Text("""
                                            - Name calling
                                            - Making hurtful jokes
                                            - Unwelcome teasing
                                            - Spreading rumors
                                            - Talking behind someone’s back
                                            - Intentional backhanded comments
                                            - Teasing and taunting
                                            - Leaving others out
                                            - Manipulation
                                            - Humiliation 
                                            
                                            If you feel as though any of these have played into a day at school, work, or home, reach out to a trusted adult. You can also reach out to any of the numbers listed in my resources! Just tap on the triangle at the bottom of the screen! 
                                            """)
                                        .font(.custom("Gabriela-Regular", size: 18))
                                        .foregroundStyle(Color.accentColor)
                                        .padding()
                                        Spacer()
                                    }
                                    .background(Color("reeselightblue"))
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 170, height: 100)
                                        Text("Bullying Signs").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 18))
                                    }
                                }.padding(5)
                            }

                            HStack {
                                NavigationLink {
                                    VStack{
                                        Text("Buddy Benches")
                                            .foregroundColor(Color.accentColor)
                                            .font(.custom("Gabriela-Regular", size: 20))
                                        Spacer()
                                        Text("""
                                            I have been a partner with Green Tree Plastics for almost 2 years and continuing, working on Buddy Benches for local Schools. For those who don’t know, Buddy Benches are benches installed in playgrounds or parks for those who were once like me. Sitting by yourself and not wanting to go to recess at all is something that no kid should face. That’s why I’m so passionate about this project. These benches change lives, giving kids a reason to be excited for recess. Having the chance to sit on this bench sends a signal to other kids at recess that this individual needs someone to play with. My benches are completely recycled as well! I have collected over 400 pounds of bottle caps to melt down into these beautiful benches! Go #…! I have installed two benches so far and I plan to continue this project to ensure that no kid sits alone.
                                            """)
                                        .font(.custom("Gabriela-Regular", size: 18))
                                        .foregroundStyle(Color.accentColor)
                                        .padding()
                                        Spacer()
                                    }
                                    .background(Color("reeselightblue"))
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 170, height: 100)
                                        Text("Buddy Benches").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 18))
                                    }
                                }.padding(5)

                                NavigationLink {
                                    VStack {
                                        Text("Take the Pledge")
                                            .font(.custom("Gabriela-Regular", size: 24))
                                            .foregroundStyle(Color.accentColor)
                                            .padding(.top)

                                        Text("By taking this pledge, you're committing to speak up, support others, and help end bullying in your community. Your voice matters, and your actions make a difference.")
                                            .font(.custom("Gabriela-Regular", size: 18))
                                            .foregroundStyle(Color.accentColor)
                                            .multilineTextAlignment(.center)
                                            .padding()

                                        NavigationLink(destination: NewsFeed()) {
                                            Text("Go to Pledge Wall")
                                                .font(.custom("Gabriela-Regular", size: 20))
                                                .padding()
                                                .background(Color.accentColor.opacity(0.2))
                                                .cornerRadius(12)
                                        }

                                        Spacer()
                                    }
                                    .background(Color("reeselightblue"))
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 170, height: 100)
                                        Text("Pledge").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 18))
                                    }
                                }.padding(5)
                            }
                        }
                        Spotlight()
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color("reeseblue"))
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            NavigationStack {
                NewsFeed()
            }
            .tabItem {
                Label("News", systemImage: "newspaper.fill")
            }

            NavigationStack {
                BookList()
            }
            .tabItem {
                Label("Books", systemImage: "books.vertical.fill")
            }

            NavigationStack {
                Activities()
            }
            .tabItem {
                Label("Activities", systemImage: "paintpalette.fill")
            }

            NavigationStack {
                Help()
            }
            .tabItem {
                Label("Help", systemImage: "exclamationmark.triangle.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
