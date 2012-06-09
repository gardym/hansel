require 'spec_helper'

describe 'linkify_helper' do

  include Hansel::LinkifyHelper

  let(:text) { "Here's some text that links to http://www.google.com.au" }

  it "should turn text that looks like a link to a hyperlink" do

    linkified = linkify(text)
    linkified.should include("<a target=\"_blank\" href=\"http://www.google.com.au\">http://www.google.com.au</a>")

  end

end
