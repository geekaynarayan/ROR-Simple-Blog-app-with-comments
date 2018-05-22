class PagesController < ApplicationController
	def about
		@content = 'this is a content variable coming from server for About Us'
	end
end
