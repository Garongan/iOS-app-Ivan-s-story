//
//  Data.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 16/05/25.
//

import Foundation

let greeting = "Hello, I am"
let name = "Ivan Sunjaya"
let caption = "Im interested in sports and speak korean also in free time i do my hobby"

struct Personality: Identifiable {
    let id: UUID = UUID()
    let animation: String
    let icon: String
    let label: String
    let title: String
    let description: String
}

let personalties: [Personality] = [
    Personality(animation: "smile-animated", icon: "face.smiling", label: "Cheerfull", title: "My personality", description: "Always full of positive energy, my friend lights up every room with their cheerful spirit. Their smile is contagious, their laughter sincere the kind of person who makes even ordinary moments feel joyful and bright."),
    Personality(animation: "eksplorer-animated", icon: "figure.hiking.circle", label: "Eksplorer", title: "I'd love to explore", description: "My friend is someone with a curious spirit always eager to explore new things, from places and stories to ideas and perspectives. For them, each day is an opportunity to discover something inspiring and see the world in a different light."),
    Personality(animation: "sports-animated", icon: "soccerball", label: "Sports", title: "Im interested in sports", description: "Passionate about sports, my friend thrives on the energy, discipline, and excitement that come with every game. Whether it's playing on the field or following their favorite team, sports are more than just a hobby they're a way to stay active, connected, and inspired."),
    Personality(animation: "korean-animated", icon: "globe", label: "Korean", title: "I'm currently learning Korean", description: "With a love for language and culture, my friend enjoys learning Korean not just the words, but the stories, expressions, and traditions behind them. For them, studying Korean is a fun and meaningful way to connect with a whole new world.")
]

let images = ["ProfilePic1", "ProfilePic2", "ProfilePic3"]

let storyPages: [String] = [
    "I’m a code lover who enjoys building, not designing — currently diving into Swift after PHP, JS, Python, and Java.",
    "Joining a campus organization for the first time taught me how to connect with people beyond the code.",
    "Silence is my coding zone, but when I need a vibe, I turn NIKI's albums in spotify, or Hospital Playlist in Netflix.",
    "My dream is to work at Google — to grow, be challenged, and create something meaningful.",
    "From introvert to communicator, I’m learning to step up, speak out, and own my journey.",
    "Congrats you already read the story!"
]

let globalDelayAnimation: Double = 0.5
