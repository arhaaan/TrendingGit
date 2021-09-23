//
//  Item.swift
//  Trending Git
//
//  Created by Karim Arhan on 22/09/21.
//  Copyright © 2021 Karim Arhan. All rights reserved.
//

import Foundation

struct Item: Codable {
    var id: Int?
    var name, fullName: String?
    var itemPrivate: Bool?
    var owner: Owner?
    var html_url: String?
    var description: String?
    var fork: Bool?
    var url: String?
    var forksURL: String?
    var keysURL, collaboratorsURL: String?
    var teamsURL, hooksURL: String?
    var issueEventsURL: String?
    var eventsURL: String?
    var assigneesURL, branchesURL: String?
    var tagsURL: String?
    var blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    var statusesURL: String?
    var languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    var subscriptionURL: String?
    var commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    var contentsURL, compareURL: String?
    var mergesURL: String?
    var archiveURL: String?
    var downloadsURL: String?
    var issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    var labelsURL, releasesURL: String?
    var deploymentsURL: String?
    var createdAt, updatedAt, pushedAt: Date?
    var gitURL, sshURL: String?
    var cloneURL: String?
    var svnURL: String?
    var homepage: String?
    var stargazers_count: Int
    var language: String?
    var hasIssues, hasProjects, hasDownloads, hasWiki: Bool?
    var hasPages: Bool?
    var forksCount: Int?
    var archived, disabled: Bool?
    var openIssuesCount: Int?
    var allowForking: Bool?
    var forks: Int
    var openIssues, watchers: Int?
    var score: Int?
}
