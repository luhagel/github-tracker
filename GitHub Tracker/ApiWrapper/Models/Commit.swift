//
//  Commit.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/14/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import Foundation

struct CommitAuthor {
    let name: String
    let email: String
    let date: String
}

struct Committer {
    let name: String
    let email: String
    let date: String
}

struct CommitTree {
    let url: String
    let sha: String
}

struct  CommitVerification {
    let verified: Bool
    let reason: String
    let signature: String
    let payload: String
}

struct CommitParent {
    let url: String
    let sha: String
}

struct CommitStats {
    let additions: Int
    let deletions: Int
    let changes: Int
}

struct CommitFile {
    let filename: String
    let additions: Int
    let deletions: Int
    let changes: Int
    let status: String
    let rawURL: String
    let blobURL: String
    let patch: String
}

struct compactCommit {
    let url: String
    let author: CommitAuthor
    let committer: Committer
    let message: String
    let tree: CommitTree
    let commentsCount: Int
    let verification: CommitVerification
}

struct Commit {
    let url: String
    let sha: String
    let htmlURL: String
    let commentsURL: String
    let commit: compactCommit
    let author: CompactGithubUser
    let committer: CompactGithubUser
    let parents: [CommitParent]
    let stats: CommitStats
    let files: [CommitFile]
}
