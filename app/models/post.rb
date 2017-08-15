class Post < ActiveRecord::Base
	validates :title, presence: true # all posts have a title
	validates :content, length: { minimum: 250 } # post content is at least 250 characters long
	validates :summary, length: { maximum: 250 } # post summary is maximum 250 characters long
	validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] } # post category is either fiction or non-fiction, requires an inclusion validator

	validate :click_bait

	def click_bait
		click_bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]

		if self.title
			unless click_bait.any? do |bait|
				self.title.include?(bait)
				end
				self.errors.add(:title, "this isn't click bait")
			end
		end
	end


end
