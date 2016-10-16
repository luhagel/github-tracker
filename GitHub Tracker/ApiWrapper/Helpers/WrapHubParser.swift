//
//  WrapHubParser.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/15/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import Foundation
import SwiftyJSON

class WrapHubJSONParser {
    static func parseJSONToGithubUser(userJSON: JSON) -> GithubUser {
        let user: GithubUser = GithubUser(id: userJSON["id"].intValue,
                                          login: userJSON["login"].stringValue,
                                          avatarURL: userJSON["avatar_url"].stringValue,
                                          gravatarId: userJSON["gravatar_id"].stringValue,
                                          apiURL: userJSON["url"].stringValue,
                                          profileURL: userJSON["profile_url"].stringValue,
                                          followersURL: userJSON["followers_url"].stringValue,
                                          followingURL: userJSON["following_url"].stringValue,
                                          gistsURL: userJSON["gists_url"].stringValue,
                                          starredURL: userJSON["starred_url"].stringValue,
                                          subscriptionsURL: userJSON["subscriptions_url"].stringValue,
                                          reposURL: userJSON["repos_url"].stringValue,
                                          eventsURL: userJSON["events_url"].stringValue,
                                          receivedEventsURL: userJSON["received_events_url"].stringValue,
                                          type: userJSON["type"].stringValue,
                                          siteAdmin: userJSON["site_admin"].boolValue,
                                          name: userJSON["name"].stringValue,
                                          company: userJSON["company"].stringValue,
                                          blog: userJSON["blog"].stringValue,
                                          location: userJSON["location"].stringValue,
                                          email: userJSON["email"].stringValue,
                                          hireable: userJSON["hireable"].boolValue,
                                          bio: userJSON["bio"].stringValue,
                                          publicRepos: userJSON["public_repos"].intValue,
                                          publicGists: userJSON["public_gists"].intValue,
                                          followers: userJSON["followers"].intValue,
                                          following: userJSON["following"].intValue,
                                          createdAt: userJSON["created_at"].stringValue,
                                          updatedAt: userJSON["updated_at"].stringValue)
        return user
    }
    
    static func parseJSONToCompactGithubUser(userJSON: JSON) -> CompactGithubUser {
        let user: CompactGithubUser = CompactGithubUser(id: userJSON["id"].intValue,
                                                        login: userJSON["login"].stringValue,
                                                        avatarURL: userJSON["avatar_url"].stringValue,
                                                        gravatarId: userJSON["gravatar_id"].stringValue,
                                                        apiURL: userJSON["url"].stringValue,
                                                        profileURL: userJSON["profile_url"].stringValue,
                                                        followersURL: userJSON["followers_url"].stringValue,
                                                        followingURL: userJSON["following_url"].stringValue,
                                                        gistsURL: userJSON["gists_url"].stringValue,
                                                        starredURL: userJSON["starred_url"].stringValue,
                                                        subscriptionsURL: userJSON["subscriptions_url"].stringValue,
                                                        reposURL: userJSON["repos_url"].stringValue,
                                                        eventsURL: userJSON["events_url"].stringValue,
                                                        receivedEventsURL: userJSON["received_events_url"].stringValue,
                                                        type: userJSON["type"].stringValue,
                                                        siteAdmin: userJSON["site_admin"].boolValue)
        return user
    }
    
