//
//  ContentView.swift
//  StarterChatbot
//
//  Created by Atul Parida on 06/06/23.
//  changes by me
//



import SwiftUI



struct ContentView: View {

    @State private var messageText = ""

    // the text currently inside our box

    @State var messages: [String] = ["[Bot] bot is not typing..."]

    // the list of all messages in our chat

    

    

    var body: some View {

        VStack {

            //Our app header and probably an icon.

            HStack {

                Text("VeryCoolBot")

                    .font(.title)

                    .fontWeight(.black)

                    .foregroundColor(.black)

                Image(systemName: "circle.grid.hex")

                    .foregroundColor(Color(hue: 0.708, saturation: 0.716, brightness: 0.734))

                    .font(.system(size: 25))

                

                

            }

            

            HStack {

                Text("Beta 0.0.1")

                    .font(.caption)

                    .fontWeight(.medium)

                    .foregroundColor(.black)

                    .foregroundColor(Color(hue: 0.708, saturation: 0.716, brightness: 0.734))

                    .font(.system(size: 25))

                

            }

            

            

            //This is where our messages go!

            ScrollView {

                // We're going to go through the list of all messages and show them on the screen.

                ForEach(messages, id: \.self) { message in

                    if message.contains("USER") {

                        HStack {

                            //HStacks! They go from left to right i.e. the first item is the leftmost item.

                            Spacer()

                            // Moves the text to the right.

                            Text(message.replacingOccurrences(of:"[USER]", with:""))

                                .foregroundColor(Color.white)

                                .padding()

                                .background(Color.blue.opacity(0.8))

                                .cornerRadius(180)

                                .font(.system(size: 14.5))

                

                            

                        }

                        

                        .padding()

                    }

                    else {

                        HStack {

                            Text(message.replacingOccurrences(of:"[Bot]", with:""))

                                .padding()

                                .background(Color.gray.opacity(0.2))

                                .cornerRadius(180)

                                .font(.system(size: 14.5))



                            Spacer()

                    

                            // Moves the text to the left.

                        }

                        

                        .padding()

                    }

                    

                }.rotationEffect(.degrees(180))

            }.rotationEffect(.degrees(180))

                .background(Color.white)

            // rotates the text boxes inside, brings them to the bottom of the screen

            

            // Our text message box and send button

            HStack {

                TextField("Type something!", text: $messageText, onCommit: {

                        sendMessage(message: messageText)

                })

                .padding()

                .background(Color.gray.opacity(0.1))

                .cornerRadius(180)

                Button {

                    // sends a message to the chatbot

                    sendMessage(message: messageText)

                } label: {

                    Image(systemName: "paperplane.fill")

                    // This acts as your send button

                }

            }

            .padding()

        }

    }

    

    func sendMessage(message: String) {

        if !message.isEmpty {

            //if the message is empty, we don't respond.

            withAnimation {

                messages.append("[USER]" + " " + message)

            }

            // Adds the user message to the list of all messages.

            withAnimation {

            

                self.messageText = ""

                

            }

            // Resets the text in our message box.

            messages.append("[Bot]" + " " + getBotResponse(message: message))

            // Gets the bot's response and adds it to the list of messages.

            

            

    

        }

    }

    

}



struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()

        // This allows us to see a live preview of our design!

    }

}
