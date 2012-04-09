require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "Gist Model" do
	
	describe "Creating Gists" do

		it "should persist the Gist" do

			title = "I'm not an ambi-turner"

			Gist.create(:title => title)
			gist = Gist.where(:title => title)
			gist.first.title.should == title

		end

	end

end