    static func parseJSONToRepository(repoJSON: JSON) -> Repository {
        var repoOwner: CompactGithubUser?
        
        WrapHub.getCompactGithubUser(userName: repoJSON["owner"]["login"].stringValue, completion: { user in
            repoOwner = user
        })
        
        let repository: Repository = Repository(id: repoJSON["id"].intValue,
                                                name: repoJSON["name"].stringValue,
                                                full_name: repoJSON["full_name"].stringValue,
                                                owner: repoOwner!,
                                                isPrivate: repoJSON["is_private"].boolValue,
                                                htmlURL: repoJSON["html_url"].stringValue,
                                                description: repoJSON["description"].stringValue,
                                                fork: repoJSON["fork"].boolValue,
                                                URL: repoJSON["url"].stringValue,
                                                forksURL: repoJSON["forks_url"].stringValue,
                                                keysURL: repoJSON["keys_url"].stringValue,
                                                collaboratorsURL: repoJSON["collaborators_url"].stringValue,
                                                teamsURL: repoJSON["teams_url"].stringValue,
                                                hooksURL: repoJSON["hooks_url"].stringValue,
                                                issueEventsURL: repoJSON["issue_events_url"].stringValue,
                                                eventsURL: repoJSON["events_url"].stringValue,
                                                assigneesURL: repoJSON["assignees_url"].stringValue,
                                                branchesURL: repoJSON["branches_url"].stringValue,
                                                tagsURL: repoJSON["tags_url"].stringValue,
                                                blobsURL: repoJSON["blobs_url"].stringValue,
                                                gitTagsURL: repoJSON["git_tags_url"].stringValue,
                                                gitTefsURL: repoJSON["git_tefs_url"].stringValue,
                                                treesURL: repoJSON["trees_url"].stringValue,
                                                statusesURL: repoJSON["statuses_url"].stringValue,
                                                languagesURL: repoJSON["languages_url"].stringValue,
                                                stargazersURL: repoJSON["stargazers_url"].stringValue,
                                                contributorsURL: repoJSON["contributors_url"].stringValue,
                                                subscribersURL: repoJSON["subscribers_url"].stringValue,
                                                subscriptionURL: repoJSON["subscription_url"].stringValue,
                                                commitsURL: repoJSON["commits_url"].stringValue,
                                                gitCommitsURL: repoJSON["git_commits_url"].stringValue,
                                                commentsURL: repoJSON["comments_url"].stringValue,
                                                issueCommentURL: repoJSON["issue_comment_url"].stringValue,
                                                contentsURL: repoJSON["contents_url"].stringValue,
                                                compareURL: repoJSON["compare_url"].stringValue,
                                                mergesURL: repoJSON["merges_url"].stringValue,
                                                archiveURL: repoJSON["archive_url"].stringValue,
                                                downloadsURL: repoJSON["downloads_url"].stringValue,
                                                issuesURL: repoJSON["issues_url"].stringValue,
                                                pullsURL: repoJSON["pulls_url"].stringValue,
                                                milestonesURL: repoJSON["milestones_url"].stringValue,
                                                notificationsURL: repoJSON["notifications_url"].stringValue,
                                                labelsURL: repoJSON["labels_url"].stringValue,
                                                releasesURL: repoJSON["releases_url"].stringValue,
                                                deploymentsURL: repoJSON["deployments_url"].stringValue,
                                                createdAt: repoJSON["created_at"].stringValue,
                                                updatedAt: repoJSON["updated_at"].stringValue,
                                                pushedAt: repoJSON["pushed_at"].stringValue,
                                                gitURL: repoJSON["git_url"].stringValue,
                                                sshURL: repoJSON["ssh_url"].stringValue,
                                                cloneURL: repoJSON["clone_url"].stringValue,
                                                svnURL: repoJSON["svn_url"].stringValue,
                                                homepage: repoJSON["homepage"].stringValue,
                                                size: repoJSON["size"].intValue,
                                                stargazersCount: repoJSON["stargazers_count"].intValue,
                                                watchersCount: repoJSON["watchers_count"].intValue,
                                                language: repoJSON["language"].stringValue,
                                                hasIssues: repoJSON["has_issues"].boolValue,
                                                hasDownloads: repoJSON["has_downloads"].boolValue,
                                                hasWiki: repoJSON["has_wiki"].boolValue,
                                                hasPages: repoJSON["has_pages"].boolValue,
                                                forksCount: repoJSON["forks_count"].intValue,
                                                mirrorURL: repoJSON["mirror_url"].stringValue,
                                                openIssuesCount: repoJSON["open_issues_count"].intValue,
                                                forks: repoJSON["forks"].intValue,
                                                openIssues: repoJSON["open_issues"].intValue,
                                                watchers: repoJSON["watchers"].intValue,
                                                defaultBranch: repoJSON["default_branch"].stringValue)
        return repository
    }
}
