//
//  User.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/13/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import Foundation

struct GithubUser {
    var id: Int
    var login: String
    var avatarURL: String?
    var gravatarId: String?
    var apiURL: String
    var profileURL: String
    var followersURL: String
    var followingURL: String
    var gistsURL: String?
    var starredURL: String?
    var subscriptionsURL: String
    var reposURL: String
    var eventsURL: String
    var receivedEventsURL: String
    var type: String
    var siteAdmin: Bool
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var hireable: Bool
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var followers: Int
    var following: Int
    var createdAt: String
    var updatedAt: String
    
    public init(id: Int, login: String, avatarURL: String?, gravatarId: String?, apiURL: String, profileURL: String, followersURL: String, followingURL: String, gistsURL: String?, starredURL: String?, subscriptionsURL: String, reposURL: String, eventsURL: String, receivedEventsURL: String, type: String, siteAdmin: Bool, name: String?, company: String?, blog: String?, location: String?, email: String?, hireable: Bool, bio: String?, publicRepos: Int, publicGists: Int, followers: Int, following: Int, createdAt: String, updatedAt: String) {
        self.id = id
        self.login = login
        self.avatarURL = avatarURL
        self.gravatarId = gravatarId
        self.apiURL = apiURL
        self.profileURL = profileURL
        self.followersURL = followersURL
        self.followingURL = followingURL
        self.gistsURL = gistsURL
        self.starredURL = starredURL
        self.subscriptionsURL = subscriptionsURL
        self.reposURL = reposURL
        self.eventsURL = eventsURL
        self.receivedEventsURL = receivedEventsURL
        self.type = type
        self.siteAdmin = siteAdmin
        self.name = name
        self.company = company
        self.blog = blog
        self.location = location
        self.email = email
        self.hireable = hireable
        self.bio = bio
        self.publicRepos = publicRepos
        self.publicGists = publicGists
        self.followers = followers
        self.following = following
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
