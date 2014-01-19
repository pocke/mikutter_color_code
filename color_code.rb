# -*- coding: utf-8 -*-

# Copyright 2013-2014, pocke
# Licensed MIT
# http://opensource.org/licenses/mit-license.php

Plugin.create(:color_code) do
  filter_message_background_color do |mp, color|
    unless mp.to_message.system? then
      mp.to_message[:entities][:hashtags].each do |tag|
        text = tag[:text]
        if /^[0-9a-fA-F]{6}$/ =~ text then
          color = text.scan(/.{2}/).map{|t| t.hex << 8}
        end
      end
    end
    [mp, color]
  end
end
