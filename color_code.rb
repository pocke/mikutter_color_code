# -*- coding: utf-8 -*-

Plugin.create(:color_code) do

  filter_message_background_color do | mp, color |
    begin
      #システムメッセージにentitiesなんてない
      hashtags = mp.to_message[:entities][:hashtags]
    rescue
    else
      hashtags.each do | tag |
        val = tag[:text]
        if /^[0-9a-fA-F]{6,6}$/ =~ val then
	  color = Array.new(3)
	  3.times do |i|
	    color[i] = val[i*2,2].to_i(16) << 8
	  end
        end
      end
    end
    [mp, color]
  end

end
