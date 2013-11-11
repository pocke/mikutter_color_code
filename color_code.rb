# -*- coding: utf-8 -*-

# Copyright 2013, pocket
# Licensed MIT
# http://opensource.org/licenses/mit-license.php

Plugin.create(:color_code) do

  filter_message_background_color do | mp, color |
    if !mp.to_message.system? then
      hashtags = mp.to_message[:entities][:hashtags]
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
