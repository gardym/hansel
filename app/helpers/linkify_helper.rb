module Hansel
	module LinkifyHelper
		def linkify( text )
			generic_URL_regexp = Regexp.new( '(^|[\n ])([\w]+?://[\w]+[^ \"\n\r\t<]*)', Regexp::MULTILINE | Regexp::IGNORECASE )
			starts_with_www_regexp = Regexp.new( '(^|[\n ])((www)\.[^ \"\t\n\r<]*)', Regexp::MULTILINE | Regexp::IGNORECASE )

		  s = text.to_s
		  s.gsub!( generic_URL_regexp, '\1<a target="_blank" href="\2">\2</a>' )
		  s.gsub!( starts_with_www_regexp, '\1<a target="_blank" href="http://\2">\2</a>' )
		  s
		end
	end
	helpers LinkifyHelper
end
