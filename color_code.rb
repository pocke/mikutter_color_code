# -*- coding: utf-8 -*-

# Copyright 2013, pocket
# Licensed MIT
# http://opensource.org/licenses/mit-license.php

Plugin.create(:color_code) do
  filter_message_background_color do |mp, color|
    if !mp.to_message.system? then
      tags = mp.to_message[:entities][:hashtags]
      tags.each do |tag|
        text = tag[:text]
        color = text.scan(/.{2}/).map{|t| t.hex << 8} if /^[0-9a-fA-F]{6,6}$/ =~ text
      end
    end
    [mp, color]
  end
end
