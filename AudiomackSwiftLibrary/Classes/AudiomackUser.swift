//
//  AudiomackUser
//  AudiomackSwiftLibrary
//
//  Created by Fitzgerald Afful on 31/10/2018.
//

import Foundation

public struct AudiomackUser: InitializableWithData, InitializableWithJson {
	var id: String = ""
	var name: String = ""
	var url_slug: String = ""
	var image: String = ""
	var hometown: String = ""
	var bio: String = ""
	var twitter: String = ""
	var facebook: String = ""
	var instagram: String = ""
	var label: String = ""
	var url: String = ""
	var genre: String = ""
	var verified: String = ""
	var updated: String = ""
	var created: String = ""
	var status: String = ""
	var video_ads: String = ""
	var follow_download: String = ""
	var favorite_music: [String] = []
	var favorite_playlists: [String] = []
	var playlists: [String] = []
	var following: [String] = []
	
	init(data: Data?) throws {
		guard let data = data,
			let jsonObject = try? JSONSerialization.jsonObject(with: data),
			let json = jsonObject as? [String: Any] else {
				throw NSError.createParseError()
		}
		try self.init(json: json)
		
	}
	
	init(json: [String : Any]) throws {
		
		if (!(json["id"] != nil)) {
			throw NSError.createParseError()
		}
		
		self.id = String.init(describing: json["id"]!)
		
		if let fav = json["favorite_playlists"] {
			self.favorite_playlists = fav as! [String]
		}
		
		if let fav = json["favorite_music"] {
			self.favorite_music = fav as! [String]
		}
		
		if let fav = json["playlists"] {
			self.playlists = fav as! [String]
		}
		
		if let fav = json["following"] {
			self.following = fav as! [String]
		}
		
		self.status = ""
		if let status_ = json["status"] as? String {
			self.status = status_
		}
		
		
		self.video_ads = ""
		if let video_ads_ = json["video_ads"] as? String {
			self.video_ads = video_ads_
		}
		
		if let follow_download_ = json["follow_download"] as? String {
			self.follow_download = follow_download_
		}
		
		if let name_ = json["name"] as? String {
			self.name = name_
		}
		
		if let image_ = json["image"] as? String {
			self.image = image_
		}
		
		if let image_ = json["image"] as? String {
			self.image = image_
		}
		
		if let hometown_ = json["hometown"] as? String {
			self.hometown = hometown_
		}
		
		if let bio_ = json["bio"] as? String {
			self.bio = bio_
		}
		
		if let twitter_ = json["twitter"] as? String {
			self.twitter = twitter_
		}
		
		if let facebook_ = json["facebook"] as? String {
			self.facebook = facebook_
		}
		
		if let instagram_ = json["instagram"] as? String {
			self.instagram = instagram_
		}
		
		if let label_ = json["label"] as? String {
			self.label = label_
		}
		
		if let url_ = json["url"] as? String {
			self.url = url_
		}
		
		if let genre_ = json["genre"] as? String {
			self.genre = genre_
		}
		
		if let verified_ = json["verified"] as? String {
			self.verified = verified_
		}
		
		if let updated_ = json["updated"] as? String {
			self.updated = updated_
		}
		
		if let created = json["created"] as? String {
			self.created = created
		}
		
	}
}


public struct AudiomackUserResponse: InitializableWithData, InitializableWithJson {
	var result: AudiomackUser
	
	init(data: Data?) throws {
		guard let data = data,
			let jsonObject = try? JSONSerialization.jsonObject(with: data),
			let json = jsonObject as? [String: Any] else {
				throw NSError.createParseError()
		}
		try self.init(json: json)
		
	}
	
	init(json: [String : Any]) throws {
		if let result_ = json["results"] as? [String: Any]{
			result = try! AudiomackUser(json: result_)
		}else {
			throw NSError.createParseError()
		}
		
	}
}

public struct AudiomackUsersResponse: InitializableWithData, InitializableWithJson {
	var results: [AudiomackUser] = []
	
	init(data: Data?) throws {
		guard let data = data,
			let jsonObject = try? JSONSerialization.jsonObject(with: data),
			let json = jsonObject as? [String: Any] else {
				throw NSError.createParseError()
		}
		try self.init(json: json)
		
	}
	
	init(json: [String : Any]) throws {
		if let results_ = json["results"] as? NSArray{
			for item in results_ {
				let user = item as? [String : Any]
				let audiomackUser = try AudiomackUser(json: user!)
				results.append(audiomackUser)
			}
		}else {
			throw NSError.createParseError()
		}
		
	}
}

